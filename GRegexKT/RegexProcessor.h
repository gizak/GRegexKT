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
#include <c++/v1/regex>

class RegexProcessor {
private:
    std::string stream;
    std::regex pattern;
    
protected:
    static char* syntaxLib;
public:
    void load();
};

#endif /* defined(__GRegexKT__RegexProcessor__) */

