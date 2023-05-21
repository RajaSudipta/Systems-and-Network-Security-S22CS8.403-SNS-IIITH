#all this code will be running on server so that user cannot reverse engineer and solve the problem.
import sys
def preprocess_seed(number, l):
    binary_tmp = bin(number)[2:]
    nl = len(binary_tmp)
    pl = l - nl
    binary = ""
    for i in range(pl):
        binary = binary + '0'
    binary = binary + binary_tmp
    return binary[l//2:], binary[:l//2]


def xor_all_bits(number):
    binary = bin(number)[2:]
    ans = 0
    for x in binary:
        if x == '1':
            ans = ans ^ 1
    return ans


def H(seed, length=256, type_=0):  # Bit generator
    x, y = preprocess_seed(seed, length)
    g1 = 2442179
    g2 = 1721003
    p1 = 1215407
    p2 = 1995107
    if type_ == 1:
        p = p1
        g = g1
    else:
        p = p2
        g = g2
    h = pow(g, int(x, 2), p)
    mask = pow(2, int(length/2)) - 1
    h = h & mask
    g = h ^ int(y, 2)
    hcp = xor_all_bits(g)
    return int((bin(h)[2:]+bin(g)[2:]), 2), hcp


def PRG(seed, length, type_):
    ans = ''
    for i in range(length):
        seed, lambdas = H(seed, 256, type_)
        ans = ans+str(lambdas)
    return ans


def PRF(msg, key, length=256):
    some_pseudoRandomNumber = PRG(key, 256, 0)
    some_pseudoRandomNumber = int(some_pseudoRandomNumber, 2)
    res = isinstance(msg, str)
    if res:
        msg_binary = msg[::-1]
    else:
        msg_binary = bin(msg)[2:][::-1]
    output = ""
    temp = some_pseudoRandomNumber
    for x in msg_binary:
        if x == '1':
            temp, hcp = H(temp, 256, 1)
        else:
            temp, hcp = H(temp, 256, 0)
        output = output+str(hcp)
    return output


def check_prf(msg_,key): 
    # print("The recieved key is : " + str(msg_))
    msg_ = msg_.replace(":","")
    # print("The converted string is : " + str(msg_))
    msg_ = int(msg_, 16)
    # print("It's Integer equiv is: " + str(msg_))
    length = 1024
    return PRF(msg_, key, length)


if __name__ == "__main__":
    key = 1679872678414827949823452344723947324526575675483445687346757832523565734634784534959045423783245623451710213123 # only known to server
    msg_ = sys.argv[1]
    # msg_ = "08:00:27:fd:61:b5:00:00:00:00:00:00:"
    print(check_prf(msg_,key))
    # return check_prf(msg_,key)