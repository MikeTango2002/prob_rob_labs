CXX=g++
CXXOPTS=-std=c++17 -O3 -I/usr/include/eigen3

.phony:	clean all

all:	kd_simple

kd_simple:	kd_simple.cpp
	$(CXX) $(CXXOPTS) -o $@ $<

clean:
	rm -rf *~ kd_simple

