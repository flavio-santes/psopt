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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#

ifndef PSOPT_ROOT
$(warning -)
$(warning -----------------------------------------)
$(warning Run from the psopt directory, example)
$(warning cd ~/psopt-master && make)
$(warning -----------------------------------------)
$(error Bye)
endif

OBJS_DIR = ./obj

PSOPT_OBJS =					\
	$(OBJS_DIR)/derivatives.o		\
	$(OBJS_DIR)/evaluate.o			\
	$(OBJS_DIR)/get_numbers.o		\
	$(OBJS_DIR)/get_variables.o		\
	$(OBJS_DIR)/integrate.o			\
	$(OBJS_DIR)/interpolation.o		\
	$(OBJS_DIR)/IPOPT_interface.o		\
	$(OBJS_DIR)/mesh.o			\
	$(OBJS_DIR)/NLP_bounds.o		\
	$(OBJS_DIR)/NLP_constraints.o		\
	$(OBJS_DIR)/NLP_guess.o			\
	$(OBJS_DIR)/NLP_interface.o		\
	$(OBJS_DIR)/NLP_objective.o		\
	$(OBJS_DIR)/parameter_estimation.o	\
	$(OBJS_DIR)/phases.o			\
	$(OBJS_DIR)/plot.o			\
	$(OBJS_DIR)/print.o			\
	$(OBJS_DIR)/propagate.o			\
	$(OBJS_DIR)/pseudospectral.o		\
	$(OBJS_DIR)/psopt.o			\
	$(OBJS_DIR)/scaling.o			\
	$(OBJS_DIR)/setup.o			\
	$(OBJS_DIR)/SNOPT_interface.o		\
	$(OBJS_DIR)/solution.o			\
	$(OBJS_DIR)/trajectories.o		\
	$(OBJS_DIR)/user_functions.o		\
	$(OBJS_DIR)/util.o			\
	$(OBJS_DIR)/validate.o			\
	$(OBJS_DIR)/workspace.o

all: $(PSOPT_LIB)

$(PSOPT_LIB): $(PSOPT_OBJS)
	$(AR) crD $@ $^

$(PSOPT_OBJS): $(OBJS_DIR)/%.o: $(PSOPTSRC_DIR)/%.cxx $(PSOPTSRC_DIR)/psopt.h
	@mkdir -p $(OBJS_DIR)
	$(CXX) -c $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(OBJS_DIR)
	rm -f $(PSOPT_LIB)

.PHONY: clean

