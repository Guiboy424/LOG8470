bool p1HasKnife, p0WantsKnife, p1WantsKnife
int counter = 0;

proctype p0(){
printf("p0\n")
do
::  p0WantsKnife = true
    p1HasKnife = true
    printf("p0 waiting\n")
    (!p1HasKnife || !p1WantsKnife)
    printf("p0 put knife down\n")
    p0WantsKnife = false
    counter++
:: counter > 10 -> break
od
}
proctype p1(){
printf("p1\n")
do
::  p1WantsKnife = true
    p1HasKnife = false
    printf("p1 waiting\n")
    (p1HasKnife || !p0WantsKnife) 
    printf("p1 put knife down \n")
    p1WantsKnife = false
    counter++
:: counter > 10 -> break
od
}
init {
run p0()
run p1()
}