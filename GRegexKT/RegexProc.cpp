#include "RegexProc.h"
#include <iostream>

RegexProc::RegexProc(void)
{
}


RegexProc::~RegexProc(void)
{
}


bool RegexProc::loadText(std::string str)
{
	text=str;
	return true;
}


void RegexProc::setRegularExpression(std::string exp)
{
	input=exp;
	pattern.assign(input);
}


void RegexProc::wrap(std::string tag,std::string placeholder="$0")
{
	textFormat=std::regex_replace(text,pattern,tag);
}

std::string RegexProc::getFormatText(void)
{
	if(textFormat.length()==0)
	{
		wrap("<span class='re'>$0</span>");//default
	}
	return textFormat;
}

void RegexProc::dump()
{
	std::cout<<"text : "<<text<<std::endl;
	std::cout<<"format-text : "<<textFormat<<std::endl;
	std::cout<<"regular-expression : "<<input<<std::endl;	
}