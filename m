From: thiago@powers.com.br
Subject: issue with 'gre' over nat
Date: Fri, 11 Aug 2006 14:07:49 -0300
Message-ID: <OF9E9DDECA.67360F0D-ON832571C7.004F26DB-832571C7.005F0D4F@powers.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello,

I have made some research in the maillist history, but had no luck.

The scenario:=20

nated boxes -> iptables gateway -> internet -> vpn server (runs pptp, and=20
has iptables also)

Note:1) allways trying one connection at time, 2) connection tracking=20
module is loaded

I can establish vpn connections (and acctually make use of it) with the=20
remote vpn server many times, when the requests are originated from the=20
same box (behind nat); if another computer behind this same nat tries to=20
connect this vpn server, the tunnel doesn't come up. So we have:

computer1 -> vpn server (successful connect)
computer1 -> vpn server (successful disconnect)
computer1 -> vpn server (successful connect)
computer1 -> vpn server (successful disconnect)
computer2 -> vpn server (successful pptp connection, but stopping when the =

tunnel should came up)

Tcpdump'ing the internal interface of the iptables gateway, I could see=20
why. When the 'computer2' tries to make the connection, the 'gre' packets=20
are being forwarded to the wrong box, this scenario 'computer1'.

192.168.10.116 is the 'computer1', that has already finished his=20
connection with the remote vpn server.
192.168.10.107 is the 'computer2', trying to establish connection
222..222.222.222  is the remote host, just wrote that way to make easier=20
to read.

Here=B4s the unsuccessful connection debug:

##
#### looks normal from here until.....
##
22:17:25.728082 IP (tos 0x0, ttl 128, id 12557, offset 0, flags [DF],=20
proto: TCP (6), length: 48) 192.168.10.179.2161 > 222.222.222.222.1723: S, =

cksum 0xd82a (correct), 4215463976:4215463976(0) win 65535 <mss=20
1460,nop,nop,sackOK>
22:17:25.844511 IP (tos 0x0, ttl  62, id 0, offset 0, flags [DF], proto:=20
TCP (6), length: 44) 222.222.222.222.1723 > 192.168.10.179.2161: S, cksum=20
0x7930 (correct), 1610087720:1610087720(0) ack 4215463977 win 5840 <mss=20
1460>
22:17:25.844724 IP (tos 0x0, ttl 128, id 12558, offset 0, flags [DF],=20
proto: TCP (6), length: 196) 192.168.10.179.2161 > 222.222.222.222.1723: P =

1:157(156) ack 1 win 65535: pptp Length=3D156 CTRL-MSG Magic-Cookie=3D1a2b3=
c4d=20
CTRL=5FMSGTYPE=3DSCCRQ PROTO=5FVER(1.0) FRAME=5FCAP(A) BEARER=5FCAP(A) MAX=
=5FCHAN(0)=20
FIRM=5FREV(2600) [|pptp]
22:17:25.966502 IP (tos 0x0, ttl  62, id 55217, offset 0, flags [DF],=20
proto: TCP (6), length: 40) 222.222.222.222.1723 > 192.168.10.179.2161: ., =

cksum 0x9051 (correct), 1:1(0) ack 157 win 5840
22:17:25.971002 IP (tos 0x0, ttl  62, id 55219, offset 0, flags [DF],=20
proto: TCP (6), length: 196) 222.222.222.222.1723 > 192.168.10.179.2161: P =

1:157(156) ack 157 win 5840: pptp Length=3D156 CTRL-MSG=20
Magic-Cookie=3D1a2b3c4d CTRL=5FMSGTYPE=3DSCCRP PROTO=5FVER(1.0)=20
RESULT=5FCODE(1:Successful channel establishment) ERR=5FCODE(0:None)=20
FRAME=5FCAP() BEARER=5FCAP() MAX=5FCHAN(1) FIRM=5FREV(1) [|pptp]       =20
22:17:25.971218 IP (tos 0x0, ttl 128, id 12559, offset 0, flags [DF],=20
proto: TCP (6), length: 208) 192.168.10.179.2161 > 222.222.222.222.1723: P =

