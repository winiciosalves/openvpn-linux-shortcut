#!/usr/bin/env bash
#
# Objetivo: vpn.sh - Solução para utilizar o OpenVPN utilizando um atalho na Area de Trabalho.
# Facilitar a conexão para os usuários Linux. Mantendo a execucao ativa, sem necessitar de manter o terminal aberto.
# Executar o processo em daemon(Background).
#
# GitHub Repository: https://github.com/winiciosalves
#
# Site: 	         https://winiciosalves.github.io/
#
# SocialNetwork:     https://www.linkedin.com/in/winicios-alves-74045595
#
# Author:            Winicios Alves
#
# Maintainer:        Winicios Alves
#
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
#   Exemplo de execucao:
#   $ ./vpn.sh
#     Neste exemplo o terminal /bin/bash sera aberto solicitando senha de root, para execucao do script. Em seguida sera solicitado suas credenciais que foram fornecidas.Logo em seguida a conexao sera efetuada e mostrara o processo em execucao com saída do comando "ps -ef".
#     Desconectar: sudo killall openvpn
#
#  Evidencias: 
# Shell: http://i.imgur.com/dmfhEnC.png
# GUI:   http://i.imgur.com/UJ80LZn.png
#
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
# ===============================Instrucoes de como utilizar atalho OpenVPN.desktop==========================================
#
# Instrucoes de como utilizar atalho OpenVPN.desktop
#
# 1.Copie os arquivo "vpn.sh" e "client.ovpn" para seu diretorio /home/seu-usuario;
#
# 2.Copie o arquivo OpenVPN.desktop para sua Area-de-Trabalho;
# 
# 3.Com seu editor de texto de sua preferencia, altere a linha(5)"Exec=/bin/bash /home/meu-nome-usuario/vpn.sh", inserindo o seu nome de usuario substituindo "nome-usuario" 
#
# 4.Realize um duplo clique OpenVPN.desktop;
#
# 5.Digite sua senha Root;
#
# 6.Digite suas credenciais da VPN (usuario/senha)fornecidas pelo time de Gestao de Acessos.
#
# 7.Se as credenciais estiverem sido digitada corretamente, conexao sera estabelecida com sucesso. O Terminal sera encerrado.
#
# 8. Caso necessite desconectar OpenVPN, digite o comando: sudo killall openvpn no terminal Bash.
#
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
# Historico:
#
#   Versao 1.0: 23/11/2020, Winicios Alves:
#
#    - Criacao da primeira versao contendo o processo da conexao openvpn em Background
#    - adiciona alias no terminal do usuario atual.
#
#   Versao 1.1: 24/11/2020, Winicios Alves
#
#    -Corrigido a verificação de instalação OpenVPN, quando não se encontra instalado.
#    -Removido alias desnecessário "alias vpn='sudo openvpn --daemon --config client.ovpn'"#    
#   
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
# Testado em:
#   GNU bash, 4.4.20(1)-release (x86_64-pc-linux-gnu)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
# Agradecimento:
# 	   
# EVEO Enterprise Cloud, por me inspirar e motivar aprender cada vez mais, sobre Cloud Computing e Infraestrutura Datacenter.
#       
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #
#
#OpenVPN instalado?
[ ! -x "$(which openvpn)" ] && echo -e "OpenVPN não instalado.\nIniciando instalação..." && sudo apt-get install openvpn -y
#
#Inicia o script solicitando senha do usuario root para autorizacao da execucao em Background.
sudo openvpn --daemon --config client.ovpn
#
#Se as credenciais estiverem corretas, mostrara o status do processo em execucao.
ps -ef|grep openvpn|grep -v grep
#
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #