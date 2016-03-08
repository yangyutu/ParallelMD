#pragma once
#include <vector>

struct Particle{
	double acc[3],force[3],vel[3],pos[3];
};



struct Model3{

	std::vector<Particle> particles;
//    double *acc;
    double *box;
    double dt = 0.0001;
    double e0;
//    double *force;
    int i;
    int id;
    double kinetic;
    double mass = 1.0;
    int nd = 3;
    int np = 1000;
//    double *pos;
    double potential;
    int seed = 123456789;
    int step;
    int step_num = 400;
    int step_print;
    int step_print_index;
    int step_print_num;
//    double *vel;
    double wtime;
    
    Model3(){}
    
    void initialize();
    void timestamp();

    void compute();
    double dist(int nd, double r1[], double r2[], double dr[]);
    void initialize_vp();
    double r8_uniform_01(int *seed);


    void update();
    ~Model3(){
        delete [] box;   
    }

















};
