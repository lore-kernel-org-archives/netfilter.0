From: thiago@powers.com.br
Subject: Re: issue with 'gre' over nat
Date: Mon, 14 Aug 2006 08:30:56 -0300
Message-ID: <OF36ED62CB.EB125411-ON832571CA.003EFAA9-832571CA.00403855@powers.com.br>
References: <OF12094EB7.69A39104-ON832571C7.0064BA49-832571C7.006AE032@powers.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF12094EB7.69A39104-ON832571C7.0064BA49-832571C7.006AE032@powers.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Just to finish my issue,
/proc/sys/net/ipv4/netfilter/ip_conntrack_generic_timeout does the time=
out
control for tracked non-tcp conns.

Regards,

--
Thiago Lucas
thiago@powers.com.br
POWERSolutions Inf. Ltda.




                                                                       =
    
             thiago@powers.com                                         =
    
             .br                                                       =
    
             Enviado Por:                                             P=
ara 
             netfilter-bounces         netfilter@lists.netfilter.org   =
    
             @lists.netfilter.                                         =
 cc 
             org                                                       =
    
                                                                   Assu=
nto 
                                       Re: issue with 'gre' over nat   =
    
             11/08/2006 16:16                                          =
    
                                                                       =
    
                                                                       =
    
                                                                       =
    
                                                                       =
    
                                                                       =
    




Yes, I was missing something. I wasn't keeping track of my packets comi=
ng
from the nat boxes (PREROUTING).

Now I can see for how long it will keep track of that connection,
therefore have more hosts making the connection to the remote server.

222.222.222.222 -> the remote server' ip address
555.555.555.555 -> my public ip address

------ before connection tracking
unknown  47 542 src=3D222.222.222.222 dst=3D555.555.555.555 packets=3D1=
5
bytes=3D919 [UNREPLIED] src=3D192.168.10.70 dst=3D222.222.222.222 packe=
ts=3D0
bytes=3D0 mark=3D0 use=3D1

------ after connection tracking
unknown  47 520 src=3D192.168.10.70 dst=3D222.222.222.222 packets=3D98
bytes=3D10005 src=3D222.222.222.222 dst=3D555.555.555.555 packets=3D168=

bytes=3D13368 mark=3D0 use=3D1

The third argument is the 'timer', which is decreasing from '600'
(seconds). So I figure that this is the compiled timeout for the 'gre'
(47) protocol.

So the problem should be gone... but its not. Debuging....

192.168.10.116 had the connection, already closed, so the connection
tracking is still there (/proc/net/ip_conntrack) but useless (right ?)
192.168.10.70 is trying to connect
222.222.222.222 is the remote address

(.....)
03:25:29.162994 IP 192.168.10.70.2054 > 222.222.222.222.1723: P
325:349(24) ack 189 win 65347: pptp CTRL_MSGTYPE=3DSLI PEER_CALL_ID(0)
SEND_ACCM(0xffffffff) RECV_ACCM(0xffffffff)
03:25:29.166692 IP 192.168.10.70 > 222.222.222.222: GREv1, call 0, seq =
0,
length 37: LCP, Conf-Request (0x01), id 0, length 23
03:25:29.177072 IP 222.222.222.222 > 192.168.10.116: GREv1, call 61290,=

ack 4294967295, no-payload, length 12
03:25:29.223171 IP 222.222.222.222.1723 > 192.168.10.70.2054: . ack 349=

win 5840                                            03:25:29.351156 IP
222.222.222.222 > 192.168.10.116: GREv1, call 61290, seq 1, length 41:
LCP, Conf-Request (0x01), id 1, length 27
03:25:31.166831 IP 192.168.10.70 > 222.222.222.222: GREv1, call 0, seq =
1,
length 37: LCP, Conf-Request (0x01), id 1, length 23
(....)

The conntrack entry for the old connection is getting hits when the new=

connection is made, and there's no new conntrack entry for the new
attempt.

rtrp0:/proc/net # egrep "222.222.222.222" ip_conntrack
unknown  47 598 src=3D192.168.10.116 dst=3D222.222.222.222 packets=3D44=

bytes=3D5291 src=3D222.222.222.222 dst=3D555.555.555.555 packets=3D121 =
bytes=3D6883
mark=3D0 use=3D1
rtrp0:/proc/net #

