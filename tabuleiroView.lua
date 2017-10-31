local controller = require("tabuleiroController")
view = {
	controller = nil
}

function view:iniciar()
	self.controller = controller:iniciar(self)
	return self
end

function view:desenharTabuleiro()
	display.newLine(display.contentWidth/3,0, display.contentWidth/3, display.contentHeight)
	display.newLine(display.contentWidth/3+display.contentWidth/3, 0, display.contentWidth/3+display.contentWidth/3,display.contentHeight)
	display.newLine(0, display.contentHeight/3, display.contentWidth, display.contentHeight/3)
	display.newLine(0, display.contentHeight/3+display.contentHeight/3, display.contentWidth, display.contentHeight/3+display.contentHeight/3)
end

function view:desenharRetanguloPosicao1()
	self.rect1 = display.newRect(0,0,display.contentWidth/3-1, display.contentHeight/3-1)
	self.rect1.anchorX = 0
	self.rect1.anchorY = 0
	self.rect1:setFillColor(0)
	self.rect1:addEventListener("touch", self.controller.marcarJogadaPosicao1)
end

function view:desenharXPosicao1()
	self.linha1P1 = display.newLine(0, 0, display.contentWidth/3, display.contentHeight/3)
	self.linha2P2 = display.newLine(display.contentWidth/3, 0, 0, display.contentHeight/3)
end

return view