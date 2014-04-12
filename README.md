Texty
=====

Texty is a collection of simple script frontends to NLP toolkits.

Oftentimes when doing the initial stages of text analysis, you'll want
to do some quick and dirty analysis, testing various methods to see
what works for your particular application.  To help in this, there
are many excellent open source NLP tools out in the wild.  However,
each of these tools has their own pecularities, requirements, data
formats etc., and just getting your data into the right format can
take quite some time digging through documentation and Java APIs to
figure out.

This is where Texty comes in.  Texty is essentially a collection of
scripts, intended to provide a common command line frontend for NLP
tasks: POS tagging, classification, topic modeling, etc.  It leverages
a number of existing open source tools under the hood for document
conversion and algorithm implementations.  Essentially, this project
is the outcome of my frustration with having to mess with all these
tools in a nonuniform manner.

What Texty is not:

1. It does not contain any new NLP algorithms. Texty relies on
   underlying libraries to perform NLP tasks.
2. It probably won't give you the state-of-the-art answer. Texty is
   intended for rapid prototyping purposes.

## Usage

Run the `texty` script to see available commands.

Currently integrated:

1. Document categorization using OpenNLP: `texty cat`, `texty cat-train`

## Requirements

If you're in Windows, you'll need Cygwin. Otherwise, everything should be bundled with Texty.

## TODO

* Integrate more functionality
* Test in Linux

## Links

* [Apache OpenNLP](https://opennlp.apache.org)
* [MALLET](http://mallet.cs.umass.edu)
* [Apache Tika](https://tika.apache.org)

