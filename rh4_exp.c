#include <stdio.h>
double f(double y)
{
    return -y;
}
int main(void)
{
    double b[3] = {0.5, 0.5, 0};
    double a[3][3] = {1.15131397208, -0.512638837487, 0.15,
                      -0.161192517985, 0.214825075698, 0.157692307692,
                      4.64711431703, -3.14711431703, 0.5};
    double y[5000];
    double J[5000][3];
    double h = 0.1;
    y[0] = 1;
    y[1] = 0.904837;
    for (int i = 0; i < 3; i++)
    {
        J[-1 + 1][i] = h * f(y[0]);
    }
    for (int k = 0; k < 100; k++)
    {
        for (int i = 0; i < 3; i++)
        {
            double sum = 0;
            for (int j = 0; j < 3; j++)
            {
                sum += a[i][j] * J[k - 1 + 1][j];
            }
            J[k + 1][i] = h * f(y[k] + sum);
        }
        if(k==0) continue;
        double sum = 0;
        for (int j = 0; j < 3; j++)
        {
            sum += b[j] * J[k + 1][j];
        }
        y[k + 1] = y[k] + sum;
    }
    printf("x0\t\ty0\t\tki1\t\tki2\t\tki3\n");
    for(int i=0;i<=100;i++){
        printf("%g\t%e\t%e\t%e\t%e\n",i*0.1,y[i],J[i][0],J[i][1],J[i][2]);
    }
    return 0;
}
