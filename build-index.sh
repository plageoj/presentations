#! /bin/bash

cat << HTML > index.html
<!DOCTYPE html>
<html lang="ja-JP">
<head>
  <meta charset="utf-8">
  <title>PRESENTATIONS</title>
  <link rel="stylesheet" href="./style.css">
</head>
<body>
<h1>PRESENTATIONS ARCHIVE</h1>
<p>
  <img src="https://github.com/plageoj/presentations/actions/workflows/index.yml/badge.svg?branch=master"
    alt="Index build status">
</p>
<dl>
HTML

IFS=$'\n'

for file in `ls -r *.md | sed -e "s/.md//g"`; do
  title=`grep "title:" $file.md | cut -f2 -d":" | xargs`

  if [ "x$title" != "x" ]; then
    echo -e "$file:\t[$title]"
    cat << HTML >> index.html
  <dt>
    <a href="./$file.html">$title</a>
  </dt>
  <dd>
    [<a href="./$file.md">markdown</a>]
    [<a href="./$file.pdf">PDF</a>]
  </dd>
HTML
  fi
done

echo "</dl></body></html>" >> index.html

