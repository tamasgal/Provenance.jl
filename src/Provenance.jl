module Provenance

using Dates
using UUIDs
using Pkg

using DocStringExtensions

@enum ActivityStatus unfinished finished

struct SystemProvenance
end

struct SystemState
end


mutable struct Activity
    uuid::UUID
    name::String
    parent_activity::Union{UUID, Nothing}
    child_activities::Vector{UUID}
    start::Union{DateTime, Nothing}
    stop::Union{DateTime, Nothing}
    system::SystemProvenance
    input::Vector{String}
    output::Vector{String}
    samples::Vector{SystemState}
    status::ActivityStatus

    Activity(name; parent_activity=nothing) = new(
        uuid4(),
        name,
        parent_activity,
        [],
        now(),
        nothing,
        SystemProvenance(),
        [],
        [],
        [],
        unfinished
    )
end

const activities = Activity[]
push!(activities, Activity("Main activity"))

const backlog = Activity[]

function startactivity(name)
    parent_activity = activities[end]
    activity = Activity(name, parent_activity=parent_activity.uuid)
    push!(activities, activity)
    push!(parent_activity.child_activities, activity.uuid)
    nothing
end

function endactivity()
    activity = pop!(activities)
    finish(activity)
    push!(backlog, activity)
    nothing
end

function finish(activity::Activity)
    activity.status = finished
    nothing
end

end # module
