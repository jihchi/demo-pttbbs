// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as MainLayout from "./layouts/MainLayout.js";
import * as Router from "next/router";

function $$default(props) {
  var component = props.Component;
  var pageProps = props.pageProps;
  Router.useRouter();
  var content = React.createElement(component, pageProps);
  return React.createElement(MainLayout.make, {
              children: React.createElement("div", {
                    className: "flex justify-center"
                  }, React.createElement("div", {
                        className: "max-w-705 w-full"
                      }, content))
            });
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
