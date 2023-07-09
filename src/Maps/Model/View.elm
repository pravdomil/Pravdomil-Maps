module Maps.Model.View exposing (..)

import Browser
import Html
import Maps.Model
import Maps.Msg
import Maps.Utils.Translation


view : Maps.Model.Model -> Browser.Document Maps.Msg.Msg
view _ =
    { title = Maps.Utils.Translation.title
    , body =
        [ Html.text Maps.Utils.Translation.title
        ]
    }
