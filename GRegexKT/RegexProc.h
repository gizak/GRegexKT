//#pragma once
//#include<string>
#include<regex>
class RegexProc
{
public:
	RegexProc(void);
	~RegexProc(void);
private:
	std::string text;
	std::string textFormat;
public:
	std::string input;
private:
	std::regex pattern;
public:
	virtual bool loadText(std::string str);
	void wrap(std::string tag,std::string placeholder);
	void setRegularExpression(std::string exp);//thr
	void dump(void);
	virtual std::string getFormatText(void);
};

