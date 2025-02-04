# SPDX-License-Identifier: GPL-2.0+
#
# (C) Copyright 2000-2002
# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
#
# Copyright (c) 2017 Microsemi Corporation.
# Padmarao Begari, Microsemi Corporation <padmarao.begari@microsemi.com>
#
# Copyright (C) 2017 Andes Technology Corporation
# Rick Chen, Andes Technology Corporation <rick@andestech.com>
#

32bit-emul		:= elf32lriscv
64bit-emul		:= elf64lriscv

ifdef CONFIG_32BIT
PLATFORM_LDFLAGS		+= -m $(32bit-emul)
EFI_LDS			:= elf_riscv32_efi.lds
PLATFORM_ELFFLAGS	+= -B riscv -O elf32-littleriscv
endif

ifdef CONFIG_64BIT
PLATFORM_LDFLAGS		+= -m $(64bit-emul)
EFI_LDS			:= elf_riscv64_efi.lds
PLATFORM_ELFFLAGS	+= -B riscv -O elf64-littleriscv
endif

CONFIG_STANDALONE_LOAD_ADDR ?= 0x00000000

ifeq ($(cc-name),clang)
PLATFORM_CPPFLAGS	+= -mno-relax
else
PLATFORM_CPPFLAGS	+= -ffixed-gp
endif
PLATFORM_CPPFLAGS	+= -fpic
PLATFORM_RELFLAGS	+= -fno-common -ffunction-sections -fdata-sections
LDFLAGS_u-boot		+= --gc-sections -static -pie

EFI_CRT0		:= crt0_riscv_efi.o
EFI_RELOC		:= reloc_riscv_efi.o
