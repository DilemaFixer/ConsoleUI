#include <ncurses.h>

int main() {
    initscr();
    printw("ncurses is work!");
    refresh();
    getch();
    endwin();
    return 0;
}
