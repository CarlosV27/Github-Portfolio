//Carlos Alberto Ramírez Viche - A00832076
//ITESM

package main

import (
	"bufio"
	"io/ioutil"
	"log"
	"os"
	"strings"
	"time"
)

func main() {

	countFiles := 0

	//Get directory path from terminal
	directory := string(os.Args[1])

	//Get out directory path from terminal
	out_directory := string(os.Args[2])

	start_secuencial := time.Now()

	//Check if the given directory exists
	_, exist_secuencial_dir := os.Stat(out_directory)

	var errorDS1 error

	//If the given directory doesn't exist create it
	if os.IsNotExist(exist_secuencial_dir) {
		errorDS1 = os.Mkdir(out_directory, os.ModePerm)
	}

	if errorDS1 != nil {
		log.Fatal(errorDS1)
	}

	//Get all files in the selected directory
	files_sequential, err1 := ioutil.ReadDir(directory)

	if err1 != nil {

		log.Fatal(err1)
	}

	file_path1 := ""

	//For each file applies the highlighter function
	for _, file1 := range files_sequential {

		//Complete path of the file
		file_path1 = directory + "\\" + file1.Name()

		sequential_highlighter(file_path1, file1.Name(), out_directory)
	}

	exe_time_sequential := time.Since(start_secuencial)

	print("Duration of the sequential program in nanoseconds: ")
	print(exe_time_sequential.Nanoseconds())
	print("\n")

	//Remove created files to avoid duplicate because in this case we just need the execution time of the program
	err_deleted := os.RemoveAll(out_directory)
	if err_deleted != nil {
		log.Fatal(err_deleted)
	}

	start_concurrent := time.Now()

	//Check if the given directory exists
	_, exist_concurrent_dir := os.Stat(out_directory)

	var errorDS2 error

	//If the given directory doesn't exist create it
	if os.IsNotExist(exist_concurrent_dir) {
		errorDS2 = os.Mkdir(out_directory, os.ModePerm)

	}

	if errorDS2 != nil {
		log.Fatal(errorDS2)
	}

	files_concurrent, err2 := ioutil.ReadDir(directory)

	if err2 != nil {

		log.Fatal(err2)
	}

	file_path2 := ""

	finished := make(chan bool)

	//For each file applies the highlighter function
	for _, file2 := range files_concurrent {

		//Complete path of the file
		file_path2 = directory + "\\" + file2.Name()
		countFiles++
		go concurrent_highlighter(file_path2, finished, out_directory, file2.Name())
	}

	end_concurrency(finished, countFiles)

	exe_time_concurrent := time.Since(start_concurrent)

	print("Duration of the cocurrent program in nanoseconds: ")
	print(exe_time_concurrent.Nanoseconds())
	print("\n")
}

func end_concurrency(upstream chan bool, cantArchivos int) {

	contador := 0
	for {

		listo := <-upstream
		if listo {
			contador++
		}

		if contador == cantArchivos {
			return
		}

	}
}

