(:
Copyright 2012 MarkLogic Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
:)
xquery version "1.0-ml";

import module namespace vh = "http://marklogic.com/roxy/view-helper"
 at "/roxy/lib/view-helper.xqy";

import module namespace uv = "http://www.marklogic.com/roxy/user-view"
 at "/app/views/helpers/user-lib.xqy";

(:declare variable $facets as item()* := vh:get("facets");:)
declare variable $view as item()* := vh:get("view");
declare variable $column3 as item()* := vh:get("column3");
declare variable $sidebar as item()* := vh:get("sidebar");
declare variable $title as xs:string? := vh:get("title");
declare variable $q as xs:string? := vh:get("q");

'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{$title}</title>
    <link href="/css/themes/ui-lightness/jquery-ui.css" type="text/css" rel="stylesheet"/>
    <link href="/css/three-column.less" type="text/css" rel="stylesheet/less"/>
    <link href="/css/app.less" type="text/css" rel="stylesheet/less"/>
    <script src="/js/lib/less-1.3.0.min.js" type='text/javascript'></script>
    <script src="/js/lib/jquery-1.7.1.min.js" type='text/javascript'></script>
    <script src="/js/lib/jquery-ui-1.8.18.min.js" type='text/javascript'></script>
    <script src="/js/three-column.js" type='text/javascript'></script>
    <script src="/js/app.js" type='text/javascript'></script>
  </head>
  <body>
    <div id="header">
      <a href="/" class="logo"/>
      <h1><a href="/">{$title}</a></h1>
      {
        uv:build-user()
      }
      <div class="search">
        <label>Search</label>
        <form id="searchform" name="searchform" method="GET" action="/">
          <input type="text" id="q" name="q" class="searchbox" value="{$q}"/>
          <div id="suggestions"><!--suggestions here--></div>
          <button type="submit" title="Run Search"><img src="/images/mt_icon_search.gif"/></button>
        </form>
      </div>
    </div>
    <div class="colmask threecol">
      <div class="colmid">
        <div class="colleft">
          <div class="col1">
            {$view}
          </div>
          <div class="col2">
            {$sidebar}
          </div>
          <div class="col3">
            {$column3}
          </div>
        </div>
      </div>
    </div>

    <div id="footer">
      <img src="/images/ml-logo.gif" style="float:right;"/>
    </div>
  </body>
</html>
