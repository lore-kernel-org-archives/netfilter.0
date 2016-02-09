From: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>
Subject: Problem inserting a new connection with conntrack
Date: Tue, 9 Feb 2016 18:07:36 +0000
Message-ID: <A404B5896AB4F5468A8755AFC23F7317E42DE77F@EXMDB04.org.aalto.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear all,

I'm facing problems when trying to insert a custom made connection with=
 conntrack-tools.
I am running a VM  with Ubuntu 14.04, kernel 3.19.0-33 and conntrack v1=
=2E4.1. My network setup is the following:

Host-A: (lan0 @ 192.168.0.101) <---> (lan0 @ 192.168.0.1) Router (wan0 =
@ 198.18.0.10) <---> (wan0: 198.18.0.100) Host-B

The Host-A uses the router's IP as default gateway i.e. 192.168.0.1. Th=
e Router has the ip_forwarding and MASQUERADE enabled for doing NAT, i.=
e. iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o wan0 -j MASQUERA=
DE.

Now, I am attempting to play around with the connections created by the=
 NAT and insert some custom made entries into the NAT table.
I have tried to create NAT entries that correspond to outgoing traffic =
from Host-A towards Host-B, for both TCP and UDP with the following com=
mands:

#conntrack --create --orig-src 192.168.0.101 --orig-dst 198.18.0.100 --=
reply-src 198.18.0.100 --reply-dst 198.18.0.10 --proto 17 --orig-port-s=
rc 2222 --orig-port-dst 1111 --reply-port-src 1111 --reply-port-dst 222=
2 --timeout 60
#conntrack --create --orig-src 192.168.0.101 --orig-dst 198.18.0.100 --=
reply-src 198.18.0.100 --reply-dst 198.18.0.10 --proto 6   --orig-port-=
src 2222 --orig-port-dst 1111 --reply-port-src 1111 --reply-port-dst 22=
22 --timeout 60 --state SYN_SENT
=09
Using "conntrack --event" we can display a real-time event log. After i=
nserting the previous 2 flows the output is the following:

[UPDATE] udp      17 60 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 spor=
t=3D1111 dport=3D2222 mark=3D0
[UPDATE] tcp      6 60 SYN_SENT src=3D192.168.0.101 dst=3D198.18.0.100 =
sport=3D2222 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0=
=2E10 sport=3D1111 dport=3D2222 mark=3D0

The client in Host-A is running: nc -u -p 2222 198.18.0.100 1111 /  nc =
-p 2222 198.18.0.100 1111=20
The server in Host-B is running: nc -u -l 1111 / nc -l 1111

Using Wireshark I can see how the packet leaves the interface wan0 of t=
he router, however it isn't mangled as SNAT so the packet are forwarded=
 with the private IP address of the Host-A. This happens for both TCP a=
nd UDP. After the T timeout the entries expire and they are deleted. It=
 seems to me that the conntrack insertion works correctly, but for some=
 reason the NAT mangling is not happening anywhere. I have tried adding=
 with flows with different --status and --state values, to no avail.
[DESTROY] udp      17 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D22=
22 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222
[DESTROY] tcp      6 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D222=
2 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222


Of course, if I don't create any state manually everything works fine. =
The following can be seen from the conntrack events.
1. For the UDP connection
 [NEW] udp      17 30 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D22=
22 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222
 [UPDATE] udp      17 30 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dpo=
rt=3D2222
 [UPDATE] udp      17 180 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dpo=
rt=3D2222 [ASSURED]

2. For the TCP connection
 [NEW] tcp      6 120 SYN_SENT src=3D192.168.0.101 dst=3D198.18.0.100 s=
port=3D2222 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.=
10 sport=3D1111 dport=3D2222
 [UPDATE] tcp      6 60 SYN_RECV src=3D192.168.0.101 dst=3D198.18.0.100=
 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222
 [UPDATE] tcp      6 432000 ESTABLISHED src=3D192.168.0.101 dst=3D198.1=
8.0.100 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 =
sport=3D1111 dport=3D2222 [ASSURED]
 [UPDATE] tcp      6 120 FIN_WAIT src=3D192.168.0.101 dst=3D198.18.0.10=
0 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222 [ASSURED]
 [UPDATE] tcp      6 30 LAST_ACK src=3D192.168.0.101 dst=3D198.18.0.100=
 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111 dport=3D2222 [ASSURED]
 [UPDATE] tcp      6 120 TIME_WAIT src=3D192.168.0.101 dst=3D198.18.0.1=
00 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=
=3D1111 dport=3D2222 [ASSURED]

=46or helping me debug the situation I have enabled the trace in iptabl=
es as follows:
iptables -t raw -A PREROUTING -j TRACE
iptables -t raw -A OUTPUT -j TRACE

=46or the working UDP and TCP  connections I can see these 2 additional=
 traces that otherwise I don't if I set the entries myself. It seems th=
at this is indeed creating the forwarding entries in the NAT.
TRACE: nat:PREROUTING:policy:1 IN=3Dlan0 OUT=3D MAC=3D86:fd:78:53:64:91=
:52:29:24:5c:5d:f9:08:00 SRC=3D192.168.0.101 DST=3D198.18.0.100 LEN=3D3=
0 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D23351 DF PROTO=3DUDP SPT=3D2222 =
DPT=3D1111
TRACE: nat:POSTROUTING:rule:1 IN=3D OUT=3Dwan0 SRC=3D192.168.0.101 DST=3D=
198.18.0.100 LEN=3D30 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D23351 DF PRO=
TO=3DUDP SPT=3D2222 DPT=3D1111 LEN=3D10
TRACE: nat:PREROUTING:policy:1 IN=3Dlan0 OUT=3D MAC=3D86:fd:78:53:64:91=
:52:29:24:5c:5d:f9:08:00 SRC=3D192.168.0.101 DST=3D198.18.0.100 LEN=3D6=
0 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D22564 DF PROTO=3DTCP SPT=3D2222 =
DPT=3D1111 SEQ=3D67482932 ACK=3D0 WINDOW=3D29200 RES=3D0x00 SYN URGP=3D=
0 OPT (020405B40402080A0059ED100000000001030307)=20
TRACE: nat:POSTROUTING:rule:1 IN=3D OUT=3Dwan0 SRC=3D192.168.0.101 DST=3D=
198.18.0.100 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D22564 DF PRO=
TO=3DTCP SPT=3D2222 DPT=3D1111 SEQ=3D67482932 ACK=3D0 WINDOW=3D29200 RE=
S=3D0x00 SYN URGP=3D0 OPT (020405B40402080A0059ED100000000001030307)


Sorry for the lengthy email, I thought it was for the best to give all =
the facts that I could gather to explain the situation.

I would appreciate very much any kind of help you could give me. I have=
 hit this issue for a while now and cannot seem to get around it. My go=
al is to create very specific SNAT and DNAT entries as well as playing =
around with Application Layer Gateway for some protocols.

Thanks a lot in advance!

Jes=FAs Llorente Santos
Networking Technology
Department of Communications and Networking
Aalto University


