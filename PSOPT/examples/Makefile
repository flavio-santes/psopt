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

ifndef PSOPT_ROOT
$(warning -)
$(warning -----------------------------------------)
$(warning Run from the psopt directory, example)
$(warning cd ~/psopt-master && make)
$(warning -----------------------------------------)
$(error Bye)
endif

EXAMPLES =				\
	alpine/alpine			\
	bioreactor/bioreactor		\
	brac1/brac1			\
	breakwell/breakwell		\
	bryden/bryson_denham		\
	brymr/bryson_max_range		\
	catmix/catmix			\
	chain/chain			\
	climb/climb			\
	coulomb/coulomb			\
	cracking/cracking		\
	crane/crane			\
	dae_i3/dae_i3			\
	delay1/delay1			\
	glider/glider			\
	goddard/goddard			\
	heat/heat			\
	hyper/hypersensitive		\
	ipc/interior_point		\
	isop/isoperimetric		\
	lambert/lambert			\
	launch/launch			\
	lowthr/low_thrust		\
	lts/lts				\
	manutec/manutec			\
	missile/missile			\
	moon/moon			\
	mpec/mpec			\
	notorious/notorious		\
	obstacle/obstacle		\
	rayleigh/rayleigh		\
	reorientation/reorientation	\
	shutt/shuttle_reentry1		\
	sing5/singular5			\
	stc1/stc1			\
	steps/steps			\
	twoburn/twoburn			\
	twolink/twolinkarm		\
	twophro/twophase_robot		\
	twophsc/twophase_schwartz	\
	user/user			\
	zpm/zpm

all: $(EXAMPLES)

$(EXAMPLES): %: %.cxx $(PSOPT_LIB)
	$(CXX) $(CXXFLAGS) -o $@ $< $(PSOPT_LDFLAGS) $(PSOPT_LDLIBS)

clean:
	$(foreach ex,$(EXAMPLES),rm -f $(ex);)

