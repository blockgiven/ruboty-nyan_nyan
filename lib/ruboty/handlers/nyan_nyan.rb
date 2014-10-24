module Ruboty
  module Handlers
    class NyanNyan < Base
      on /(nyan nyan|にゃんにゃん)/, name: 'nyan_nyan', description: 'nekonize and unnekonize'

      def nyan_nyan(message)
        Ruboty::NyanNyan::Actions::NyanNyan.new(message).call
      end
    end
  end
end
