# encoding: utf-8
# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.
require File.dirname(__FILE__) + '/../../step_definitions/generic_qa.rb'

include GenericQA

Quando(/^eu informo minha idade igual a (.+) anos$/) do |idade|
  steps "Quando eu preencho o campo \"idade\" com \"#{idade}\"" 
end

Entao (/^eu verei a mensagem "(.*)"$/) do | mensagem |
  steps "Entao eu verei \"#{mensagem}\" em \"#lblresposta\"" 
end

Entao(/^eu preencho e valido os campos com os seguintes atributos:$/) do |table|
    data =  retorna_tabela_hash(table)
    count = data['login'].size.to_i
    count.times do | vnum |
      find(:id, 'login').set(data['login'][vnum].to_s)
      find(:id, 'password').set(data['password'][vnum].to_s)
    	click_button('Login')
      expect(page).to have_css "#result", :text => data['result'][vnum].to_s
      click_button('Back')
      # steps "Quando eu vou para a pagina de Login"
	end
end

Quando(/^eu executo logon no site$/) do
  steps %Q{ Quando eu preencho o campo "login" com "robson"
            E eu preencho o campo "password" com "agapito"
            E eu pressiono "Login"}  
end


