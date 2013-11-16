/** 
 * this is a test case made by Kirk !
**/

char *testfunc( char *word, int n );

int g;
struct t{
	int a,b;
	char s[10];
	double d;
}gt;
typedef struct t testStruct;
testStruct *tt,yy;

int main()
{
   char s[10] = "abcdefg";
   testfunc( '\n' );

   return 0;
}

typedef int Index;

char *testfunc( char *another_word, int not_n ){
	int a = 1, *b, **c;
	double *d, e[3], f = (a!=0)?1012.592:2010.14592;
	char *s = "test12345";
	/* this statement was recognized as expression */
	testStruct *tt; /* because of reduce/reduce conflict ! */
	Index *pi,**ppi,ii;
	for( a = 0 ;  ; a++ ) {
		if( a == 2 ) {
			continue;
		} else if ( a >= 4 ) {
			e[a] = (a*a+s[a-1]*a)/f;
			a*a;
			break;
		} else
			c = &b;
	}
	// comment
	do {
		while( a > 1 )
			switch( a ) {
				case 2:
					return;
				default:
					break;
			}
	} while ( --a );
	return s;
}
