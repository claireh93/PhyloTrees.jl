"""
Directed branch connecting two nodes of phylogenetic tree
"""
type Branch
  source::Int64
  target::Int64
  length::Nullable{Float64}

  function Branch(source::Int64, target::Int64, length::Nullable{Float64})
    if get(length, 0.) < 0
      error("Branch length must be positive")
    end
    new(source, target, length)
  end

  function Branch(source::Int64, target::Int64, length::Float64)
    if length < 0.
      error("Branch length must be positive")
    end
    new(source, target, Nullable(length))
  end

  function Branch(source::Int64, target::Int64)
    new(source, target, Nullable{Float64}())
  end

end


function show(io::IO, object::Branch)
  print(io, "\r\e[0m[node $(object.source)]-->[\e[1m$(get(object.length)) branch\e[0m]-->[node $(object.target)]")
end
