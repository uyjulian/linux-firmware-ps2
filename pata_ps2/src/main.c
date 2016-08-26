#include "irx.h"

#include "sifcmd.h"

#include "pata_ps2.h"
#include "pata_ps2_core.h"
#include "pata_ps2_buffer.h"
#include "pata_ps2_cmd.h"
#include "pata_ps2_rpc.h"


IRX_ID(MODNAME, 1, 2);


#define CMD_BUFFER_SIZE 0x20
SifCmdHandlerData_t cmd_buffer[CMD_BUFFER_SIZE];


int _start(int argc, char *argv[])
{
	sceSifInitRpc(0);

	/* FIXME: How can we check if another module has setup a cmd buffer? */
	sceSifSetCmdBuffer(cmd_buffer, CMD_BUFFER_SIZE);

	if(pata_ps2_core_init() != 0) {
		M_ERROR("failed to init core\n");
		return 1;
	}

	if(pata_ps2_buffer_init() != 0) {
		M_ERROR("failed to init buffer\n");
		return 1;
	}

	if(pata_ps2_cmd_init() != 0) {
		M_ERROR("failed to init cmd\n");
		return 1;
	}

	if(pata_ps2_rpc_init() != 0) {
		M_ERROR("failed to init rpc\n");
		return 1;
	}

	M_PRINTF("running\n");

	return 0;
}