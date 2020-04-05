user = User.create({
  "name"=>"Demo User at net Prime",
  "locale"=>"pt-BR",
  "email"=>"demo@netpri.me",
  "password"=>"Teste123!@#"
})

Video.create({
  user: user,
  name: "Exemplo do readme",
  url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8"
})
Video.create({
  user: user,
  name: "sample",
  url: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"
})
Video.create({
  user: user,
  name: "Nature",
  url: "http://playertest.longtailvideo.com/adaptive/wowzaid3/playlist.m3u8"
})
Video.create({
  user: user,
  name: "nasatv",
  url: "http://nasatv-lh.akamaihd.net/i/NASA_101@319270/index_1000_av-p.m3u8?sd=10&rebase=on"
})
Video.create({
  user: user,
  name: "Tears of Steel",
  url: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"
})
Video.create({
  user: user,
  name: "Broken video to test the player",
  url: "https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
})
