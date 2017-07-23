A Makefile to minify JRE.

The Makefile produces a minimal headless JRE
(from `~100M` to `~30M`, `~12M` compressed).
A lot of non essential classes are removed, including:

- Swing
- AWT
- Java2D
- sound
- image
- fonts
- sql
- xml
- applet
- charsets.jar
- localedata.jar
- zi
- management

Tested on openjdk-1.7.


Usage
-----

Under `openjdk-version-image/jre`:

    make

Makefile is compatible with both Gnu make and BSD make.

You need to download the openjdk source and compile it yourself.
Compiling JRE is time-consuming, so you may directly download compiled binaries.
If you use the package from your distribution, take care to install the minimal version,
without `rhino.jar` etc. The Makefile is not tuned for distributions, pull-requests are welcome.

Customization
-------------

Just edit `Makefile`.

Test
----

There is a `mjar.tar.xz` for amd64 Linux at [Releases] page.
You can test your programs with it.

[Releases]: https://github.com/weakish/minify-jre/releases

Alternatives
------------

If you only need a subset of Java API, try [avian].
It is 1.4M compressed.

[avian]: https://readytalk.github.io/avian

For Java 8, you may use [Compact Profiles][compact].

This Makefile also works with Java 7, both 64bit and 32bit,
and does not require you to compile from source.
The classes this Makefile picks is similar to `compact1`.
Unlike `compact1`, all `javax.*` classes are removed.
Some non compact1 classes does not occupy much space are left.

[compact]: https://blogs.oracle.com/jtc/entry/a_first_look_at_compact "Oracle Blog"

Reference
---------

- [Bundling a JRE](https://github.com/libgdx/libgdx/wiki/Bundling-a-JRE)
- [chandler openjdk Makefile](https://github.com/owenmorris/chandler/blob/077446a53e8b0e1a169b49d0d03ec95acd5ac1f5/external/openjdk/Makefile)
- [JEP 161: Compact Profiles](http://openjdk.java.net/jeps/161)

License
-------

The project is licensed 0BSD.

(The `mjar.tar.xz` is for provided for test, of course not part of the project.
Since it is based on OpenJDK, the license is [GPLv2 + classpath exception][gpl2ce].)

[gpl2ce]: http://openjdk.java.net/legal/gplv2+ce.html
