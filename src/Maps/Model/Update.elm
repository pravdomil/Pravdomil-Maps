module Maps.Model.Update exposing (..)

import Browser
import Browser.Navigation
import Json.Decode
import Maps.Model
import Maps.Msg
import Platform.Extra
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( Maps.Model.Model, Cmd Maps.Msg.Msg )
init _ _ _ =
    ( Maps.Model.Model
    , Cmd.none
    )



--


update : Maps.Msg.Msg -> Maps.Model.Model -> ( Maps.Model.Model, Cmd Maps.Msg.Msg )
update msg =
    case msg of
        Maps.Msg.NothingHappened ->
            Platform.Extra.noOperation

        Maps.Msg.UrlRequested a ->
            \x ->
                case a of
                    Browser.Internal b ->
                        ( x, Browser.Navigation.load (Url.toString b) )

                    Browser.External b ->
                        ( x, Browser.Navigation.load b )

        Maps.Msg.UrlChanged _ ->
            Platform.Extra.noOperation



--


subscriptions : Maps.Model.Model -> Sub Maps.Msg.Msg
subscriptions _ =
    Sub.none
