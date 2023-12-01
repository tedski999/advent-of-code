#include <stdio.h>
#include <limits.h>

#define LEN 1024
static char BUF[LEN];

int main() {
	unsigned sum = 0, l = 0, r = 0;
	unsigned long t = 0;

	char *c; while ((c = fgets(BUF, LEN, stdin))) { do {

		if (*c == '\n') {
			sum += l * 10 + r;
			t = l = r = 0;
		}

		else if (*c > '0' && *c <= '9') {
			if (!l) l = (*c - '0');
			r = (*c - '0');
			t = 0;
		}

		else {
			switch (*c) {
				break; case 'e':
					if (t & (1 << 21)) { if (!l) l = 3; r = 3; } // three
					if (t & (1 << 17)) { if (!l) l = 5; r = 5; } // five
					if (t & (1 << 20)) { if (!l) l = 9; r = 9; } // nine
					if (t & (1 << 6)) { if (!l) l = 1; r = 1; } // one
					t = ((t & (1 << 15)) << 6) | ((t & (1 << 18)) << 4) | ((t & (1 << 3)) << 9) | (1 << 4); // thre seve se e
				break; case 'f':
					t = 1 << 2; // f
				break; case 'g':
					t = ((t & (1 << 13)) << 6); // eig
				break; case 'h':
					t = ((t & (1 << 19)) << 4) | ((t & (1 << 1)) << 7); // eigh th
				break; case 'i':
					t = ((t & (1 << 2)) << 8) | ((t & (1 << 3)) << 8) | ((t & (1 << 4)) << 9) | ((t & (1 << 5)) << 9); // fi si ei ni
				break; case 'n':
					if (t & (1 << 22)) { if (!l) l = 7; r = 7; } // seven
					t = ((t & (1 << 14)) << 6) | ((t & (1 << 0)) << 6) | (1 << 5); // nin on n
				break; case 'o':
					if (t & (1 << 7)) { if (!l) l = 2; r = 2; } // two
					t = ((t & (1 << 2)) << 7) | (1 << 0); // fo o
				break; case 'r':
					if (t & (1 << 16)) { if (!l) l = 4; r = 4; } // four
					t = ((t & (1 << 8)) << 7); // thr
				break; case 's':
					t = 1 << 3; // s
				break; case 't':
					if (t & (1 << 23)) { if (!l) l = 8; r = 8; } // eight
					t = (1 << 1); // t
				break; case 'u':
					t = ((t & (1 << 9)) << 7); // fou
				break; case 'v':
					t = ((t & (1 << 10)) << 7) | ((t & (1 << 12)) << 6); // fiv sev
				break; case 'w':
					t = ((t & (1 << 1)) << 6); // tw
				break; case 'x':
					if (t & (1 << 11)) { if (!l) l = 6; r = 6; }; // six
				break; default:
					t = 0;
			}
		}

	} while (*++c); }

	printf("%d\n", sum);
}
