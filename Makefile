CXXFLAGS=-g -O0 -Wall -Iglm-0.9.2.7 -fpermissive -Wreorder -DKISS_PARTICLES_DEBUG
LDFLAGS= -lGL -lglut -lGLU -lGLEW -lpthread

all: kiss_particles libkiss_particles.a

kiss_particles: main.o uistate.o ArcBall.o libkiss_particles.a
	g++ $(CXXFLAGS) -o $@ $^ $(LDFLAGS) 

libkiss_particles.a: PEmitter.o PManager.o Particle.o PGroup.o PAction.o utils.o
	ar rcs $@ $^

PEmitter.o: PEmitter.cpp PEmitter.h Particle.h 
	g++ $(CXXFLAGS) -c -o $@ $*.cpp  $(LD_FLAGS)

PManager.o: PManager.cpp PEmitter.h PGroup.h Particle.h PManager.h 
	g++ $(CXXFLAGS) -c -o $@ $*.cpp  $(LD_FLAGS)

PGroup.o: PGroup.cpp PGroup.h Particle.h PAction.h
	g++ $(CXXFLAGS) -c -o $@ $*.cpp  $(LD_FLAGS)

clean:
	rm -f ptest *.o kiss_particles libkiss_particles.a
