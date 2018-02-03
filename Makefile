# PSOPT Lib Makefile
# Copyright (C) 2018, Flavio Santes
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
#

export PSOPT_ROOT = $(CURDIR)

# Dependencies
export CXSPARSE_DIR = $(PSOPT_ROOT)/SuiteSparse/CXSparse
export LUSOL_DIR = $(PSOPT_ROOT)/lusol/csrc
export DMATRIX_DIR= $(PSOPT_ROOT)/dmatrix
export DMATRIX_LIB = $(DMATRIX_DIR)/lib/libdmatrix.a

IPOPT_DIR = $(HOME)/Ipopt-3.12.3
IPOPT_LIB_DIR = $(IPOPT_DIR)/lib

ADOLC_LIB =			\
	/usr/lib/libadolc.a	\
	/usr/lib/libColPack.a
CXSPARSE_LIB = $(CXSPARSE_DIR)/Lib/libcxsparse.a
LUSOL_LIB = $(LUSOL_DIR)/liblusol.a

# PSOPT stuff
export PSOPT_DIR = $(PSOPT_ROOT)/PSOPT
export PSOPTSRC_DIR = $(PSOPT_DIR)/src

EXAMPLES_DIR = $(PSOPT_DIR)/examples

export PSOPT_LIB = $(PSOPT_DIR)/lib/libpsopt.a

PSOPT_LIBS =		\
	$(PSOPT_LIB)	\
	$(DMATRIX_LIB)

# DMATRIX Dependencies
DMATRIX_DEPS_LIBS =	\
	$(LUSOL_LIB)	\
	$(CXSPARSE_LIB)

# PSOPT Dependencies
PSOPT_DEPS_LIBS =	\
	$(ADOLC_LIB)	\
	-lipopt		\
	-lcoinmetis	\
	-lcoinmumps

SYS_LIBS =		\
	-llapack	\
	-lf77blas	\
	-lcblas		\
	-lf2c		\
	-ldl		\
	-lm

DEFINES =					\
	-DLAPACK -DUNIX -DSPARSE_MATRIX		\
	-DUSE_IPOPT -DHAVE_MALLOC -DNDEBUG

INCS =						\
	-I$(DMATRIX_DIR)/include		\
	-I$(PSOPTSRC_DIR)			\
	-I$(CXSPARSE_DIR)/Include		\
	-I$(CXSPARSE_DIR)/../SuiteSparse_config	\
	-I$(LUSOL_DIR)				\
	-I$(IPOPT_DIR)/include/coin		\
	-I$(IPOPT_DIR)/include/coin/ThirdParty	\
	-I/usr/include/adolc

FLAGS = -O0 -g -fomit-frame-pointer -fPIC

WARNS =			\
	-Wparentheses	\
	-Wreturn-type	\
	-Wcast-qual	\
	-Wpointer-arith	\
	-Wwrite-strings	\
	-Wconversion	\
	-Wall

export CXXFLAGS += $(DEFINES) $(INCS) $(FLAGS) $(WARNS)

export DMATRIX_LDFLAGS =

export DMATRIX_LDLIBS =			\
	$(DMATRIX_DEPS_LIBS)		\
	$(SYS_LIBS)

export PSOPT_LDFLAGS += 		\
	-L$(IPOPT_LIB_DIR)		\
	-Wl,-rpath=$(IPOPT_LIB_DIR)

export PSOPT_LDLIBS =			\
	$(PSOPT_LIBS)			\
	$(DMATRIX_DEPS_LIBS)		\
	$(PSOPT_DEPS_LIBS)		\
	$(SYS_LIBS)

all: lib examples test

lib: $(DMATRIX_LIB)
	cd $(PSOPT_DIR)/lib && $(MAKE)

examples: lib
	cd $(EXAMPLES_DIR) && $(MAKE)

test:
	cd $(EXAMPLES_DIR)/launch && ./launch

$(LUSOL_LIB):
	cp Makefile.lusol $(LUSOL_DIR)/Makefile
	cd $(LUSOL_DIR) && $(MAKE)

$(CXSPARSE_LIB):
	cd $(CXSPARSE_DIR) && $(MAKE)

$(DMATRIX_LIB): $(LUSOL_LIB) $(CXSPARSE_LIB)
	cd $(DMATRIX_DIR)/lib && $(MAKE)

dmatrix_examples: $(DMATRIX_LIB)
	cd $(DMATRIX_DIR)/examples && $(MAKE) all

clean:
	cd $(DMATRIX_DIR)/lib && $(MAKE) clean
	cd $(DMATRIX_DIR)/examples && $(MAKE) clean
	cd $(PSOPT_DIR)/lib && $(MAKE) clean
	cd $(EXAMPLES_DIR) && $(MAKE) clean

distclean: clean
	cd $(CXSPARSE_DIR)/Lib && $(MAKE) clean
	cd $(LUSOL_DIR) && $(MAKE) clean

.PHONY: all lib examples test dmatrix_examples clean distclean


