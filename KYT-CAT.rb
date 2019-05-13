#!/usr/bin/env ruby

require 'ruby2d'
require './Game.rb'

set width: 1280, height: 720
set title: "KYT-CAT"

backgroud = Image.new(
    "res/bg.jpeg",
    x: 0, y: 0,
    width: 1280, height: 720
)

game = Game.new

on :key_held do |event|
    game.inputHeld(event)
end

on :key_down do |event|
    game.inputDown(event)
end

update do
    game.mainLoop
end

show