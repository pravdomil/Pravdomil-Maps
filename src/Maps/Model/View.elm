module Maps.Model.View exposing (..)

import Angle
import Array
import Browser
import Camera3d
import Color
import Direction3d
import Html
import Length
import Maps.Model
import Maps.Msg
import Pixels
import Point3d
import Scene3d
import Scene3d.Material
import Scene3d.Mesh
import TriangularMesh
import Viewpoint3d


view : Maps.Model.Model -> Browser.Document Maps.Msg.Msg
view _ =
    Browser.Document
        "Pravdomil Maps"
        [ Html.node "style" [] [ Html.text "html{background-color:black}" ]
        , Scene3d.sunny
            { entities =
                [ Scene3d.mesh (Scene3d.Material.matte Color.blue) pyramidMesh
                ]
            , camera =
                Camera3d.perspective
                    { viewpoint =
                        Viewpoint3d.lookAt
                            { focalPoint = Point3d.origin
                            , eyePoint = Point3d.centimeters 40 20 30
                            , upDirection = Direction3d.z
                            }
                    , verticalFieldOfView = Angle.degrees 30
                    }
            , upDirection = Direction3d.z
            , sunlightDirection = Direction3d.yz (Angle.degrees -120)
            , background = Scene3d.transparentBackground
            , clipDepth = Length.centimeters 1
            , shadows = True
            , dimensions = ( Pixels.int 400, Pixels.int 400 )
            }
        ]



--


pyramidMesh : Scene3d.Mesh.Uniform ()
pyramidMesh =
    Scene3d.Mesh.indexedFacets
        (TriangularMesh.indexed
            (Array.fromList
                [ Point3d.centimeters 10 10 0
                , Point3d.centimeters 10 -10 0
                , Point3d.centimeters -10 10 0
                , Point3d.centimeters -10 -10 0
                , Point3d.centimeters 0 0 4
                ]
            )
            [ ( 1, 0, 4 )
            , ( 0, 2, 4 )
            , ( 2, 3, 4 )
            , ( 3, 1, 4 )
            , ( 1, 3, 0 )
            , ( 0, 3, 2 )
            ]
        )