func concurrent_highlighter(file string, downstream chan bool, out_directory string, file_name_ string) {

	file_path := file

	file_name := file_name_

	input_file, errE := ioutil.ReadFile(file_path)

	if errE != nil {
		log.Fatal(errE)
	}

	code_lines := string(input_file)

	lector := bufio.NewReader(strings.NewReader(code_lines))

	out_file := ""

	if strings.Contains(file_name, "txt") {
		out_file = strings.ReplaceAll(file_name, "txt", "html")
	}

	if strings.Contains(file_name, "py") {
		out_file = strings.ReplaceAll(file_name, "py", "html")
	}

	out_dir := out_directory

	out_file_path := out_dir + "\\" + out_file

	out, errS := os.Create(out_file_path)

	if errS != nil {
		log.Fatal(errS)
	}

	defer out.Close()

	NUM := 100 //Number
	CQC := 101 //Any other character
	OPE := 102 //Operator
	COM := 103 //Comment
	STR := 104 //String
	TAB := 105 //Tab key
	ENT := 106 //Enter key
	ESP := 107 //Space
	NMF := 108 //Function Name
	DEL := 109 //Delimiter
	FIN := 112 //End

	MT := [][]int{
		{1, 3, OPE, 4, 5, 3, ESP, TAB, ENT, DEL, FIN},
		{1, 2, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM},
		{2, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM},
		{3, 3, CQC, CQC, CQC, 3, CQC, CQC, CQC, CQC, CQC},
		{4, 4, 4, 4, 4, 4, 4, 4, COM, 4, COM},
		{5, 5, 5, 5, 6, 5, 5, 5, STR, 5, STR},
		{STR, STR, STR, STR, 7, STR, STR, STR, STR, STR, STR},
		{7, 7, 7, 7, 8, 7, 7, 7, 7, 7, STR},
		{7, 7, 7, 7, 9, 7, 7, 7, 7, 7, STR},
		{7, 7, 7, 7, STR, 7, 7, 7, 7, 7, STR},
	}

	MT2 := []int{1, NMF, NMF, NMF, NMF, 1, NMF, NMF, NMF, NMF}

	create_header(out)

	state := 0
	word := ""
	tokens := []int{}
	read := true

	var c rune

	html_content := "<p>"

	for {
		for state < 100 {
			if read {
				c, _, _ = lector.ReadRune()
			} else {
				read = true
			}
			state = MT[state][filter(string(c))]
			if string(c) == "\x00" && int(c) == 10 && (state == 7 || state == 8 || state == 9) {
				word += "</p>"
				word += "<p>"
			}
			if state < 100 && state != 0 {
				word += string(c)
			}
		}
		if state == NUM {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '0098FB'>"
			html_content += word
			html_content += "</font>"
			tokens = append(tokens, state)
		}
		if state == CQC {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			if len(tokens) == 0 {
				wordR := ""
				if strings.Contains(word, ":") {
					for i := 0; i < len(word); i++ {
						if word[i] != ':' {
							wordR += string(word[i])
						}
					}
					if reserved_word(wordR) {
						word = ":"
						html_content += "<strong><font color = 'C10F09'>"
						html_content += wordR
						html_content += "</font></strong>"
					}
				}
			}
			if reserved_word(word) && (string(c) == " " || string(c) == "" || int(c) == 10 || int(c) == 9 || string(c) == ":") {
				html_content += "<strong><font color = 'C10F09'>"
				html_content += word
				html_content += "</font></strong>"
				if word == "def" || word == "class" {
					html_content += " "
					state = 0
					nombFunc := ""
					read = true
					for state < 100 {
						if read {
							c, _, _ = lector.ReadRune()
						} else {
							read = true
						}
						state = MT2[filter(string(c))]
						if string(c) == "(" || string(c) == ":" {
							state = NMF
						}
						if state < 100 && state != 0 {
							nombFunc += string(c)
						}
					}
					if state == NMF {
						html_content += "<strong>"
						html_content += "<font color = '0909C1'>"
						html_content += nombFunc
						html_content += "</strong>"
						html_content += "</font>"
						read = false
						continue
					}
				}
			} else {
				html_content += "<font color = '000000'>"
				html_content += word
				html_content += "</font>"
			}
		}
		if state == OPE {
			word += string(c)
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = 'FF6C00'>"
			html_content += word
			html_content += "</font>"
		}
		if state == DEL {
			word += string(c)
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '000000'>"
			html_content += word
			html_content += "</font>"
		}
		if state == COM {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '979797'>"
			html_content += word
			html_content += "</font>"
		}
		if state == STR {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '4CC109'>"
			html_content += word
			html_content += "</font>"
		}
		if state == ESP {
			html_content += "&nbsp;&nbsp;"
			tokens = nil
		}
		if state == ENT {
			html_content += "</p>"
			html_content += "<p>"
			tokens = nil
		}
		if state == TAB {
			html_content += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			tokens = nil
		}
		if state == FIN {
			html_content += "</p>"
			break
		}
		word = ""
		state = 0
	}

	_, errSF := out.WriteString(html_content)

	if errSF != nil {
		log.Fatal(errSF)
	}

	end_html_page(out)

	downstream <- true
}

