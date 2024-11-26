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
        for network, tnqToDisps in pairs(org.provide) do
            for tnq, disps in pairs(tnqToDisps) do
                for uid, disp in pairs(disps) do
                    if disp.settings.network ~= network or not disp.signals[tnq] or not disp.signals[tnq].provideCount or disp.signals[tnq].provideCount == 0 then
                        log("ViiRLD: unexpected provider in org " .. var_dump(uid))
                        disps[uid] = nil
                    end
                end
            end
        end
        for network, tnqToRq in pairs(org.requestQueue) do
            for tnq, rq in pairs(tnqToRq) do
                for uid, disp in pairs(rq.queuedDisps) do
                    if disp.settings.network ~= network or not disp.signals[tnq] or not disp.signals[tnq].requestCount or disp.signals[tnq].requestCount == 0 then
                        log("ViiRLD: unexpected requester in org " .. var_dump(uid))
                        rq.queuedDisps[uid] = nil
                    end
                end
            end
        end
    end
end
