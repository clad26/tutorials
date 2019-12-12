using Yao, Yao.AD, YaoExtensions

n = 4 # number of qubits
d = 5 # depth
circuit = dispatch!(variational_circuit(n, d),:random)

gatecount(circuit)

nparameters(circuit)

h = heisenberg(n)

for i in 1:1000

      _, grad = expect'(h, zero_state(n) => circuit)

      #grad = faithful_grad(h, zero_state(n) => circuit; nshots=100)

      dispatch!(-, circuit, 1e-2 * grad)
      println("Step $i, energy = $(real.(expect(h, zero_state(n)=>circuit)))")
end

using LinearAlgebra
w, _ = eigen(Matrix(mat(h)))

# This file was generated using Literate.jl, https://github.com/fredrikekre/Literate.jl

