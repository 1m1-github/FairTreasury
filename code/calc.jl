# https://github.com/balancer-labs/balancer-v2-monorepo/blob/592b0534f782b9bfb668990f7821e041a9b775d4/pkg/pool-weighted/contracts/WeightedMath.sol

# 256bit * 256bit

# m=2^7-1
# 2^14
# m*m

# params

B_i = 50 # balance input
B_o = 100 # balance output
A_i = 10 # amount input
w_i = 20 # weight input * 100
w_o = 80 # weight output * 100

# exact

a = B_i / (B_i + A_i)
w = w_i / w_o
b = a ^ w
A_o = B_o * (1 - b)
@show A_o

# taylor

function log_taylor(a)
    b = -log(2)
    c = a - 0.5
    s = b
    t = 2*c
    s += t
    t = -2*c^2
    s += t
end
function pow_taylor(a,b,l)
    a_s = sqrt(a)
    l_a = l(a)
    c = (b - 0.5) * l_a
    s = a_s
    t = a_s * c
    s += t
    t = a_s * c^2 * 0.5
    s += t
end
a,b=0.6,0.6
pow_taylor(a, b, log)
pow_taylor(a, b, log_taylor)
a^b

# int64



# play
log2(1e18)


"2"
"3"
"\\t\\xf6" -> 2550

2->"0000000000000002"
3->"0000000000000003"
"\\x06" -> 6

16^2+9
191
1+9*16+16^2

04b3
b=11
3+b*16+4*16^2

parse(UInt128, "d3c21bcecceda0000000", base = 16)

x=UInt128(1e20)
log2(x)

x=BigInt(1e20)
x^2

s = string(BigInt(1e40), base = 16)

s = string(x, base = 16)
s = string(x^2, base = 16)
UInt128(0x56bc75e2d63100000)

1d6329f1c35ca500000000000000000000
1d6329f1c35ca4bfabb9f5610000000000
1d6329f1c35ca4bfabb9f5610000000000

Int(s[end-13])-48
Int(0xd)

a="0x$(s[end-13])"
Int(a)

t=BigInt(0)
for i in length(s):-1:1
    x=Int(parse(UInt32, s[i], base=16))
    î = length(s) - i
    t += BigInt(x*16^î)
    @show î, s[i], x, t
end

using ArbNumerics
setprecision(ArbFloat, 750)
ArbFloat(1e20)

length(string(big"0x056bc75e2d63100000"^1))
length(string(big"0x056bc75e2d63100000"^2))
big"0x056bc75e2d63100000"
big"0x1d6329f1c35ca500000000000000000000"
big"0x1d6329f1c35ca4bfabb9f5610000000000"
length("10000000000000000000000000000000000000000")
length("100000000000000000000")
string(1)

length(string(big"2"^200, base=16)) == 200/4 + 1

# math_params
string(BigInt(1e18), base = 16)
string(BigInt(1e36), base = 16)

0.8^0.37

