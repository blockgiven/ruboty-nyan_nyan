require "ruboty"
require "ruboty/nyan_nyan/version"
require "ruboty/handlers/nyan_nyan"
require "ruboty/nyan_nyan/actions/nyan_nyan"
require "uri"

module Ruboty
  module NyanNyan
    NAMESPACE = 'nyan_nyan'

    def say(message)
      super and return unless nyan_nyan?

      nyan_body = Enumerator.new {|y|
        message[:body].to_s.lines.each do |line|
          loop do
            url = line[URI.regexp(%w(http https))]

            if url
              token, line = line.split(url, 2)
              y << token.gsub(/[^ー〜 \n]{3}/, 'ﾆｬﾝ').gsub(/[^ー〜ﾆｬ \n]{2}/, 'ﾆｬ').gsub(/[^ー〜ﾆｬﾝ \n]/, 'ﾆｬ')
              y << url
            else
              y << line.gsub(/[^ー〜 \n]{3}/, 'ﾆｬﾝ').gsub(/[^ー〜ﾆｬ \n]{2}/, 'ﾆｬ').gsub(/[^ー〜ﾆｬﾝ \n]/, 'ﾆｬ')
              break
            end
          end
        end
      }.to_a.join

      super(message.merge(body: nyan_body))
    end

    def nyan_nyan?
      brain.data[NAMESPACE]
    end

    def nekonize!
      brain.data[NAMESPACE] = true
    end

    def unnekonize!
      brain.data[NAMESPACE] = false
    end
  end
end

Ruboty::Robot.prepend(Ruboty::NyanNyan)
