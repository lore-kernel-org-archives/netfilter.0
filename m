From: Eric Belhomme <{gmane}+no/spam@ricospirit.net>
Subject: maybe a bug in the conntrack ?
Date: Tue, 14 Nov 2006 13:25:07 +0000 (UTC)
Message-ID: <Xns987B92ACDEE86ericbelhommefreefr@80.91.229.5>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi,

I'm not a guru on netfilter nor linux ip stack, but I have a strange=20
problem and I suspect =E0 bug :

My config : Debian Sarge with a vanilla 2.6.18.2 kernel, iptables 1.2.11

there is 3 eth intefaces on this gateway :

* eth0 192.168.1.254/24 connected to my lan
* eth1 connected to my isp (I have a static public ip address)
* eth2 10.75.1.254 connected to a DMZ

There is also an alias on eth0:1 192.168.100.0/24 for a pseudo dmz
the goal is a host from LAN _must_ be routed on the linux box to connect to=
=20
a host 192.168.100.254, even if they are on the same ethernet segment.

this is the begining of my FORWARD rules (default policy is DROP)

Chain FORWARD (policy DROP)
target     prot opt source           destination
ACCEPT     tcp  --  0.0.0.0/0        0.0.0.0/0        state ESTABLISHED
ACCEPT     udp  --  0.0.0.0/0        0.0.0.0/0        state ESTABLISHED
log_drop   tcp  --  0.0.0.0/0        0.0.0.0/0        state INVALID
log_drop   udp  --  0.0.0.0/0        0.0.0.0/0        state INVALID
ACCEPT     tcp  --  192.168.1.0/24   192.168.100.0/24 state NEW

So a host 192.168.1.125 should be able to connect to 192.168.100.1, but=20
look at a tcpdum session on the router :

# tcpdump -n -i eth0 net 192.168.100.254
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
13:46:08.297208 IP 192.168.1.125.3580 > 192.168.100.254.22: S=20
3913030203:3913030203(0) win 65535 <mss 1460,nop,nop,sackOK>
13:46:08.297289 IP 192.168.1.125.3580 > 192.168.100.254.22: S=20
3913030203:3913030203(0) win 65535 <mss 1460,nop,nop,sackOK>
13:46:08.297585 IP 192.168.1.125.3580 > 192.168.100.254.22: . ack=20
2474300259 win 65535
13:46:11.497946 IP 192.168.1.125.3580 > 192.168.100.254.22: . ack 1 win=20
65535
13:46:17.496303 IP 192.168.1.125.3580 > 192.168.100.254.22: . ack 1 win=20
65535


You can see the source host emits a SYN packet entering on eth0, then=20
reemitted on the same interface, then it emits a ACK, while the dest hosts =

didn't acknowledged the SYN by a SYN-ACK packet !

The cause is on my /var/log/message :

# tail -n 1000 /var/log/messages|grep 192.168.100.254
Nov 14 13:46:08 localhost kernel: IPT_DROP: IN=3Deth0 OUT=3Deth0 SRC=3D
192.168.1.125 DST=3D192.168.100.254 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D
51586 DF PROTO=3DTCP SPT=3D3580 DPT=3D22 WINDOW=3D65535 RES=3D0x00 ACK URGP=
=3D0
Nov 14 13:46:11 localhost kernel: IPT_DROP: IN=3Deth0 OUT=3Deth0 SRC=3D
192.168.1.125 DST=3D192.168.100.254 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D
51589 DF PROTO=3DTCP SPT=3D3580 DPT=3D22 WINDOW=3D65535 RES=3D0x00 ACK URGP=
=3D0
=20
So packets from dest host to source host are rejected by netfilter because =

conntrack macked them as INVALID !

I done a test by moving rule 5 at 1st position in FORWARD table, and insert=
=20
a new rule :
# iptables -I FORWARD 2 -i eth0 -o eth0 -s 192.168.100.0/24 -d=20
192.168.1.0/24 -j ACCEPT

In this case the SYN-ACK packet comes back, but next packet are DROPPED.
So I replaced the 1st rule by this one :
# iptables -R FORWARD 1 -i eth0 -o eth0 -s 192.168.1.0/24 -d=20
192.168.100.0/24 -j ACCEPT

and now the connection goes ok... while it is macked as and INVALID=20
connection !

So what are you thinking about that ?

Regards,

--=20
Rico



