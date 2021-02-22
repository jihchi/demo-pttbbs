let removeTrailingSlash = str => str->Js.String2.replaceByRe(%re("/\/+$/"), "")
