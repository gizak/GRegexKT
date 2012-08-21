//
//  RegexProcessor.h
//  GRegexKT
//
//  Created by Do'Urden Gizak on 12-8-21.
//  Copyright (c) 2012年 Do'Urden Gizak. All rights reserved.
//

#ifndef __GRegexKT__RegexProcessor__
#define __GRegexKT__RegexProcessor__

#include <iostream>
#include <regex>

class RegexProcessor {
private:
    std::string stream;
    std::regex  pattern;
    std::string formatStream;
    std::string htmlStream;
protected:
    static const char* cssSpan;
    static const char* cssStyle;
    static const char* jsLib;
    static const char* htmlWrap;
    void wrapResults();
    void assemble();
public:
    void loadStream(std::string str);
    void setRegex(std::string re);
    //void addJS(std::string js);
    std::string getHtmlStream();
    RegexProcessor(std::string str);
};

#endif /* defined(__GRegexKT__RegexProcessor__) */

