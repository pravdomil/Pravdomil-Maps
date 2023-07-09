module Maps.Model.Update exposing (..)

import Browser.Navigation
import Browser.QueryRouter
import Json.Decode
import Maps.Model
import Maps.Msg
import Platform.Extra
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( Maps.Model.Model, Cmd Maps.Msg.Msg )
init _ url key =
    ( { router = Browser.QueryRouter.init Maps.Model.pageFromUrl url key
      }
    , Cmd.none
    )



--


update : Maps.Msg.Msg -> Maps.Model.Model -> ( Maps.Model.Model, Cmd Maps.Msg.Msg )
update msg model =
    case msg of
        Maps.Msg.NothingHappened ->
            Platform.Extra.noOperation model

        Maps.Msg.UrlRequested a ->
            Browser.QueryRouter.urlRequested a model

        Maps.Msg.UrlChanged a ->
            Browser.QueryRouter.urlChanged Maps.Model.pageFromUrl a model



--


subscriptions : Maps.Model.Model -> Sub Maps.Msg.Msg
subscriptions _ =
    Sub.none
