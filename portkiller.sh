#!/usr/bin/env bash

echo -e "π£ μ’λ£ν  ν¬νΈ λ²νΈλ₯Ό μλ ₯ν΄μ£ΌμΈμ."
echo -n "π¦ ν¬νΈλ²νΈ(μ«μλ§): "
read port

if [[ -n ${port//[0-9]/} ]]; then
	echo "π₯ μ«μλ§ μλ ₯ κ°λ₯ν΄μ..γ γ "
	exit 0
fi

processID=`lsof -ti tcp:$port`

if [ -z $processID ]; then
	echo "π₯² νμ¬" $port "ν¬νΈλ μ€νμ€μΈ νλ‘μΈμ€κ° μμ΄μ"
	exit 0
fi

echo "π νλ‘μΈμ€ ID:" $processID
echo "π€ μμΈ μ λ³΄"

lsof -i tcp:$port

echo -n "π§ μ’λ£ν κΉμ? (Y/n): "
read killport

if [ $killport != "Y" ] && [ $killport != "y" ]; then
	echo "π‘οΈ ν¬νΈλ₯Ό μ’λ£νμ§ μμμ΄μ."
	exit 0
fi

kill -9 $processID

echo "β μ’λ£νμ΄μ!"
