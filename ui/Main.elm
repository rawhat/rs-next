module Main exposing (..)

import Html exposing (..)


initialModel =
    ( { myString = "" }, Cmd.none )


update model msg =
    ( model, Cmd.none )


view model =
    div [] [ text "hello, world" ]


subscriptions model =
    Sub.none


main =
    Html.program
        { init = initialModel
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
