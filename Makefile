CC = gcc
CXX = g++


DEBUGFLAG=-DDEBUG -g3
RELEASEFLAG= -O3 -march=native 
CXXFLAGS=  -std=c++0x   -D__LINUX -fopenmp

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
	
