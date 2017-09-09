require 'sinatra'
require 'sinatra\reloader'

encode = ""

get '/' do
    encode = caesar_cipher(params['word'], params['shift'])
    erb :index, :locals => {:encode => encode}
end

def caesar_cipher(cipher,factor)
    factor = factor.to_i
    words = cipher.split("")
    words.each do |i|
        if i.match(/[a-zA-Z]/)
            factor.times do
                i.next!
            end
        end
    end
    words.join()
end