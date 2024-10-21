/**
 * @file
 * @brief
 *
 * @author Aleksey Zhmulin
 * @date 20.10.24
 */
#include <iec_std_lib.h>

/**
 * Functions and variables provied by generated C softPLC
 */
extern void config_run__(int tick);
extern void config_init__(void);

/**
 * Functions and variables to export to generated C softPLC
 */
TIME __CURRENT_TIME;
BOOL __DEBUG;

int main(int argc, char const *argv[]) {
	config_init__();

	return 0;
}
