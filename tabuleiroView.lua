local controller = require("tabuleiroController")

local largura = display.contentWidth
local altura = display.contentHeight

tabuleiroView = {
	controller = nil,
	coordenadasPosicoes = {
    {0           ,0          ,largura/3    ,altura/3},
    {largura/3   ,0          ,largura/1.5  ,altura/3},
    {largura/1.5 ,0          ,largura      ,altura/3},
    {0           ,altura/3   ,largura/3    ,altura/1.5},
    {largura/3   ,altura/3   ,largura/1.5  ,altura/1.5},
    {largura/1.5 ,altura/3   ,largura      ,altura/1.5},
    {0           ,altura/1.5 ,largura/3    ,altura},
    {largura/3   ,altura/1.5 ,largura/1.5  ,altura},
    {largura/1.5 ,altura/1.5 ,largura      ,altura}
  },
  coordenadasDesenhos = {
    {(largura/3)/2,(altura/3)/2},
    {largura/2,(altura/3)/2},
    {largura*0.85,(altura/3)/2},
    {(largura/3)/2,altura/2},
    {largura/2,altura/2},
    {largura*0.85,altura/2},
    {(largura/3)/2,altura*0.85},
    {largura/2,altura*0.85},
    {largura*0.85,altura*0.85}
  }
}

function tabuleiroView:iniciar()
	print("tabuleiroViewIniciar")
	self.controller = controller:iniciar(self)
	return self
end

function tabuleiroView:desenharTabuleiro()
	print("desenharTabuleiro")
	self:desenharRetangulo()
	display.newLine(largura/3, 0, largura/3, altura)
	display.newLine(largura/1.5, 0, largura/1.5,altura)
	display.newLine(0, altura/3, largura, altura/3)
	display.newLine(0, altura/1.5, largura, altura/1.5)
end

function tabuleiroView:desenharLinhaVencedor ()
	if self.controller:verificarVencedor() then
		print("desenharVencedor")
		local posicoes = self.controller:verificarLinhasColunasVencedor()
		local p1 = transformarLinhaColunaEmPosicao(posicoes[1][1],posicoes[1][2])
		local p2 = transformarLinhaColunaEmPosicao(posicoes[2][1],posicoes[2][2])
		local p3 = transformarLinhaColunaEmPosicao(posicoes[3][1],posicoes[3][2])
		local coordenadas = self:retornarCoordenadasParaDesenharLinha(p1,p2,p3)
		self:desenharLinha(coordenadas[1],coordenadas[2],coordenadas[3],coordenadas[4])
	end
end

function tabuleiroView:desenharLinha (x,y,x2,y2)
	self.rect1:removeSelf()
	local linha = display.newLine(x,y,x2,y2)
	linha.strokeWidth = 20
end

function tabuleiroView:desenharRetangulo()
	print("desenharRetangulo")
	self.rect1 = display.newRect(0,0,largura, altura)
	self.rect1.anchorX = 0
	self.rect1.anchorY = 0
	self.rect1:setFillColor(0)
	self.rect1:addEventListener("touch", self.controller.retanguloListener)
end

function tabuleiroView:atualizarTabela ()
	print("atualizarTabela")
	local posicoesMarcadas = self.controller:verificarPosicoesMarcadas()
	for i,v in pairs(posicoesMarcadas) do
		print("linha",v.linha)
		local p = transformarLinhaColunaEmPosicao(posicoesMarcadas[i].linha,posicoesMarcadas[i].coluna)
		print("p",p)
		self:desenharSimbolo( self.coordenadasDesenhos[p][1], self.coordenadasDesenhos[p][2], posicoesMarcadas[i].simbolo)
	end
end

function tabuleiroView:desenharSimbolo (x, y, simbolo)
	print("desenharSimbolo")
	if simbolo == "X" then
		print("desenha x")
		display.newImage("xix.png",x,y)
	elseif simbolo == "O" then
		print("desenha o")
		display.newImage("bola.png",x,y)
	end
end

function transformarLinhaColunaEmPosicao (linha, coluna)
	print("transformarLinhaColunaEmPosicao ui")
	local posicoes = {
	  linha1coluna1 = 1,
	  linha1coluna2 = 2,
	  linha1coluna3 = 3,
	  linha2coluna1 = 4,
	  linha2coluna2 = 5,
	  linha2coluna3 = 6,
	  linha3coluna1 = 7,
	  linha3coluna2 = 8,
	  linha3coluna3 = 9
	}
	print(posicoes["linha"..linha.."coluna"..coluna])
	return posicoes["linha"..linha.."coluna"..coluna]
end

function tabuleiroView:transoformarXYEmPosicao (x, y)
	print("verificarPosicao")
	for i,v in ipairs(self.coordenadasPosicoes) do
		if (x>=v[1] and x<=v[3]) and (y>=v[2] and y<=v[4]) then
			return i
		end
	end
end

function tabuleiroView:retornarCoordenadasParaDesenharLinha (p1,p2,p3)
	local posicoes = {
		{{1,2,3},{0,(altura/3)/2,largura,(altura/3)/2}},
		{{4,5,6},{0,altura/2,largura,altura/2}},
		{{7,8,9},{0,altura*0.85,largura,altura*0.85}},
		{{1,4,7},{(largura/3)/2,0,(largura/3)/2,altura}},
		{{2,5,8},{largura/2,0,largura/2,altura}},
		{{3,6,9},{largura*0.85,0,largura*0.85,altura}},
		{{1,5,9},{0,0,largura,altura}},
		{{3,5,7},{largura,0,0,altura}}
}
	for i,v in ipairs(posicoes) do
		if v[1][1]==p1 and v[1][2]==p2 and v[1][3]==p3 then
			return {v[2][1], v[2][2], v[2][3], v[2][4]}
		end
	end
end

return tabuleiroView
