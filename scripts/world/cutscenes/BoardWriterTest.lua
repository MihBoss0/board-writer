return function (cutscene)
    
    cutscene:boardText("USES TWEEN, USES FX, ISN'T AUTO.", { useTween = true, useFX = true, auto = false })
    cutscene:boardText("DOESN'T USE TWEEN, USES FX, ISN'T AUTO.", { useTween = false, useFX = true, auto = false })
    cutscene:boardText("DOESN'T USE TWEEN, DOESN'T USE FX, ISN'T AUTO.", { useTween = false, useFX = false, auto = false })
    cutscene:boardText("DOESN'T USE TWEEN, DOESN'T USE FX, IS AUTO.", { useTween = false, useFX = false, auto = true })

end