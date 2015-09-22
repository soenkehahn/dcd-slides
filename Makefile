all:
	dot -Tpng call-graph.dot -o images/call-graph.png
	pandoc -t slidy -s \
		slides.md -o dcd-talk.html
