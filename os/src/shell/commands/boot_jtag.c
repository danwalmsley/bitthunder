#include <bitthunder.h>
#include <stdlib.h>
#include <string.h>

typedef void (*jump) (void);

static void wait_jtag() {
	while(1) {
		__asm("");
	}
}

static int bt_boot_jtag(BT_HANDLE hShell, int argc, char **argv) {

	BT_HANDLE hStdout = BT_ShellGetStdout(hShell);

	if(argc != 3) {
		bt_fprintf(hStdout, "Usage: %s --core [coreID]\n", argv[0]);
		return -1;
	}

	BT_u32 coreID = 0;

	if(strcmp(argv[1], "--core")) {
		bt_fprintf(hStdout, "Invalid argument %s\n", argv[1]);
		return -1;
	}

	coreID = strtoul(argv[2], NULL, 10);

	void *p = (void *) wait_jtag;

	BT_DCacheFlush();
	BT_ICacheInvalidate();
	BT_DCacheDisable();

	if(!coreID) {
		BT_StopSystemTimer();
		BT_DisableInterrupts();

		jump jmp = p;
		jmp();

		while(1) {
			__asm__ ("");
		}

	} else {
		// Must use MACH core boot interface.
		BT_BootCore(coreID, p, 0, 0, 0, 0);
	}

	return 0;
}

BT_SHELL_COMMAND_DEF oCommand = {
	.szpName 	= "boot_jtag",
	.pfnCommand = bt_boot_jtag,
};
