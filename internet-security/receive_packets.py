import socket
import argparse

# create parser
parser = argparse.ArgumentParser()
parser.add_argument('--ip', default='127.0.0.1')
parser.add_argument('--port', default=9090)
args = parser.parse_args()

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((args.ip, args.port))

while True:
    data, ((ip, port)) = sock.recvfrom(1024)
    print(f"sender :{ip}, port: {port}")
    print(f'received message: {data}')