And thats it. Where's the new connection from 192.168.10.70 ?

--
Thiago Lucas
thiago@powers.com.br
POWERSolutions Inf. Ltda.
+55 (48) 3234-5500




thiago@powers.com.br
Enviado Por: netfilter-bounces@lists.netfilter.org
11/08/2006 14:07

Para
netfilter@lists.netfilter.org
cc

Assunto
issue with 'gre' over nat






Hello,

I have made some research in the maillist history, but had no luck.

The scenario:

nated boxes -> iptables gateway -> internet -> vpn server (runs pptp, a=
nd
has iptables also)

Note:1) allways trying one connection at time, 2) connection tracking
module is loaded

I can establish vpn connections (and acctually make use of it) with the=

remote vpn server many times, when the requests are originated from the=

same box (behind nat); if another computer behind this same nat tries t=
o
connect this vpn server, the tunnel doesn't come up. So we have:

computer1 -> vpn server (successful connect)
computer1 -> vpn server (successful disconnect)
computer1 -> vpn server (successful connect)
computer1 -> vpn server (successful disconnect)
computer2 -> vpn server (successful pptp connection, but stopping when =
the

tunnel should came up)

Tcpdump'ing the internal interface of the iptables gateway, I could see=

why. When the 'computer2' tries to make the connection, the 'gre' packe=
ts
are being forwarded to the wrong box, this scenario 'computer1'.

192.168.10.116 is the 'computer1', that has already finished his
connection with the remote vpn server.
192.168.10.107 is the 'computer2', trying to establish connection
222..222.222.222  is the remote host, just wrote that way to make easie=
r
to read.

Here=B4s the unsuccessful connection debug:

##
#### looks normal from here until.....
##
22:17:25.728082 IP (tos 0x0, ttl 128, id 12557, offset 0, flags [DF],
proto: TCP (6), length: 48) 192.168.10.179.2161 > 222.222.222.222.1723:=
 S,

cksum 0xd82a (correct), 4215463976:4215463976(0) win 65535 <mss
1460,nop,nop,sackOK>
22:17:25.844511 IP (tos 0x0, ttl  62, id 0, offset 0, flags [DF], proto=
:
TCP (6), length: 44) 222.222.222.222.1723 > 192.168.10.179.2161: S, cks=
um
0x7930 (correct), 1610087720:1610087720(0) ack 4215463977 win 5840 <mss=

1460>
22:17:25.844724 IP (tos 0x0, ttl 128, id 12558, offset 0, flags [DF],
proto: TCP (6), length: 196) 192.168.10.179.2161 > 222.222.222.222.1723=
: P

1:157(156) ack 1 win 65535: pptp Length=3D156 CTRL-MSG Magic-Cookie=3D1=
a2b3c4d

CTRL_MSGTYPE=3DSCCRQ PROTO_VER(1.0) FRAME_CAP(A) BEARER_CAP(A) MAX_CHAN=
(0)
FIRM_REV(2600) [|pptp]
22:17:25.966502 IP (tos 0x0, ttl  62, id 55217, offset 0, flags [DF],
proto: TCP (6), length: 40) 222.222.222.222.1723 > 192.168.10.179.2161:=
 .,

cksum 0x9051 (correct), 1:1(0) ack 157 win 5840
22:17:25.971002 IP (tos 0x0, ttl  62, id 55219, offset 0, flags [DF],
proto: TCP (6), length: 196) 222.222.222.222.1723 > 192.168.10.179.2161=
: P

1:157(156) ack 157 win 5840: pptp Length=3D156 CTRL-MSG
Magic-Cookie=3D1a2b3c4d CTRL_MSGTYPE=3DSCCRP PROTO_VER(1.0)
RESULT_CODE(1:Successful channel establishment) ERR_CODE(0:None)
FRAME_CAP() BEARER_CAP() MAX_CHAN(1) FIRM_REV(1) [|pptp]
22:17:25.971218 IP (tos 0x0, ttl 128, id 12559, offset 0, flags [DF],
proto: TCP (6), length: 208) 192.168.10.179.2161 > 222.222.222.222.1723=
: P

