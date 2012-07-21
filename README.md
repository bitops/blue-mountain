Summary
=======
An example implementation of a linked list I goofed around with one
Friday night. 

As of this writing it has issues with more than ~8100
elements, that is, it does fine with holding lots of elements, but the
"each" implementation blows up around 8180 with a "stack level too
deep" error. 

I'm pretty sure this is because there's some nuance of the recursion
that I don't yet understand. Then again, that's why I wrote this! To
learn. :)
