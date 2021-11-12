resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://playerservices.streamtheworld.com/api/livestream-redirect/LOS40_SC", volume = 0.2 }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "https://megastar-cope-rrcast.flumotion.com/cope/megastar.mp3", volume = 0.2 }
supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://flucast-b03-02.flumotion.com/cope/rockfm.mp3", volume = 0.2}
supersede_radio "RADIO_04_PUNK" { url = "http://audio-online.net:2300/live", volume = 0.2}
supersede_radio "RADIO_05_TALK_01" { url = "https://21313.live.streamtheworld.com/CADENADIAL_SC", volume = 0.2}
supersede_radio "RADIO_06_COUNTRY" { url = "http://7fm.jrsoftware.es/7fm.mp3" , volume = 0.2}
supersede_radio "RADIO_07_DANCE_01" { url = "http://s1.sonicabroadcast.com:1025/stream/1/" , volume = 0.2}
supersede_radio "RADIO_08_MEXICAN" { url = "https://cadena100-cope-rrcast.flumotion.com/cope/cadena100.mp3", volume = 0.2}
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "http://icecast-streaming.nice264.com/europafm" , volume = 0.2}
supersede_radio "RADIO_12_REGGAE" { url = "https://20043.live.streamtheworld.com/RADIOLE_SC", volume = 0.2}
supersede_radio "RADIO_13_JAZZ" { url = "http://icecast-streaming.nice264.com/ondacero" , volume = 0.2}
supersede_radio "RADIO_14_DANCE_02" { url = "http://icecast-streaming.nice264.com/melodiafm", volume = 0.2}
supersede_radio "RADIO_15_MOTOWN" { url = "https://stream.mediasector.es/radio/8000/activafm.mp3", volume = 0.2}
supersede_radio "RADIO_16_SILVERLAKE" { url = "https://radioexterior.rtveradio.cires21.com/radioexterior_hc.mp3", volume = 0.2}
supersede_radio "RADIO_17_FUNK" { url = "http://hitfm.kissfmradio.cires21.com/hitfm.mp3/mp3" , volume = 0.2}
supersede_radio "RADIO_18_90S_ROCK" { url = "https://streamingv2.shoutcast.com/rockSateliteMadridONE", volume = 0.2} 
files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
