int y1,y2=0
proctype p1(){
printf("p1 \n")
y1 = y2 + 1
(false)
printf("condition \n")
y1 = 0
printf("this is so sad \n")
}
proctype p2(){
printf("p2 \n")
y2 = y1 + 1
(y1 == 0 || y2 < y1)
y2 = 0
}
init {
printf("allo \n")
run p1()
run p2()
}