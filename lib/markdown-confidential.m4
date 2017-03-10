define(OPENING_BRACKET, `changequote()[changequote([,])')dnl
define(CLOSING_BRACKET, `changequote()]changequote([,])')dnl
changequote([,])dnl
define([PARAM], [OPENING_BRACKET()$[]$1[]CLOSING_BRACKET()])dnl
include(strings.m4)dnl
dnl
define([MEETING_MINUTES], [dnl
$1 $2
===========================

* MARKDOWN_TEXT_STARTING_TIME[]: $3
* MARKDOWN_TEXT_ATTENDING[]: $4
* MARKDOWN_TEXT_ABSENT[]: $5
* MARKDOWN_TEXT_MINUTE_TAKER[]: $6])dnl
dnl
define([VOTE_ADOPTED],  [MARKDOWN_TEXT_ADOPTED ($1|$2|$3)])dnl
define([VOTE_REJECTED], [MARKDOWN_TEXT_REJECTED ($1|$2|$3)])dnl
dnl
define([RESOLUTION],        [__$1 $2:__ ifelse([$4], [], [$3], [$3 ($4)])[]dnl
ifelse([$5], [], [], [[,] $5])])dnl
dnl
define([_NOTES_template], [[ifelse(]][PARAM([$1])][[,[],[],[. ]]]dnl
[PARAM($1)][[)]])dnl
define([_TODO_template],  [[ifelse(]][PARAM(2)]dnl
[[,[],[[__]$1[:__]],[[__]$1[ ]]]][PARAM(2)][[[[:__]]) ]][PARAM(3)])dnl
define([TODO],        _TODO_template([MARKDOWN_TEXT_TODO])_NOTES_template(4))dnl
define([DONE],        [[~~]]_TODO_template([MARKDOWN_TEXT_DONE])[[~~]]_NOTES_template(4))dnl
dnl
define([CONFIDENTIAL], [divert(0)])dnl
define([REPLACE_WITH], [divert(-1)])dnl
define([END_CONFIDENTIAL], [divert(0)])dnl
dnl
define([END], [MARKDOWN_TEXT_END $1])dnl
dnl
dnl vim: set ft=m4 tw=80 et sw=1 ts=1 sts=1: