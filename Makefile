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

clean:
	./Allwclean

rebuild: clean
	./Allwmake

docker-build-30:
	docker build -t openfoam-waves2foam-30 .

docker-run-30:
	docker run --rm -it -v $(CURDIR):/home/openfoam/OpenFOAMCases/waves2Foam openfoam-waves2foam-30 /bin/bash
