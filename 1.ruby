use_debug false
load_samples [:drum_heavy_kick, :drum_snare_soft]
use_bpm 80

live_loop :drums do
  cue :s
  4.times do
    3.times do
      sample :drum_bass_soft, rate: 0.8, amp: 0.2
      sleep 0.5
    end
    sample :drum_heavy_kick, amp:0.2
    sleep 0.5
  end
  sleep 1
end

live_loop :cymbal do
sync :s
  4.times do

  23.times do
    sample :drum_cymbal_closed , rate: 0.8, amp: 0.3

    sleep 0.25
  end
  sample :drum_cymbal_open , rate: 0.8, amp: 0.3
  sleep 0.25
end
end

live_loop :chords do
  with_synth :sine do
    tick
    play (ring :e2, :b2, :e2, :e2, :a2, :a2, :e2, :e2, :b2, :a2, :e2, :b2, :e2).look , decay: 0.8
    sleep 1
end
end

live_loop :mello do
  with_synth :piano do
    24.times do
      tick :a
      play scale(:e2, :minor_pentatonic).choose, pan:  range(-1,1, step:0.083).look(:a)
      sleep rrand_i(0.25,0.75)
    end
    24.times do
      tick :b
      play scale(:a3, :minor_pentatonic).choose, pan:  range(1,-1, step:0.083).look(:b)
      sleep rrand_i(0.25,0.75)
    end
    24.times do
      tick :c
      play scale(:b4, :minor_pentatonic).choose, pan:  range(-1,1, step:0.083).look(:c)
      sleep rrand_i(0.25,0.75)
    end
    24.times do
      tick :d
      play scale(:e4, :minor_pentatonic).choose, pan:  range(1,-1, step:0.083).look(:d)
      sleep rrand_i(0.25,0.75)
    end
    tick_reset_all
  end
end


#
# live_loop :foo do
#   tick
#   use_synth :beep
#   play (scale :e3, :minor_pentatonic).look
#   sleep 0.25
#   use_synth :square
#   play (ring :e1, :e2, :e3).look, release: 0.25
#   sleep 0.25
# end
#
# live_loop :snare, delay: 12.5 do
#   sample :drum_snare_soft
#   sleep 1
# end
