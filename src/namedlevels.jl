#= Tools for working with levels by name
The indexed e.g. a type that represents a corpus must impliment

levels(indexed)::Vector{Pair{Symbol, Int}}
The returned vector maps Named levels to their numbers
Multiple names can be given to the name nmbered level (Many to One)
=#


exclude_levels(corpus) = unique(last.(levels(corpus)))


function exclude_levels(corpus, nums::Vararg{<:Integer})
    all_levels = exclude_levels(corpus)
    set_diff(all_levels, nums)
    # all the levels, except the ones we are excluding
end

function exclude_levels(corpus, names::Vararg{Symbol})
    exclude_levels(corpus, include_levels(corpus, names))
end

include_levels(corpus) = Int[]

include_levels(corpus, nums::Vararg{<:Integer}) = nums

function include_levels(corpus, names::Vararg{Symbol})
    inds = findin(names, first.(levels(corpus)))
    level_nums = last.(levels(corpus)[inds])
    include_levels(corpus, level_nums...)
end
