init:
	echo "Environment info:"
	ls /home/openfoam
	env | grep -E "(WM_PROJECT|FOAM|WAVES)" | sort

build: init

	export WM_PROJECT_DIR=/opt/openfoam11 ; 
	export WM_PROJECT_VERSION=11 ; 
	export WM_PROJECT_USER_DIR=/home/openfoam/OpenFOAM/openfoam-11 ; 
	export FOAM_APPBIN=/opt/openfoam11/platforms/linux64GccDPInt32Opt/bin ; 
	export FOAM_LIBBIN=/opt/openfoam11/platforms/linux64GccDPInt32Opt/lib ; 
	export FOAM_USER_APPBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/bin ; 
	export FOAM_USER_LIBBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/lib ; 
	export PATH=/opt/openfoam11/bin:/opt/openfoam11/wmake:/opt/openfoam11/platforms/linux64GccDPInt32Opt/bin:/home/openfoam/platforms/linux64GccDPInt32Opt/bin:/opt/openfoam11/platforms/linux64GccDPInt32Opt/lib:$$PATH ;
	
	./Allwmake 
	