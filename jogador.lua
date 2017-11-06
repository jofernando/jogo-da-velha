local jogador = {
  simbolo = nil
}

function jogador:iniciar (simbolo)
  self.simbolo = simbolo
  return self
end

function jogador:alternar ()
  print("alternando")
  if self.simbolo == "X" then
    self.simbolo = "O"
  else
    self.simbolo = "X"
  end
end

function jogador:retornarSimbolo()
  return jogador.simbolo
end

return jogador
