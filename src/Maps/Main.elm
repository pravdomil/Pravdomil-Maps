module Maps.Main exposing (..)

import Browser
import Json.Decode
import Maps.Model
import Maps.Model.Update
import Maps.Model.View
import Maps.Msg


main : Program Json.Decode.Value Maps.Model.Model Maps.Msg.Msg
main =
    Browser.application
        { init = Maps.Model.Update.init
        , update = Maps.Model.Update.update
        , subscriptions = Maps.Model.Update.subscriptions
        , view = Maps.Model.View.view
        , onUrlRequest = Maps.Msg.UrlRequested
        , onUrlChange = Maps.Msg.UrlChanged
        }
