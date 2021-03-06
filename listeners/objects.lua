Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local handle, object = FindFirstObject()
        local finished = false

        while not finished do
            Citizen.Wait(1)

            if (IsEntityAttached(object) and DoesEntityExist(object)) then
                if (GetEntityModel(object) == GetHashKey('prop_acc_guitar_01')) then
                    {{{module}}}.RequestAndDelete(object, true)
                end
            end

            for _, _object in pairs({{{module}}}.{{{BlacklistedObjects}}} or {}) do
                if (GetEntityModel(object) == GetHashKey(_object)) then
                    {{{module}}}.RequestAndDelete(object, false)
                end
            end

            finished, object = FindNextObject(handle)
        end

        EndFindObject(handle)
    end
end)
