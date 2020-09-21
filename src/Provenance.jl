module Provenance

using Dates
using UUIDs

using DocStringExtensions

@enum ActivityStatus unfinished finished error

struct SystemProvenance
end

struct SystemState
end


mutable struct Activity
    uuid::UUID
    name::AbstractString
    parent_activity::UUID
    child_activities::Vector{UUID}
    start::DateTime
    stop::DateTime
    system::SystemProvenance
    input::Vector{AbstractString}
    output::Vector{AbstractString}
    samples::Vector{SystemState}
    status::ActivityStatus
end

end # module
