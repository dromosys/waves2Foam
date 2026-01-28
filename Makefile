init:
	echo "Environment info:"
	env | grep -E "(WM_PROJECT|FOAM|WAVES)" | sort

build: init
	export WM_PROJECT_DIR=/opt/openfoam11
	export WM_PROJECT_VERSION=11
	export WM_PROJECT_USER_DIR=/home/openfoam/OpenFOAM/openfoam-11
	export FOAM_APPBIN=/opt/openfoam11/platforms/linux64GccDPOpt/bin
	export FOAM_LIBBIN=/opt/openfoam11/platforms/linux64GccDPOpt/lib
	export FOAM_USER_APPBIN=/home/openfoam/platforms/linux64GccDPOpt/bin
	export FOAM_USER_LIBBIN=/home/openfoam/platforms/linux64GccDPOpt/lib
	export PATH=/opt/openfoam11/bin:/opt/openfoam11/wmake:/opt/openfoam11/platforms/linux64GccDPOpt/bin:/home/openfoam/platforms/linux64GccDPOpt/bin:/opt/openfoam11/platforms/linux64GccDPOpt/lib:$$PATH
	sed -i 's|export WAVES_DIR=\$$WM_PROJECT_USER_DIR/applications/utilities/waves2Foam|export WAVES_DIR=/home/openfoam/OpenFOAMCases/waves2Foam|' bin/bashrc
	sed -i 's|export WAVES_APPBIN=\$$FOAM_USER_APPBIN|export WAVES_APPBIN=/home/openfoam/platforms/linux64GccDPOpt/bin|' bin/bashrc
	sed -i 's|export WAVES_LIBBIN=\$$FOAM_USER_LIBBIN|export WAVES_LIBBIN=/home/openfoam/platforms/linux64GccDPOpt/lib|' bin/bashrc
	sed -i 's|^\. /opt/openfoam11/etc/bashrc|# . /opt/openfoam11/etc/bashrc|' Allwmake
	./Allwmake