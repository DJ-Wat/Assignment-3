-----------------------------------------------------------------------------------------
--
-- Pizza Orderer
-- Created by DJ Watson on March 26, 2019
-----------------------------------------------------------------------------------------
  
local LButton = display.newImageRect( "assets/L.png", 50, 50)
LButton.id = "Large Pizza button"
LButton.x = display.contentCenterX - 75
LButton.y = display.contentCenterY

local XLButton = display.newImageRect( "assets/XL.png", 50, 50)
XLButton.id = "XLarge Pizza button"
XLButton.x = display.contentCenterX + 75
XLButton.y = display.contentCenterY

local nToppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY -200, 100, 50)
nToppingsTextField.id = "amount textField"
display.setDefault("background", 0, 0, 2)

local ToppingNText = display.newText('How many toppings?', display.contentCenterX, display.contentCenterY - 250, native.systemFont, 30)

local SizeText = display.newText('Which pizza size?', display.contentCenterX, display.contentCenterY - 100, native.systemFont, 30)

local LargeText = display.newText('Large', display.contentCenterX - 75, display.contentCenterY - 50, native.systemFont, 20)

local XLargeText = display.newText('XL', display.contentCenterX + 75, display.contentCenterY - 50, native.systemFont, 20)

function round(val, decimal)
  if (decimal) then
    return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
  else
    return math.floor(val+0.5)
  end
end

local function calculatePrice (event)
 local tax = subtotal * 0.13
 local total = subtotal + tax
 local showsubtotal = display.newText ( 'Subtotal = $' ..string.format(round (subtotal,2)), display.contentCenterX, display.contentCenterY + 50, native.systemFont, 15)
 showsubtotal:setTextColor(1,1,1)
 local showtax = display.newText ( 'Tax = $' ..string.format(round (tax,2)), display.contentCenterX, display.contentCenterY + 70, native.systemFont, 15)
 showtax:setTextColor(1,1,1)
 local showtotal = display.newText ( 'Total = $' ..string.format(round (total,2)), display.contentCenterX, display.contentCenterY + 90, native.systemFont, 15)
 showtotal:setTextColor(1,1,1)
end

local function onLButtonTouch(event)
 amount = tonumber(nToppingsTextField.text)
 print(nToppingsTextField.text)
 if amount == 1 then
  subtotal = 6 + 1
  calculatePrice()
 elseif amount == 2 then
  subtotal = 6 + 1.75
  calculatePrice()
 elseif amount == 3 then
  subtotal = 6 + 2.5
  calculatePrice()
 elseif amount == 4 then
  subtotal = 6 + 3.35
  calculatePrice()
 else
  local errorText = display.newText('ERROR: Invalid number of toppings', display.contentCenterX, display.contentCenterY +100, native.systemFont, 20)
  errorText:setFillColor(1,0,0)
 end
end

local function onXLButtonTouch(event)
 amount = tonumber(nToppingsTextField.text)
 print(nToppingsTextField.text)
 if amount == 1 then
  subtotal = 10 + 1
  calculatePrice()
 elseif amount == 2 then
  subtotal = 10 + 1.75
  calculatePrice()
 elseif amount == 3 then
  subtotal = 10 + 2.5
  calculatePrice()
 elseif amount == 4 then
  subtotal = 10 + 3.35
  calculatePrice()
 else
  local errorText = display.newText('ERROR: Invalid number of toppings', display.contentCenterX, display.contentCenterY +100, native.systemFont, 20)
  errorText:setFillColor(1,0,0)
 end
end

LButton:addEventListener("touch", onLButtonTouch)
XLButton:addEventListener("touch", onXLButtonTouch)