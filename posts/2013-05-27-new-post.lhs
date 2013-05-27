---
date: 2013-05-27
tags: code, functional-programming, haskell, hakyll
title: (Literate) Haskell script to create a new Hakyll post
---

This is my first post after quite a long absence.  A lot has happened:

* I got married.
* I've spent a lot of time with functional programming languages, particularly
  [Clojure](http://clojure.org), which I used to create the website we used to
  manage the aforementioned wedding.
* I've switched this blog from [Jekyll](http://jekyllrb.com) to
  [Hakyll](http://jaspervdj.be/hakyll) (And thus its configuration from Ruby to
  Haskell).

It is about this last point that I intend to write now.  I will spare you the
usual introduction about what Haskell is, as there are plenty of resources from
which you could glean that.  I will talk a little bit about why I decided to
make the switch though, before walking through a little helper utility which I
hope will come in handy.

From Jekyll to Hakyll
---------------------

Although I had enjoyed setting up and using Jekyll, I was starting to get a
little fed up of it -- through no fault of its own, really.  In the interests of
getting up and running quickly, I used [Octopress](http://octopress.org) to get
started, downloaded a [nice, minimal theme](https://github.com/kui/k-ui-octopress-theme)
by [k-ui](http://k-ui.jp) (from which my current theme still draws influence),
and started tweaking it to fit my needs.

The problem was, I had downloaded this big system that did everything for me,
and I soon came across problems I didn't know how to solve.  Probably if I'd
taken more time with Jekyll I could have figured it out, but I ended up
neglecting the site for quite a while to work on the wedding site, and by the
time I got back to it I was looking for something new.

I considered writing my own, probably in Clojure, but then I came across Hakyll
and thought it would give me the excuse I've been looking for to give Haskell a
try.  It offers less "out of the box" than Octopress did (not sure about
Jekyll), so I have to set up quite a lot of the basic stuff myself, which means
that I come out understanding it much better.  Well, that's the idea, anyway.

One of the things I did like about Octopress, though, was that it came with some
useful shortcuts.  I don't really want to have to look up the date and write it
out every time I write a new post; I'd rather just say "new post", give it a
title, and start writing.  As far as I can tell, Hakyll doesn't provide this
functionality -- nor should it, necessarily; its job is to compile my site.

So I thought this would be an opportunity to have a go at writing a simple
utility in Haskell that isn't just a glorified configuration file.  Really this
sort of thing would usually be the job of a shell script, so it may be somewhat
outside of Haskell's usual problem domain, but I figured I'd give it a go.

Literate Haskell
----------------

This is one feature of Haskell that is pretty interesting: there is language
support for writing "literate" Haskell files; that is, files which read like
documentation with the occasional code snippet, but those code snippets can be
compiled.

This way of writing code has become fairly popular recently, with Literate
Python and Literate Coffeescript among others, but Haskell supports it natively.
The idea has some heritage; Miranda, an earlier functional language from which
Haskell draws a lot of ideas, supports it, and the idea was first implemented by
Donald Knuth in the form of WEB/CWEB.

Intrigued by the idea, I decided to write the "new post" script in a literate
style, and the result is this blog post!  You can copy and paste this page
directly (either from the html or the markdown source), and the compiler will
ignore the blog post and compile the included code.  Lines beginning with "bird
markers" (> symbols at the start of lines, like quoted messages in an email) are
interpreted by the compiler as part of the source code; anything else is
ignored.

The script
----------

Haskell's literate programming system doesn't allow code to be written
out-of-order, so I will go through this step-by-step.  Bear in mind that this is
my first piece of "proper" Haskell code; it might be really bad!  If you are a
beginner like me you should probably try to find some more informed sources
before you copy any of this stuff.  If you know what you're doing and you spot
any silly mistakes / poor style, please let me know, or even submit a pull
request on github and show me what's wrong with it!  I am writing this post to
learn, not to teach.

With that caveat out the way, first I'll import the necessary modules.

> import System.Environment

We need `System.Environment` for getArgs, which returns us a list of
command-line arguments.

Then the main function:

> main :: IO ()
> main = do
>   list <- getArgs
>   print list

And we're done!

