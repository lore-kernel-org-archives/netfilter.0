From: Hack3rcon@mail2tor.com
Subject: iptables cannot perform forwarding operations correctly
Date: Sun, 13 Aug 2023 15:47:08 -0400
Message-ID: <a310fc060400bf83c7e43868e54aa878.squirrel@_>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
References: In-Reply-To: 
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I have an OpenVPN server with two NICs:

enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
inet 10.0.2.15 netmask 255.255.255.0 broadcast 10.0.2.255
inet6 fe80::a00:27ff:feed:b47c prefixlen 64 scopeid 0x20<link>
ether 08:00:27:ed:b4:7c txqueuelen 1000 (Ethernet)
RX packets 5427 bytes 398078 (388.7 KiB)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 3494 bytes 469688 (458.6 KiB)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
inet 192.168.1.20 netmask 255.255.255.0 broadcast 192.168.1.255
inet6 fe80::a00:27ff:fe74:6397 prefixlen 64 scopeid 0x20<link>
ether 08:00:27:74:63:97 txqueuelen 1000 (Ethernet)
RX packets 248 bytes 25264 (24.6 KiB)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 185 bytes 18570 (18.1 KiB)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0


I created a virtual NIC as below:

enp0s3:1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
inet 20.1.1.20 netmask 255.0.0.0 broadcast 20.255.255.255
ether 08:00:27:ed:b4:7c txqueuelen 1000 (Ethernet)


I want to use the local statement in my OpenVPN configuration file:

port 2000
proto udp
dev tun20
local 20.1.1.20
ca ca.crt
cert server.crt
key server.key
dh dh.pem
server 10.10.0.0 255.255.255.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 192.168.1.20"
keepalive 10 120
tls-crypt ta.key 0
data-ciphers AES-256-GCM
user nobody
group nogroup
persist-key
persist-tun
status /var/log/openvpn/openvpn-status.log
log /var/log/openvpn/openvpn.log
log-append /var/log/openvpn/openvpn.log
verb 3
explicit-exit-notify 1


I started the OpenVPN service and it worked:

tun20: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST> mtu 1500 inet
10.10.0.1 netmask 255.255.255.255 destination 10.10.0.2
inet6 fe80::11e1:ca11:30b1:2f04 prefixlen 64 scopeid 0x20<link>
unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00 txqueuelen 500
(UNSPEC)
RX packets 0 bytes 0 (0.0 B)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 8 bytes 384 (384.0 B)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0


I did the following iptables rules:

IF_MAIN=enp0s3:1
IF_TUNNEL=tun20
YOUR_OPENVPN_SUBNET=10.10.0.0/16
iptables -I INPUT -p udp --dport 2000 -j ACCEPT
iptables -A FORWARD -i $IF_MAIN -o $IF_TUNNEL -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s $YOUR_OPENVPN_SUBNET -o $IF_MAIN -j ACCEPT
iptables -t nat -A POSTROUTING -s $YOUR_OPENVPN_SUBNET -o $IF_MAIN -j
MASQUERADE
iptables -t nat -A POSTROUTING -s $YOUR_OPENVPN_SUBNET -j SNAT --to 20.1.1.20


My client configuration is:

client
dev tun20
proto udp
remote 192.168.1.20 2000
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
data-ciphers AES-256-GCM
verb 3
tls-crypt "C:\\ta.key" 1
ca "C:\\ca.crt"
cert "C:\\client.crt"
key "C:\\client.key"


When I try to connect to the server, the following error is displayed:

Sun Aug 13 11:12:33 2023 Note: --cipher is not set. OpenVPN versions
before 2.5 defaulted to BF-CBC as fallback when cipher negotiation failed
in this case. If you need this fallback please add
'--data-ciphers-fallback BF-CBC' to your configuration and/or add BF-CBC
to --data-ciphers.
Sun Aug 13 11:12:33 2023 Note: ovpn-dco-win driver is missing, disabling
data channel offload.
Sun Aug 13 11:12:33 2023 OpenVPN 2.6.5 [git:v2.6.5/cbc9e0ce412e7b42]
Windows-MSVC [SSL (OpenSSL)] [LZO] [LZ4] [PKCS11] [AEAD] [DCO] built on
Jun 13 2023
Sun Aug 13 11:12:33 2023 Windows version 6.1 (Windows 7), amd64 executable
Sun Aug 13 11:12:33 2023 library versions: OpenSSL 3.1.1 30 May 2023, LZO
2.10
Sun Aug 13 11:12:33 2023 DCO version: v0
Sun Aug 13 11:12:33 2023 MANAGEMENT: TCP Socket listening on
[AF_INET]127.0.0.1:25344
Sun Aug 13 11:12:33 2023 Need hold release from management interface,
waiting...
Sun Aug 13 11:12:33 2023 MANAGEMENT: Client connected from
[AF_INET]127.0.0.1:1035
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'state on'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'log on all'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'echo on all'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'bytecount 5'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'state'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'hold off'
Sun Aug 13 11:12:33 2023 MANAGEMENT: CMD 'hold release'
Sun Aug 13 11:12:33 2023 TCP/UDP: Preserving recently used remote address:
[AF_INET]192.168.1.20:2000
Sun Aug 13 11:12:33 2023 Socket Buffers: R=[8192->8192] S=[8192->8192] Sun
Aug 13 11:12:33 2023 UDPv4 link local: (not bound)
Sun Aug 13 11:12:33 2023 UDPv4 link remote: [AF_INET]192.168.1.20:2000 Sun
Aug 13 11:12:33 2023 MANAGEMENT: >STATE:1691908953,WAIT,,,,,,
Sun Aug 13 11:12:33 2023 read UDPv4: Connection reset by peer
(WSAECONNRESET) (fd=f4,code=10054)
Sun Aug 13 11:12:35 2023 read UDPv4: Connection reset by peer
(WSAECONNRESET) (fd=f4,code=10054)


I googled the OpenVPN error 10054 and this error is related to the wrong
firewall settings or wrong port forwarding, but I opened the appropriate
port.

How to solve it?

Thank you.