157:325(168) ack 157 win 65379: pptp Length=3D168 CTRL-MSG
Magic-Cookie=3D1a2b3c4d CTRL_MSGTYPE=3DOCRQ CALL_ID(256) CALL_SER_NUM(4=
8271)
MIN_BPS(300) MAX_BPS(100000000) BEARER_TYPE(Any) FRAME_TYPE(E)
RECV_WIN(64) PROC_DELAY(0) PHONE_NO_LEN(0) [|pptp]     22:17:26.096576 =
IP
(tos 0x0, ttl  62, id 55221, offset 0, flags [DF], proto: TCP (6), leng=
th:

72) 222.222.222.222.1723 > 192.168.10.179.2161: P, cksum 0x4f2e (correc=
t),

157:189(32) ack 325 win 5840: pptp Length=3D32 CTRL-MSG
Magic-Cookie=3D1a2b3c4d CTRL_MSGTYPE=3DOCRP CALL_ID(0) PEER_CALL_ID(256=
)
RESULT_CODE(1:Connected) ERR_CODE(0:None) CAUSE_CODE(0)
CONN_SPEED(100000000) RECV_WIN(32) PROC_DELAY(0) PHY_CHAN_ID(0)

22:17:26.100325 IP (tos 0x0, ttl 128, id 12560, offset 0, flags [DF],
proto: TCP (6), length: 64) 192.168.10.179.2161 > 222.222.222.222.1723:=
 P,

cksum 0x4fb9 (correct), 325:349(24) ack 189 win 65347: pptp Length=3D24=

CTRL-MSG Magic-Cookie=3D1a2b3c4d CTRL_MSGTYPE=3DSLI PEER_CALL_ID(0)
SEND_ACCM(0xffffffff) RECV_ACCM(0xffffffff)
##
#### ...here, where the gre requests from 192.168.10.179 are returning
wrongly to 192.168.10.116, that has nothing to do with this connection
##
22:17:26.102743 IP (tos 0x0, ttl 128, id 12561, offset 0, flags [none],=

proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,
Flags [key present, sequence# present], call 0, seq 0, length 37
22:17:26.122530 IP (tos 0x0, ttl  62, id 11033, offset 0, flags [DF],
proto: GRE (47), length: 65) 222.222.222.222 > 192.168.10.116: GREv1,
Flags [key present, sequence# present, ack present], call 256, seq 1, a=
ck
4294967295, length 45
 22:17:26.276681 IP (tos 0x0, ttl  62, id 55223, offset 0, flags [DF],
proto: TCP (6), length: 40) 222.222.222.222.1723 > 192.168.10.179.2161:=
 .,

cksum 0x8ed5 (correct), 189:189(0) ack 349 win 5840
22:17:28.103080 IP (tos 0x0, ttl 128, id 12564, offset 0, flags [none],=

proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,
Flags [key present, sequence# present], call 0, seq 1, length 37
22:17:28.122612 IP (tos 0x0, ttl  62, id 11034, offset 0, flags [DF],
proto: GRE (47), length: 61) 222.222.222.222 > 192.168.10.116: GREv1,
Flags [key present, sequence# present], call 256, seq 2, length 41
22:17:30.123688 IP (tos 0x0, ttl  62, id 11035, offset 0, flags [DF],
proto: GRE (47), length: 61) 222.222.222.222 > 192.168.10.116: GREv1,
Flags [key present, sequence# present], call 256, seq 3, length 41
22:17:31.103318 IP (tos 0x0, ttl 128, id 12565, offset 0, flags [none],=

proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,
Flags [key present, sequence# present], call 0, seq 2, length 37##
##... and so on until 'disconnect'.

In my '/proc/net/ip_conntrack' file, there's still the register for the=

previously disconnected connection.

ps.: 555.555.555.555 is my gateway public address
...
unknown  47 550 src=3D192.168.10.116 dst=3D222.222.222.222 packets=3D10=
47
bytes=3D154888 src=3D222.222.222.222 dst=3D555.555.555.555 packets=3D19=
84
bytes=3D990206 mark=3D0 use=3D1
...

Any known issues about it ? Or did I missed something ? Maybe connectio=
ng
tracking timeout is too long ? I don't believe or have knowledge of
something at the remote that could generate this kind of situation, as =
all

that the remote host knows about me is my public ip address and the mac=

address of my gateway's internal interface...

Thanks in advance.

--
Thiago Lucas
thiago@powers.com.br
POWERSolutions Inf. Ltda.





=



