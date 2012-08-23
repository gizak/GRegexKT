#pragma once
#include<regex>
class RegexProc
{
public:
	RegexProc(void);
	~RegexProc(void);
private:
	std::string text;
	std::string textFormat;
	std::string input;
	std::regex pattern;
public:
	virtual bool loadText(std::string str);
	void wrap(std::string tag,std::string placeholder);
	void setRegularExpression(std::string exp);//thr
	void dump(void);
    void flush(void);
    size_t count(void);
	virtual std::string getFormatText(void);
};

