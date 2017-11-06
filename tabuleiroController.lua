local model = require("tabuleiroModel")
local jogador = require("jogador")

tabuleiroController = {
	model = nil,
	view = nil,
	jogador = nil
}

function tabuleiroController:iniciar(view)
	print("tabuleiroControllerIniciar")
	self.view = view
	self.model = model:iniciar()
	self.jogador = jogador:iniciar("X")
	return self
end

function tabuleiroController.retanguloListener(event)
	if event.phase == "began" then
		print("retanguloListener",event.x,event.y)
		local p = tabuleiroController.view:transoformarXYEmPosicao (event.x, event.y)
		local linhaColuna = transformarPosicaoEmLinhaColuna(p)
		if tabuleiroController.model:marcarJogada(linhaColuna[1], linhaColuna[2], tabuleiroController.jogador.simbolo) then
			print("alternar")
			tabuleiroController.jogador:alternar()
			tabuleiroController.view:atualizarTabela()
			tabuleiroController.view:desenharLinhaVencedor()
		end
	end
end

function tabuleiroController:verificarVencedor ()
	return self.model:verificarVencedor()
end

function tabuleiroController:verificarPosicoesMarcadas ()
	print("ControllerVerificarPosicoesMarcadas")
	return self.model:verificarPosicoesMarcadas()
end

function transformarPosicaoEmLinhaColuna (posicao)
	local posicoes = {
		{1,1},
		{1,2},
		{1,3},
		{2,1},
		{2,2},
		{2,3},
		{3,1},
		{3,2},
		{3,3}
	}
	return posicoes[posicao]
end

function tabuleiroController:verificarLinhasColunasVencedor ()
	return self.model:verificarLinhasColunasVencedor()
end

return tabuleiroController
