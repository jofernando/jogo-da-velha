local model = require("tabuleiroModel")

controller = {
	model = nil, 
	view = nil
}

function controller:iniciar(view)
	self.view = view
	self.model = model:iniciar()
	return self
end

function controller.marcarJogadaPosicao1(event)
	controller.model:marcarJogada(1,1,1)
	controller.view:desenharXPosicao1()
end



return controller