
# Takes man page and outputs to pdf viewer
# example:
#     $ manpdf ls
function manpdf() { man -t $@ | open -f -a Preview; }

