use_debug false
load_samples [:drum_heavy_kick, :drum_snare_soft]
use_bpm 60

live_loop :drums do
  puts "slow drums"
  6.times do
    sample :drum_bass_soft, rate: 0.8
    sleep 0.5
  end

  puts "fast drums"
  8.times do
    sample :drum_heavy_kick, rate: 0.8
    sleep 0.125
  end
end

live_loop :foo do
  tick
  use_synth :beep
  play (scale :e3, :minor_pentatonic).look
  sleep 0.25
  use_synth :square
  play (ring :e1, :e2, :e3).look, release: 0.25
  sleep 0.25
end

live_loop :snare, delay: 12.5 do
  sample :drum_snare_soft
  sleep 1
end
