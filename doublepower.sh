#!/bin/sh

frames=4348
procs=4
file=Aquable.pov
opts="+W100 +H75"

if [ `expr $frames % $procs` -gt 0 ]; then
	echo "Error: $frames not divisable by $procs."
	exit 1
fi

pids=""
fpp=`expr $frames / $procs`

killthemall() {
	for pid in $pids; do
		echo "Stopping $pid"
		kill $pid
	done
}

trap killthemall INT

for i in `seq $procs`; do
	start=$(expr $(expr $i - 1) \* $fpp)
	end=$(expr $i \* $fpp)

	if [ $start -gt 0 ]; then
		start=$(expr $start + 1)
	fi

	povray "$file" +KFI0 +KFF${frames} +KI0 +KF60 +SF$start +EF$end $opts &

	pid=$!

	if [ -z "$pids" ]; then
		pids="$pid"
	else
		pids="$pids $pid"
	fi
done

for pid in $pids; do
	echo "waiting for $pid"
	wait $pid
done
