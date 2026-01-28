build:
	export WM_PROJECT_DIR=/opt/openfoam4
	export WM_PROJECT_VERSION=4
	export FOAM_APPBIN=$$WM_PROJECT_DIR/platforms/linux64GccDPOpt/bin
	export FOAM_LIBBIN=$$WM_PROJECT_DIR/platforms/linux64GccDPOpt/lib
	export FOAM_USER_APPBIN=/home/openfoam/platforms/linux64GccDPOpt/bin
	export FOAM_USER_LIBBIN=/home/openfoam/platforms/linux64GccDPOpt/lib
	export PATH=$$WM_PROJECT_DIR/bin:$$WM_PROJECT_DIR/wmake:$$FOAM_APPBIN:$$FOAM_USER_APPBIN:$$FOAM_LIBBIN:$$PATH
	sed -i 's|export WAVES_DIR=$$WM_PROJECT_USER_DIR/applications/utilities/waves2Foam|export WAVES_DIR=/home/openfoam/OpenFOAMCases/waves2Foam|' bin/bashrc
	sed -i 's|export WAVES_APPBIN=$$FOAM_USER_APPBIN|export WAVES_APPBIN=/home/openfoam/platforms/linux64GccDPOpt/bin|' bin/bashrc
	sed -i 's|export WAVES_LIBBIN=$$FOAM_USER_LIBBIN|export WAVES_LIBBIN=/home/openfoam/platforms/linux64GccDPOpt/lib|' bin/bashrc
	sed -i 's|/opt/openfoam11|/opt/openfoam4|g' Allwmake
	./Allwmake