func sequential_highlighter(file string, file_name_ string, out_directory string) {

	file_path := file

	file_name := file_name_

	input_file, errE := ioutil.ReadFile(file_path)

	if errE != nil {
		log.Fatal(errE)
	}

	code_lines := string(input_file)

	lector := bufio.NewReader(strings.NewReader(code_lines))

	out_file := ""

	if strings.Contains(file_name, "txt") {
		out_file = strings.ReplaceAll(file_name, "txt", "html")
	}

	if strings.Contains(file_name, "py") {
		out_file = strings.ReplaceAll(file_name, "py", "html")
	}

	out_dir := out_directory

	out_file_path := out_dir + "\\" + out_file

	out, errS := os.Create(out_file_path)

	if errS != nil {
		log.Fatal(errS)
	}

	defer out.Close()

	NUM := 100 //Number
	CQC := 101 //Any other character
	OPE := 102 //Operator
	COM := 103 //Comment
	STR := 104 //String
	TAB := 105 //Tab key
	ENT := 106 //Enter key
	ESP := 107 //Space
	NMF := 108 //Function Name
	DEL := 109 //Delimiter
	FIN := 112 //End

	MT := [][]int{
		{1, 3, OPE, 4, 5, 3, ESP, TAB, ENT, DEL, FIN},
		{1, 2, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM},
		{2, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM, NUM},
		{3, 3, CQC, CQC, CQC, 3, CQC, CQC, CQC, CQC, CQC},
		{4, 4, 4, 4, 4, 4, 4, 4, COM, 4, COM},
		{5, 5, 5, 5, 6, 5, 5, 5, STR, 5, STR},
		{STR, STR, STR, STR, 7, STR, STR, STR, STR, STR, STR},
		{7, 7, 7, 7, 8, 7, 7, 7, 7, 7, STR},
		{7, 7, 7, 7, 9, 7, 7, 7, 7, 7, STR},
		{7, 7, 7, 7, STR, 7, 7, 7, 7, 7, STR},
	}

	MT2 := []int{1, NMF, NMF, NMF, NMF, 1, NMF, NMF, NMF, NMF}

	create_header(out)

	state := 0
	word := ""
	tokens := []int{}
	read := true

	var c rune

	html_content := "<p>"

	for {
		for state < 100 {
			if read {
				c, _, _ = lector.ReadRune()
			} else {
				read = true
			}
			state = MT[state][filter(string(c))]
			if string(c) == "\x00" && int(c) == 10 && (state == 7 || state == 8 || state == 9) {
				word += "</p>"
				word += "<p>"
			}
			if state < 100 && state != 0 {
				word += string(c)
			}
		}
		if state == NUM {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '0098FB'>"
			html_content += word
			html_content += "</font>"
			tokens = append(tokens, state)
		}
		if state == CQC {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			if len(tokens) == 0 {
				wordR := ""
				if strings.Contains(word, ":") {
					for i := 0; i < len(word); i++ {
						if word[i] != ':' {
							wordR += string(word[i])
						}
					}
					if reserved_word(wordR) {
						word = ":"
						html_content += "<strong><font color = 'C10F09'>"
						html_content += wordR
						html_content += "</font></strong>"
					}
				}
			}
			if reserved_word(word) && (string(c) == " " || string(c) == "" || int(c) == 10 || int(c) == 9 || string(c) == ":") {
				html_content += "<strong><font color = 'C10F09'>"
				html_content += word
				html_content += "</font></strong>"
				if word == "def" || word == "class" {
					html_content += " "
					state = 0
					nombFunc := ""
					read = true
					for state < 100 {
						if read {
							c, _, _ = lector.ReadRune()
						} else {
							read = true
						}
						state = MT2[filter(string(c))]
						if string(c) == "(" || string(c) == ":" {
							state = NMF
						}
						if state < 100 && state != 0 {
							nombFunc += string(c)
						}
					}
					if state == NMF {
						html_content += "<strong>"
						html_content += "<font color = '0909C1'>"
						html_content += nombFunc
						html_content += "</strong>"
						html_content += "</font>"
						read = false
						continue
					}
				}
			} else {
				html_content += "<font color = '000000'>"
				html_content += word
				html_content += "</font>"
			}
		}
		if state == OPE {
			word += string(c)
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = 'FF6C00'>"
			html_content += word
			html_content += "</font>"
		}
		if state == DEL {
			word += string(c)
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '000000'>"
			html_content += word
			html_content += "</font>"
		}
		if state == COM {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '979797'>"
			html_content += word
			html_content += "</font>"
		}
		if state == STR {
			read = false
			if len(tokens) > 0 {
				html_content += "</font>"
			}
			html_content += "<font color = '4CC109'>"
			html_content += word
			html_content += "</font>"
		}
		if state == ESP {
			html_content += "&nbsp;&nbsp;"
			tokens = nil
		}
		if state == ENT {
			html_content += "</p>"
			html_content += "<p>"
			tokens = nil
		}
		if state == TAB {
			html_content += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			tokens = nil
		}
		if state == FIN {
			html_content += "</p>"
			break
		}
		word = ""
		state = 0
	}

	_, errSF := out.WriteString(html_content)

	if errSF != nil {
		log.Fatal(errSF)
	}

	end_html_page(out)

}

