tabuleiroModel = {
	{"","",""},
	{"","",""},
	{"","",""}
}
local posicaoVencedor = {}

function tabuleiroModel:iniciar()
	print("tabuleiroModelIniciar")
	for i,v in ipairs(self) do
		for j,v2 in ipairs(self[i]) do
			self[i][j] = ""
		end
	end
	return self
end

function tabuleiroModel:marcarJogada(linha, coluna, simbolo)
	print("marcarJogada", linha, coluna, simbolo)
	for i,v in ipairs(self) do
		for j,v2 in ipairs(v) do
			if self:verificarPosicao(linha,coluna) then
				self[linha][coluna] = simbolo
				print("return true")
				return true
			end
		end
	end
	print("return false")
	return false
end

function tabuleiroModel:verificarPosicao(linha, coluna)
	print("verificarPosicao", linha, coluna)
	if self[linha][coluna] == "" then
		return true
	end
	return false
end

function tabuleiroModel:verificarEmpate ()
	for i,v in ipairs(self) do
		for j,v2 in ipairs(v) do
			if v2 == "" then
				return false
			end
		end
	end
	return true
end

function tabuleiroModel:verificarVencedor ()
	print("verificarVencedor")
	local posicoesVencedor = {
		{self[1][1], self[1][2], self[1][3]},
		{self[2][1], self[2][2], self[2][3]},
		{self[3][1], self[3][2], self[3][3]},
		{self[1][1], self[2][1], self[3][1]},
		{self[1][2], self[2][2], self[3][2]},
		{self[1][3], self[2][3], self[3][3]},
		{self[1][1], self[2][2], self[3][3]},
		{self[1][3], self[2][2], self[3][1]}
	}
	for i,v in ipairs(posicoesVencedor) do
		if (v[1]==v[2] and v[1]==v[3]) and v[1]~="" then
			print("houve vencedor")
			return true
		end
	end
	print("não houve vencedor")
	return false
end

function tabuleiroModel:verificarLinhasColunasVencedor ()

	for i,v in ipairs(self) do
		if ((self[i][1] == self[i][2]) and (self[i][2] == self[i][3])) and (self[i][1] ~= "") then
			return {{i,1},{i,2},{i,3}}
		end
	end
	for i,v in ipairs(self) do
		if ((self[1][i] == self[2][i]) and (self[1][i] == self[3][i])) and (self[1][i] ~= "") then
			return {{1,i},{2,i},{3,i}}
		end
	end
	if((self[1][1] == self[2][2]) and (self[1][1] == self[3][3])) and (self[1][1] ~= "") then
		return {{1,1},{2,2},{3,3}}
	end
	if ((self[1][3] == self[2][2]) and (self[1][3] == self[3][1])) and (self[1][3] ~= "") then
		return {{1,3},{2,2},{3,1}}
	end
end

function tabuleiroModel:verificarPosicoesMarcadas ()
	print("tabuleiroVerificarPosicoesMarcadas")
	local posicoes = {}
	for i,v in ipairs(self) do
		for j,v2 in ipairs(v) do
			if v2 ~= "" then
				print("V2",v2)
				local tabela = {linha = i, coluna = j, simbolo = v2}
				table.insert(posicoes, tabela)
			end
		end
	end
	return posicoes
end

return tabuleiroModel
