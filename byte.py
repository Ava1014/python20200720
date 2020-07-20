
b1 = b"hello kitty"
b2 = "死贵".encode()
print(type(b1))
print(type(b2))
message = "hi,周杰伦"
b3 = message.encode()
print(b3) # b'hi,\xe5\x91\xa8\xe6\x9d\xb0\xe4\xbc\xa6'
print("转为字符串：", b3.decode())
print("转为字符串：", b'hi,\xe5\x91\xa8\xc5\x9d\xb0\xf1\xbc\xa1'.decode()) # UnicodeDecodeError
# 所有的字符串都能转换为字节串
# 不是所有的字节串都能转换为字符串