157:325(168) ack 157 win 65379: pptp Length=3D168 CTRL-MSG=20
Magic-Cookie=3D1a2b3c4d CTRL=5FMSGTYPE=3DOCRQ CALL=5FID(256) CALL=5FSER=5FN=
UM(48271)=20
MIN=5FBPS(300) MAX=5FBPS(100000000) BEARER=5FTYPE(Any) FRAME=5FTYPE(E)=20
RECV=5FWIN(64) PROC=5FDELAY(0) PHONE=5FNO=5FLEN(0) [|pptp]     22:17:26.096=
576 IP=20
(tos 0x0, ttl  62, id 55221, offset 0, flags [DF], proto: TCP (6), length: =

72) 222.222.222.222.1723 > 192.168.10.179.2161: P, cksum 0x4f2e (correct), =

157:189(32) ack 325 win 5840: pptp Length=3D32 CTRL-MSG=20
Magic-Cookie=3D1a2b3c4d CTRL=5FMSGTYPE=3DOCRP CALL=5FID(0) PEER=5FCALL=5FID=
(256)=20
RESULT=5FCODE(1:Connected) ERR=5FCODE(0:None) CAUSE=5FCODE(0)=20
CONN=5FSPEED(100000000) RECV=5FWIN(32) PROC=5FDELAY(0) PHY=5FCHAN=5FID(0)  =
         =20
=20
22:17:26.100325 IP (tos 0x0, ttl 128, id 12560, offset 0, flags [DF],=20
proto: TCP (6), length: 64) 192.168.10.179.2161 > 222.222.222.222.1723: P, =

cksum 0x4fb9 (correct), 325:349(24) ack 189 win 65347: pptp Length=3D24=20
CTRL-MSG Magic-Cookie=3D1a2b3c4d CTRL=5FMSGTYPE=3DSLI PEER=5FCALL=5FID(0)=20
SEND=5FACCM(0xffffffff) RECV=5FACCM(0xffffffff) =20
##
#### ...here, where the gre requests from 192.168.10.179 are returning=20
wrongly to 192.168.10.116, that has nothing to do with this connection
##
22:17:26.102743 IP (tos 0x0, ttl 128, id 12561, offset 0, flags [none],=20
proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,=20
Flags [key present, sequence# present], call 0, seq 0, length 37    =20
22:17:26.122530 IP (tos 0x0, ttl  62, id 11033, offset 0, flags [DF],=20
proto: GRE (47), length: 65) 222.222.222.222 > 192.168.10.116: GREv1,=20
Flags [key present, sequence# present, ack present], call 256, seq 1, ack=20
4294967295, length 45=20
 22:17:26.276681 IP (tos 0x0, ttl  62, id 55223, offset 0, flags [DF],=20
proto: TCP (6), length: 40) 222.222.222.222.1723 > 192.168.10.179.2161: ., =

cksum 0x8ed5 (correct), 189:189(0) ack 349 win 5840  =20
22:17:28.103080 IP (tos 0x0, ttl 128, id 12564, offset 0, flags [none],=20
proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,=20
Flags [key present, sequence# present], call 0, seq 1, length 37    =20
22:17:28.122612 IP (tos 0x0, ttl  62, id 11034, offset 0, flags [DF],=20
proto: GRE (47), length: 61) 222.222.222.222 > 192.168.10.116: GREv1,=20
Flags [key present, sequence# present], call 256, seq 2, length 41       =20
22:17:30.123688 IP (tos 0x0, ttl  62, id 11035, offset 0, flags [DF],=20
proto: GRE (47), length: 61) 222.222.222.222 > 192.168.10.116: GREv1,=20
Flags [key present, sequence# present], call 256, seq 3, length 41       =20
22:17:31.103318 IP (tos 0x0, ttl 128, id 12565, offset 0, flags [none],=20
proto: GRE (47), length: 57) 192.168.10.179 > 222.222.222.222: GREv1,=20
Flags [key present, sequence# present], call 0, seq 2, length 37##
##... and so on until 'disconnect'.

In my '/proc/net/ip=5Fconntrack' file, there's still the register for the=20
previously disconnected connection.

ps.: 555.555.555.555 is my gateway public address
...
unknown  47 550 src=3D192.168.10.116 dst=3D222.222.222.222 packets=3D1047=20
bytes=3D154888 src=3D222.222.222.222 dst=3D555.555.555.555 packets=3D1984=20
bytes=3D990206 mark=3D0 use=3D1
...

Any known issues about it ? Or did I missed something ? Maybe connectiong=20
tracking timeout is too long ? I don't believe or have knowledge of=20
something at the remote that could generate this kind of situation, as all =

that the remote host knows about me is my public ip address and the mac=20
address of my gateway's internal interface...

Thanks in advance.

--
Thiago Lucas
thiago@powers.com.br
POWERSolutions Inf. Ltda.


