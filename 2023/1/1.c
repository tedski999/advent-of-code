#include <stdio.h>

#define LEN 1024
static char BUF[LEN];

int main() {
	unsigned sum = 0, l = 0, r = 0;

	char *c; while ((c = fgets(BUF, LEN, stdin))) { do {

		if (*c == '\n') {
			sum += l * 10 + r;
			l = r = 0;
		}

		else if (*c > 0x30 && *c < 0x3a) {
			if (!l) l = (*c - 0x30);
			r = (*c - 0x30);
		}

	} while (*++c); }

	printf("%d\n", sum);
}
