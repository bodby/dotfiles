function emergeupdate
  sudo emerge --sync && sudo emerge --newuse --deep --update @world && sudo emerge --depclean --ask
end
