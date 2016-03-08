CC = gcc
CXX = g++

HOME=/home/yuguangyang/
BOOST_INCLUDE=-I/opt/boost/boost_1_57_0
IGL_INCLUDE=-I/$(HOME)Dropbox/workspace/libigl/include

DEBUGFLAG=-DDEBUG -g3
RELEASEFLAG= -O3 -march=native -DARMA_NO_DEBUG
CXXFLAGS=  -std=c++0x $(BOOST_INCLUDE) $(IGL_INCLUDE)  -D__LINUX -fopenmp

LDFLAG= -fopenmp -lpthread

OBJ=md_openmp.o 
OBJ2 = Model.o modelDriver.o Model2.o Model3.o

all:test.exe model.exe 
test.exe: $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAG) 
	
model.exe: $(OBJ2)
	$(CXX) -o $@ $^ $(LDFLAG) 
	
%.o:%.cpp
	$(CXX) -c $(CXXFLAGS) $(DEBUGFLAG) $^
	


clean:
	rm *.o *.exe
	
