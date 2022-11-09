#!/usr/bin/env bash

echo -e "💣 종료할 포트 번호를 입력해주세요."
echo -n "🦔 포트번호(숫자만): "
read port

if [[ -n ${port//[0-9]/} ]]; then
	echo "😥 숫자만 입력 가능해요..ㅠㅠ"
	exit 0
fi

processID=`lsof -ti tcp:$port`

if [ -z $processID ]; then
	echo "🥲 현재" $port "포트는 실행중인 프로세스가 없어요"
	exit 0
fi

echo "👉 프로세스 ID:" $processID
echo "🤔 상세 정보"

lsof -i tcp:$port

echo -n "🧐 종료할까요? (Y/n): "
read killport

if [ $killport != "Y" ] && [ $killport != "y" ]; then
	echo "🛡️ 포트를 종료하지 않았어요."
	exit 0
fi

kill -9 $processID

echo "✅ 종료했어요!"
