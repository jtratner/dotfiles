function title() {
  case $TERM in
  screen)
    print -Pn "\ek%~:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]0;%c (%~)\a"
    ;;
  esac
}

