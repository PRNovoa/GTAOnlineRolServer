description "Centralized notification system for FiveM by Mole"

ui_page "html/index.html"

client_script "notifications.lua"

export "PkShowNotification"
export "PkShowAdvancedNotification"
export "PkShowProgressBar"
esport "PkDrawTxt"
export "SetQueueMax"
export "SendNotification"


files {
    "html/index.html",
    "html/pk_notifications.js",
    "html/noty.min.js",
    "html/noty.css",
    "html/animate.css",
    "html/themes/forasteros.css",    
    "html/sound-example.wav"
}
