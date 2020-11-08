import socket
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--ip', default='127.0.0.1')
parser.add_argument('--port', default=9090, type=int)
parser.add_argument('--data', required=True)

args = parser.parse_args()
data = args.data.encode('utf-8')

# AD_INET is ipv4, SOCK_DGRAM is UDP
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.sendto(data, (args.ip, args.port))

