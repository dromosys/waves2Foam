init:
	echo "Environment info:"
	ls /home/openfoam
	env | grep -E "(WM_PROJECT|FOAM|WAVES)" | sort

build: init

	export WM_PROJECT_DIR=/opt/openfoam13 ; 
	export WM_PROJECT_VERSION=13 ; 
	export WM_PROJECT_USER_DIR=/home/openfoam/OpenFOAM/openfoam-13 ; 
	export FOAM_APPBIN=/opt/openfoam13/platforms/linux64GccDPInt32Opt/bin ; 
	export FOAM_LIBBIN=/opt/openfoam13/platforms/linux64GccDPInt32Opt/lib ; 
	export FOAM_USER_APPBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/bin ; 
	export FOAM_USER_LIBBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/lib ; 
	export PATH=/opt/openfoam13/bin:/opt/openfoam13/wmake:/opt/openfoam13/platforms/linux64GccDPInt32Opt/bin:/home/openfoam/platforms/linux64GccDPInt32Opt/bin:/opt/openfoam13/platforms/linux64GccDPInt32Opt/lib:$$PATH ;
	
	./Allwmake 
	