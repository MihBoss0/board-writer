Board Writer from Chapter 3 brought to Kristal.
This library adds a new function to WorldCutscene, `boardText()`
(See `scripts/world/cutscenes/BoardWriterTest` as an example)

# Instructions
To use the function, put `cutscene:boardText()` in any WorldCutscene.
The function takes only two arguments, `text` being a string, and `options` being a table.
The current options are `useTween`, `useFX` and `auto`.

`useTween` when set to `true` makes the textbox slide from the bottom of the screen to its position. (also plays the `board_lift` sound)
`useFX` when set to `true` adds a shader from the Chapter 3 video game to the textbox.
`auto` when set to `true` advances the textbox automatically.
