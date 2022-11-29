
-- add input fields
inputFieldIds = {}
for i, e in ipairs({"X1", "Y1", "Z1", "X2", "Y2", "Z2"}) do
    inp = Components.Custom.CoordinateInput:new()

    inp.Coordinate = e
    inp.Label = e:sub(1,1)
    inp.PosX = 20
    if e:sub(2,2) == "1" then
        inp.PosY = 20 + (i * 20)
    else
        inp.PosY = 40 + (i * 20)
    end
    inp.Value = "0"

    table.insert(inputFieldIds, App:AddElement(inp))
end

-- labels
App:AddElement(Lib.Gui.GenTextField("P1 coordinates:", 10, 20))
App:AddElement(Lib.Gui.GenTextField("P2 coordinates:", 10, 100))
App:AddElement(Lib.Gui.GenTextField("Distance P1-P2:", 130, 60))

-- result
resId = App:AddElement(Components.Custom.Result:new())

-- copy/paste bindings
function App.Interactions.Copy()
    return App:ElValGet(resId, "Label")
end
App.Interactions.Cut = App.Interactions.Copy

function App.Interactions.Paste(text)
    App:ElValSet(App._focused, "Value", text)
end
