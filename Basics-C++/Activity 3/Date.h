#ifndef Date_h
#define Date_h

#include <string>
using namespace std;

class Date
{
	private:
		int day;
		int num_month;
		int hour;
		int minute;
		int seconds;
		string string_month;
		string string_hour;
		int num_days[12] = { 31,28,31,30,31,30,31,31,30,31,30,31 };
	public:
		Date();
		Date(int day, string string_month, string string_hour);
		bool operator>(Date Date2);
		bool operator<(Date Date2);
		bool operator==(Date Date2);
		void convert_month();
		void convert_hour();
		void increase_date();
		void decrease_date();
		void print_date();
		void set_string_month(string string_month);
		void set_string_hour(string string_hour);
		void set_day(int day);
		string get_string_month();
		string get_string_hour();
		int get_day();
		int get_num_month();
		int get_hour();
		int get_minute();
		int get_seconds();
};

Date::Date()
{
	day = 0;
	num_month = 0;
	hour = 0;
	minute = 0;
	seconds = 0;
	string_month = "";
	string_hour = "";
}

Date::Date(int day, string string_month, string string_hour)
{
	this->day = day;
	this->string_month = string_month;
	this->string_hour = string_hour;
	convert_month();
	convert_hour();
}

void Date::set_day(int day)
{
	this->day = day;
}

void Date::set_string_month(string string_month)
{
	this->string_month = string_month;
	convert_month();
}

void Date::set_string_hour(string string_hour)
{
	this->string_hour = string_hour;
	convert_hour();
}

void Date::convert_month()
{
	int suma = 0;

	for (int i = 0; i < 3; i++)
	{
		suma += string_month[i];
	}
	switch (suma)
	{
		case 281:
			num_month = 1;
			break;
		case 269:
			num_month = 2;
			break;
		case 288:
			num_month = 3;
			break;
		case 291:
			num_month = 4;
			break;
		case 295:
			num_month = 5;
			break;
		case 301:
			num_month = 6;
			break;
		case 299:
			num_month = 7;
			break;
		case 285:
			num_month = 8;
			break;
		case 296:
			num_month = 9;
			break;
		case 294:
			num_month = 10;
			break;
		case 307:
			num_month = 11;
			break;
		case 268:
			num_month = 12;
			break;
	}
}

void Date::convert_hour()
{
	string concatena ="";
	for (size_t i = 0; i != string_hour.size(); i++)
	{
		if (i == 1)
		{
			concatena += string_hour[0];
			concatena += string_hour[1];
			hour = stoi(concatena);
			concatena = "";
		}
		if (i == 4)
		{
			concatena += string_hour[3];
			concatena += string_hour[4];
			minute = stoi(concatena);
			concatena = "";
		}
		if (i == 7)
		{
			concatena += string_hour[6];
			concatena += string_hour[7];
			seconds = stoi(concatena);
			concatena = "";
		}
	}
}

bool Date::operator<(Date Date2)
{
	if (num_month < Date2.get_num_month())
	{
		return true;
	}
	else
	{
		if (num_month == Date2.get_num_month())
		{
			if (day < Date2.get_day())
			{
				return true;
			}
			else
			{
				if (day == Date2.get_day())
				{
					if (hour < Date2.get_hour())
					{
						return true;
					}
					else
					{
						if (hour == Date2.get_hour())
						{
							if (minute < Date2.get_minute())
							{
								return true;
							}
							else
							{
								if (minute == Date2.get_minute())
								{
									if (seconds < Date2.get_seconds())
									{
										return true;
									}
									else
									{
										return false;
									}
								}
								else
								{
									return false;
								}
							}
						}
						else
						{
							return false;
						}
					}
				}
				else
				{
					return false;
				}
			}
		}
		else
		{
			return false;
		}
	}
}

bool Date::operator>(Date Date2)
{
	if (num_month > Date2.get_num_month())
	{
		return true;
	}
	else
	{
		if (num_month == Date2.get_num_month())
		{
			if (day > Date2.get_day())
			{
				return true;
			}
			else
			{
				if (day == Date2.get_day())
				{
					if (hour > Date2.get_hour())
					{
						return true;
					}
					else
					{
						if (hour == Date2.get_hour())
						{
							if (minute > Date2.get_minute())
							{
								return true;
							}
							else
							{
								if (minute == Date2.get_minute())
								{
									if (seconds > Date2.get_seconds())
									{
										return true;
									}
									else
									{
										return false;
									}
								}
								else
								{
									return false;
								}
							}
						}
						else
						{
							return false;
						}
					}
				}
				else
				{
					return false;
				}
			}
		}
		else
		{
			return false;
		}
	}
}

bool Date::operator==(Date Date2)
{
	return (day == Date2.get_day() && num_month == Date2.get_num_month() && hour == Date2.get_hour() && minute == Date2.get_minute() && seconds == Date2.get_seconds());
}

void Date::increase_date()
{
	seconds++;
	if (seconds == 60)
	{
		seconds = 0;
		minute++;
		if (minute == 60)
		{
			minute = 0;
			hour++;
			if (hour == 24)
			{
				hour = 0;
				day++;
				if (day == (num_days[num_month - 1] + 1))
				{
					day = 1;
					num_month++;
					if (num_month == 13)
					{
						num_month = 1;
					}
				}
			}
		}
	}
}

void Date::decrease_date()
{
	seconds--;
	if (seconds == -1)
	{
		seconds = 59;
		minute--;
		if (minute == -1)
		{
			minute = 59;
			hour--;
			if (hour == -1)
			{
				hour = 23;
				day--;
				if (day == 0)
				{
					day = num_days[num_month - 2];
					num_month--;
					if (num_month == 0)
					{
						num_month = 12;
					}
				}
			}
		}
	}
}

int Date::get_day()
{
	return day;
}

int Date::get_num_month()
{
	return num_month;
}

int Date::get_hour()
{
	return hour;
}

int Date::get_minute()
{
	return minute;
}

int Date::get_seconds()
{
	return seconds;
}

string Date::get_string_month()
{
	return string_month;
}

string Date::get_string_hour()
{
	return string_hour;
}

void Date::print_date()
{
	cout << num_month << " " << day << " " << hour << ":" << minute << ":" << seconds << endl;
}

#endif