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

for line in `ls -tl --full-time *.md | sed -e "s/ \+/ /g"`; do
  file=`echo $line | cut -f9 -d" " | sed "s/.md//g"`
  title=`grep "title:" $file.md | cut -f2 -d":" | xargs`

  if [ "x$title" != "x" ]; then
    date=`echo $line | cut -f6 -d" "`
    echo -e "$file:\t$date\t[$title]"
    cat << HTML >> index.html
  <dt>
    <a href="./$file.html">$title</a>
    <small>
      最終更新: <time>$date</time>
    </small>
  </dt>
  <dd>
    [<a href="./$file.md">markdown</a>]
    [<a href="./$file.pdf">PDF</a>]
  </dd>
HTML
  fi
done

echo "</dl></body></html>" >> index.html

