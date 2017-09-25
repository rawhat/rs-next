module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


type Msg
    = AddPanel PanelSite
    | RemovePanel PanelSite
    | NoOp


type PanelSite
    = Reddit
    | Wunderground


type alias Panel =
    { content : String }


type alias PanelButtons =
    { buttons : List PanelButton
    , collapsed : Bool
    }


type alias PanelButton =
    { site : PanelSite
    , added : Bool
    }


type alias Model =
    { panels : List Panel
    , panelButtons : PanelButtons
    }


panelButtons : PanelButtons
panelButtons =
    { buttons =
        [ { site = Reddit, added = False }
        , { site = Wunderground, added = False }
        ]
    , collapsed = False
    }


initialModel : Model
initialModel =
    { panels = []
    , panelButtons = panelButtons
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        m ->
            let
                _ =
                    Debug.log "msg is" msg
            in
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model.panels of
        [] ->
            noPanelsView model

        _ ->
            panelsView model


noPanelsView : Model -> Html Msg
noPanelsView model =
    div [] [ text "Pick a panel to start", panelButtonGroup model.panelButtons ]


panelButtonGroup : PanelButtons -> Html Msg
panelButtonGroup panelButtons =
    div [] (List.map panelButtonView panelButtons.buttons)


panelButtonView : PanelButton -> Html Msg
panelButtonView panelButton =
    let
        clickMsg =
            case panelButton.added of
                False ->
                    AddPanel panelButton.site

                True ->
                    NoOp

        buttonText =
            case panelButton.site of
                Reddit ->
                    "Reddit"

                Wunderground ->
                    "Wunderground"
    in
    div [ onClick clickMsg ] [ text buttonText ]


panelsView : Model -> Html Msg
panelsView model =
    div [] [ text "woo, panels!" ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