func create_header(out *os.File) {

	html_content := `<!DOCTYPE html>
				<html>
					<head>
						<title> Act. 5.3 </title>
						<style>
							h1, h3 {
								font-weight: bold;
								font-family: Verdana, Arial, sans-serif;
							}
							
							p {
								font-family: Verdana, Arial, sans-serif;
							}
						</style>
					</head>
					<body>
						<h1> Resaltador de sintaxis paralelo </h1>
						<br>
						<h3> Carlos Alberto Ramírez Viche - A00832076 </h3>
						<br>`

	_, err2 := out.WriteString(html_content)

	if err2 != nil {
		log.Fatal(err2)
	}
}

func end_html_page(out *os.File) {

	html_content := `</body>
				  </html>`

	_, err := out.WriteString(html_content)

	if err != nil {
		log.Fatal(err)
	}

	out.Close()
}

func reserved_word(c string) bool {

	if c == "if" || c == "elif" || c == "else" || c == "while" || c == "for" || c == "break" || c == "continue" || c == "False" || c == "True" || c == "None" || c == "def" || c == "return" || c == "lambda" || c == "pass" || c == "yield" || c == "class" || c == "assert" || c == "try" || c == "except" || c == "finally" || c == "raise" || c == "global" || c == "nonlocal" || c == "from" || c == "import" || c == "in" || c == "is" || c == "del" || c == "with" || c == "as" || c == "async" || c == "await" || c == "and" || c == "or" {
		return true
	}

	return false
}

func filter(c string) int {

	just_this_case := []byte(c)
	if string(c) == "0" || string(c) == "1" || string(c) == "2" || string(c) == "3" || string(c) == "4" || string(c) == "5" || string(c) == "6" || string(c) == "7" || string(c) == "8" || string(c) == "9" {
		return 0
	} else if string(c) == "." {
		return 1
	} else if string(c) == "+" || string(c) == "-" || string(c) == "*" || string(c) == "^" || string(string(c)) == "==" || string(c) == ">" || string(c) == "<" || string(c) == "=" || string(c) == "%" || string(c) == "/" {
		return 2
	} else if string(c) == "#" {
		return 3
	} else if string(c) == "'" || string(string(c)) == "\"" {
		return 4
	} else if string(c) == "\x00" {
		return 10
	} else if string(c) == " " {
		return 6
	} else if int(just_this_case[0]) == 9 {
		return 7
	} else if int(just_this_case[0]) == 10 {
		return 8
	} else if string(c) == "(" || string(c) == ")" || string(c) == "," || string(c) == "[" || string(c) == "]" || string(c) == "{" || string(c) == "}" || string(c) == ":" {
		return 9
	}
	return 5

}
