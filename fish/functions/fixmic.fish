function fixmic
  set card_no (aplay -l | grep 'Sound BlasterX G6' | cut -d' ' -f 2 | tr -d ':')

  amixer -c $card_no -q set "PCM Capture Source" "External Mic"

  if test $status != 0
    return 1
  end

  amixer -c $card_no -q sset "Input Gain Control" 100

  if test $status != 0
    return 2
  end
end
