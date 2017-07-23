# Compatible with both Gnu make and BSD make.

# If you only need a subset of Java API, try [avian].
#
# [avian]: https://readytalk.github.io/avian

# Run `make` under `jre` directory.

default: bin lib zi rt resources zip

bin:
	@echo 'only keeps java in bin'
	@cp bin/java ./
	@rm -rf bin
	@mkdir bin
	@mv java bin/

lib:
	rm -rf lib/applet
	rm -rf lib/charsets.jar
	rm -rf lib/ext.localedata.jar
	rm -rf lib/management
	rm -rf lib/management-agent.jar
	rm -rf lib/fontconfig*
	# Only handle Linux `amd64`, pull-requests are welcome.
	@rm -rf lib/amd64/libawt.so
	@rm -rf lib/amd64/libfontmanager.so
	@rm -rf lib/amd64/libinstrument.so
	@rm -rf lib/amd64/libjawt.so
	@rm -rf lib/amd64/libjpeg.so
	@rm -rf lib/amd64/libjsoundalsa.so
	@rm -rf lib/amd64/libjsound.so
	@rm -rf lib/amd64/libmanagement.so
	@rm -rf lib/amd64/libmlib_image.so
	@rm -rf lib/amd64/libsplashscreen.so
	@rm -rf lib/amd64/xawt

zi:
	rm -rf lib/zi

rt:
	@rm -rf rt
	@mkdir rt
	@mv rt.jar rt
	@cd rt
	@unzip rt.jar
	@rm rt.jar
	@cd ..
	rm -rf rt/com/sun/corba
	rm -rf rt/com/sun/java/swing
	rm -rf rt/com/sun/imageio
	rm -rf rt/com/sun/jmx
	rm -rf rt/com/sun/rowset
	rm -rf rt/com/sun/java/util
	rm -rf rt/com/sun/media
	rm -rf rt/com/sun/org
	rm -rf rt/com/sun/swing
	rm -rf rt/com/sun/xml
	rm -rf rt/java/applet
	rm -rf rt/java/sql
	rm -rf rt/javax
	rm -rf rt/java/awt
	rm -rf rt/org
	rm -rf rt/sun/awt
	rm -rf rt/sun/applet
	rm -rf rt/sun/font
	rm -rf rt/sun/management
	rm -rf rt/sun/java2d
	rm -rf rt/sun/print
	rm -rf rt/sun/rmi
	rm -rf rt/sun/swing
	rm -rf sun/security/jgss
	rm -rf sun/security/krb5
	rm -rf sun/security/tools
	@cd rt
	@zip -r rt *
	@mv rt.zip ../rt.jar
	@cd ..
	@rm -rf rt

resources:
	@rm -rf resources
	@mkdir resources
	@mv resources.jar resources
	@cd resources
	@unzip resources.jar
	@rm resources.jar
	@cd ..
	rm -rf resources.jar/com/sun/corba
	rm -rf resources.jar/com/sun/imageio
	rm -rf resources.jar/com/sun/jndi
	rm -rf resources.jar/com/sun/org
	rm -rf resources.jar/com/sun/rowset
	rm -rf resources.jar/com/sun/servicetag
	rm -rf resources.jar/com/sun/xml
	@cd resources
	@zip -r resources *
	@mv resources.zip ../rt.jar
	@cd ..
	@rm -rf resources

xz:
	@echo 'creating mj.tar.xz'
	@tar cJf mj.tar.xz .
