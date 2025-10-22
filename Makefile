.DEFAULT_GOAL=toc

GITROOT=$(shell git rev-parse --show-toplevel)
include $(shell test -d $(GITROOT)/include.mk/ || git clone git@github.com:smaslennikov/include.mk.git && echo $(GITROOT))/include.mk/*.mk

dependencies:
	bundle install

local-jekyll:
	bundle exec jekyll serve
