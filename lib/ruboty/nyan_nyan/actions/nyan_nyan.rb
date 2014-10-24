module Ruboty
  module NyanNyan
    module Actions
      class NyanNyan < Ruboty::Actions::Base
        def call
          if message.robot.nyan_nyan?
            message.robot.unnekonize!
            message.reply("ﾊﾆｬﾝ!?")
          else
            message.reply("ﾊﾆｬﾆｬ｡｡｡")
            message.robot.nekonize!
          end
        end
      end
    end
  end
end
