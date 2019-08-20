.PHONY: all clean run

all: analog-read-serial.html dimmer.html animate.css application.css application.js sven.png

%.html: src/%.html template-a template-b
	cat "template-a" "$<" "template-b" > "$@"

template-a template-b: src/template.html
	split -a 1 -p "split" "$<" "template-"

animate.css application.css application.js sven.png: src/animate.css src/application.css src/application.js src/sven.png
	cp $^ .

clean:
	rm -f template-{a,b} *.css *.html *.js *.png

run: analog-read-serial.html dimmer.html
	open -b "com.google.Chrome" $^
