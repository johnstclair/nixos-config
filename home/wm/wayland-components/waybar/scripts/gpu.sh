#!/run/current-system/sw/bin/bash

utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

memory_percent=$(nvidia-smi --query-gpu=utilization.memory --format=csv,noheader,nounits)
memory_used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)

# clock speeds
graphics_clock=$(nvidia-smi --query-gpu=clocks.current.graphics --format=csv,noheader,nounits)
sm_clock=$(nvidia-smi --query-gpu=clocks.current.sm --format=csv,noheader,nounits)
memory_clock=$(nvidia-smi --query-gpu=clocks.current.memory --format=csv,noheader,nounits)
video_clock=$(nvidia-smi --query-gpu=clocks.current.video --format=csv,noheader,nounits)

# sum the speeds
total_clock_mhz=$((graphics_clock + sm_clock + memory_clock + video_clock))
total_clock_ghz=$(echo "scale=2; $total_clock_mhz / 10000" | bc )

memory_used=$(echo "scale=1; $memory_used / 1000" | bc)

printf "{\"text\":\"$utilization\", \"alt\":\"$total_clock_ghz\", \"tooltip\":\"Temp: $temp°C\\\nvRAM: $memory_used GiB\\\nvRAM percent: $memory_percent%%\"}\n"
