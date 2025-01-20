require("__core__.lualib.util")
require "script.utils"
require "script.units"
require "script.storage"
require "script.const"
require "script.config"
require "script.org"
require "script.train"
require "script.entity"

for _, orgs in pairs(storage.orgs) do
    for _, org in pairs(orgs) do
        for _, disp in pairs(org.disps) do
            if disp.readyTrainTypeDepot then
                log("ViiRLD: Removed readyTrainTypeDepot from " .. var_dump(disp.uid))
                disp.readyTrainTypeDepot = nil
            end
        end
    end
end
