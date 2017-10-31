tabuleiro = {
	{{},{},{}},
	{{},{},{}},
	{{},{},{}}
}

function tabuleiro:iniciar()
	for i,v in ipairs(self) do
		for i2,v2 in ipairs(self[i]) do
			v2 = 0
		end		
	end
	return self
end

function tabuleiro:marcarJogada(linha, coluna, valor)
	if self:verificarPosicao(linha, coluna) then
		self[linha][coluna] = valor
		return true
	end
	return false
end

function tabuleiro:verificarPosicao(linha, coluna)
	if self[linha][coluna] == 0 then
		return true
	end
	return false
end

function tabuleiro:retornarPosicoesX( ... )
	local posicoes = {}
	for i,v in ipairs(self) do
		for i2,v2 in ipairs(self[i]) do
			if v2 == 1 then
				table.insert(posicoes, {i, i2})
		end
	end
	return posicoes
end

return tabuleiro