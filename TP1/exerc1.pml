bool p0WantsKnife, p1WantsKnife
int counter = 0
int turn = 0

proctype p0(){
do
::  turn = 1
    p0WantsKnife = true
    printf("p0 waiting\n")
    (!p1WantsKnife || turn != 1)
    printf("p0 used the knife and puts knife down\n")
    p0WantsKnife = false
    counter++
:: counter > 5 -> break
od
}
proctype p1(){
do
::  turn = 0
    p1WantsKnife = true
    printf("p1 waiting\n")
    (!p0WantsKnife || turn != 0)
    printf("p1 used the knife and puts knife down\n")
    p1WantsKnife = false
    counter++
:: counter > 5 -> break
od
}
init {
run p0(); run p1()
}