// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright (C) 2018, Bin Meng <bmeng.cn@gmail.com>
 */

#include <common.h>
#include <command.h>
#include <asm/io.h>

#define AONSYS_RSTGEN_BASE			((void __iomem *)0xFFFFF44000UL)
#define REG_RST_REQ_EN_0			(AONSYS_RSTGEN_BASE + 0x140)
#define WDT0_SYS_RST_REQ			(1 << 8)



int do_reset(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
{
    printf("resetting ...\n");

	printf("reset not supported yet\n");
	hang();

	return 0;
}
