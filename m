From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 16:15:30 +0200
Message-ID: <45219fb00507040715442f52cf@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2882_16426650.1120486530469"
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
To: netfilter@lists.netfilter.org

------=_Part_2882_16426650.1120486530469
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi!

I have many problems getting this thing to work. There's a host with
two network interfaces, where there are two routers to Internet in two
separated networks. The host uses multihop routing for deciding to
which router send the packets... but the routing decision is wrong
made. Some packets with source address of one NIC, go to other
network.

I have a host with three NICs in it:
eth0 - LAN, 192.168.0.0/20
eth1 192.168.16.1 - subnetwork 192.168.16.0/28, with a router
(192.168.16.2) to internet
eth2 192.168.17.1 - subnetwork 192.168.17.0/28, with another router
(192.168.17.2) to internet

The routing rules are:
0:      from all lookup local=20
50:     from all lookup main=20
201:    from 192.168.17.0/28 iif eth2 lookup 201=20
202:    from 192.168.16.0/28 iif eth1 lookup 202=20
222:    from all lookup 222=20
32766:  from all lookup main=20
32767:  from all lookup default=20

The table 'main':
192.168.17.0/28 dev eth2  proto kernel  scope link  src 192.168.17.1=20
192.168.16.0/28 dev eth1  proto kernel  scope link  src 192.168.16.1=20
192.168.0.0/20 dev eth0  proto kernel  scope link  src 192.168.1.2=20

The table '201':
default via 192.168.17.2 dev eth2  proto static  src 192.168.17.1=20
prohibit default  proto static  metric 1=20

The table '202':
default via 192.168.16.2 dev eth1  proto static  src 192.168.16.1=20
prohibit default  proto static  metric 1=20

The table '222', where there is the multihop gateway specification:

default equalize=20
        nexthop via 192.168.16.2  dev eth1 weight 1
        nexthop via 192.168.17.2  dev eth2 weight 1

I've added the following packet LOG lines into 'mangle' table, for
knowing when the "WRONG INTERFACE" decision is being made:
Chain POSTROUTING (policy ACCEPT 329K packets, 93M bytes)
 pkts bytes target     prot opt in     out     source             =20
destination
    2    80 LOG        all  --  any    eth1    192.168.17.1       =20
anywhere            LOG level warning ip-options prefix `WRONG IFACE:
'
    0     0 LOG        all  --  any    eth2    192.168.16.1       =20
anywhere            LOG level warning ip-options prefix `WRONG IFACE:
'

(Don't look at counters; right now, for getting good internet access,
I'm not using multihop)

So, often appears in the kernel log, specially with 'ftp' and 'ssh'
connections (and rarely with www connections):
Jul  4 15:50:14 thecrow WRONG IFACE: IN=3D OUT=3Deth2 SRC=3D192.168.16.1
DST=3D216.165.191.52 LE
N=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D9582 DF PROTO=3DTCP SPT=3D56528=
 DPT=3D6667
WINDOW=3D18824 RES=3D
0x00 ACK PSH URGP=3D0=20
Jul  4 16:01:29 thecrow WRONG IFACE: IN=3D OUT=3Deth1 SRC=3D192.168.17.1
DST=3D130.206.1.5 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D66 DF PROTO=
=3DTCP
SPT=3D33820 DPT=3D21 WINDOW=3D0 RES=3D0x00 RST URGP=3D0

Even though, when I use 'tcpdump' for catching the wrong packets (that
is: tcpdump -i eth1 host 192.168.17.1  _or_ tcpdump -i eth2 host
192.168.16.1 ) results that _A LOT MORE PACKETS_ are BADLY ROUTED,
than sent to the LOG target.

My conclusion: iptables 'matching' doesn't work; also does the route
decision part.

I absolutely don't know what more to do... I'm running iptables
v1.2.11, and kernel 2.6.11-gentoo-r11. Exactly same happened with
kernel 2.4.28-gentoo. :(

I even attach the scripts I use for doing the routing and the NAT for the L=
AN.

Please, help!

------=_Part_2882_16426650.1120486530469
Content-Type: application/octet-stream; name="masquerading.multi-eth"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="masquerading.multi-eth"

IyEvYmluL2Jhc2gKCkdXMT0xOTIuMTY4LjE2LjIKR1cyPTE5Mi4xNjguMTcuMgpORTE9MTkyLjE2
OC4xNi4wLzI4Ck5FMj0xOTIuMTY4LjE3LjAvMjgKTkxPQ0FMPTE5Mi4xNjguMC4wLzIwCklQRTE9
MTkyLjE2OC4xNi4xCklQRTI9MTkyLjE2OC4xNy4xCgpJUFRBQkxFUz0iL3NiaW4vaXB0YWJsZXMi
CgokSVBUQUJMRVMgLXQgbmF0IC1GIFBSRVJPVVRJTkcKJElQVEFCTEVTIC10IG5hdCAtRiBQT1NU
Uk9VVElORwokSVBUQUJMRVMgLXQgbmF0IC1GIE9VVFBVVAokSVBUQUJMRVMgLXQgZmlsdGVyIC1G
IElOUFVUCiRJUFRBQkxFUyAtdCBmaWx0ZXIgLUYgRk9SV0FSRAokSVBUQUJMRVMgLXQgZmlsdGVy
IC1GIE9VVFBVVAokSVBUQUJMRVMgLXQgZmlsdGVyIC1GIGtlZXBfc3RhdGUgPiYvZGV2L251bGwK
JElQVEFCTEVTIC10IGZpbHRlciAtWCBrZWVwX3N0YXRlID4mL2Rldi9udWxsCiRJUFRBQkxFUyAt
dCBuYXQgLUYga2VlcF9zdGF0ZSA+Ji9kZXYvbnVsbAokSVBUQUJMRVMgLXQgbmF0IC1YIGtlZXBf
c3RhdGUgPiYvZGV2L251bGwKCgokSVBUQUJMRVMgLXQgZmlsdGVyIC1OIGtlZXBfc3RhdGUKJElQ
VEFCTEVTIC10IGZpbHRlciAtQSBrZWVwX3N0YXRlIC1tIHN0YXRlIC0tc3RhdGUgUkVMQVRFRCxF
U1RBQkxJU0hFRCAtaiBBQ0NFUFQKJElQVEFCTEVTIC10IGZpbHRlciAtQSBrZWVwX3N0YXRlIC1q
IFJFVFVSTgoKJElQVEFCTEVTIC10IG5hdCAtTiBrZWVwX3N0YXRlCiRJUFRBQkxFUyAtdCBuYXQg
LUEga2VlcF9zdGF0ZSAtbSBzdGF0ZSAtLXN0YXRlIFJFTEFURUQsRVNUQUJMSVNIRUQgLWogQUND
RVBUCiRJUFRBQkxFUyAtdCBuYXQgLUEga2VlcF9zdGF0ZSAtaiBSRVRVUk4KCiRJUFRBQkxFUyAt
dCBuYXQgLUEgUFJFUk9VVElORyAtaiBrZWVwX3N0YXRlCiRJUFRBQkxFUyAtdCBuYXQgLUEgUE9T
VFJPVVRJTkcgLWoga2VlcF9zdGF0ZQokSVBUQUJMRVMgLXQgbmF0IC1BIE9VVFBVVCAtaiBrZWVw
X3N0YXRlCiRJUFRBQkxFUyAtdCBmaWx0ZXIgLUEgSU5QVVQgLWoga2VlcF9zdGF0ZQokSVBUQUJM
RVMgLXQgZmlsdGVyIC1BIEZPUldBUkQgLWoga2VlcF9zdGF0ZQokSVBUQUJMRVMgLXQgZmlsdGVy
IC1BIE9VVFBVVCAtaiBrZWVwX3N0YXRlCgokSVBUQUJMRVMgLXQgbmF0IC1BIFBPU1RST1VUSU5H
IC1vIGV0aDEgLXMgJE5MT0NBTCAtaiBTTkFUIC0tdG8gJElQRTEKJElQVEFCTEVTIC10IG5hdCAt
QSBQT1NUUk9VVElORyAtbyBldGgyIC1zICROTE9DQUwgLWogU05BVCAtLXRvICRJUEUyCiMkSVBU
QUJMRVMgLXQgbmF0IC1BIFBPU1RST1VUSU5HIC1vIGV0aDEgLWogTUFTUVVFUkFERQojJElQVEFC
TEVTIC10IG5hdCAtQSBQT1NUUk9VVElORyAtbyBldGgyIC1qIE1BU1FVRVJBREUKCiMgQWNj6XMg
d2ViIGEgZW4gZmlsZW1vbiBwZXIgdGhlY3JvdzoyMDAwCiRJUFRBQkxFUyAtdCBuYXQgLUEgUFJF
Uk9VVElORyAtLXByb3RvY29sIHRjcCBcCgktLWRlc3RpbmF0aW9uLXBvcnQgMjAwMCAtcyAxOTIu
MTY4LjAuMC8yMCAtaiBETkFUXAoJLS10by1kZXN0aW5hdGlvbiAxOTIuMTY4LjE3LjI6ODAKCiMg
QWNj6XMgdGVsbmV0IGEgZW4gZmlsZW1vbiBwZXIgdGhlY3JvdzoyMDAxCiRJUFRBQkxFUyAtdCBu
YXQgLUEgUFJFUk9VVElORyAtLXByb3RvY29sIHRjcCBcCgktLWRlc3RpbmF0aW9uLXBvcnQgMjAw
MSAtcyAxOTIuMTY4LjAuMC8yMCAtaiBETkFUXAoJLS10by1kZXN0aW5hdGlvbiAxOTIuMTY4LjE3
LjI6MjMKCiMgQWNj6XMgdGVsbmV0IGEgZW4gbW9ydGFkZWxvIHBlciB0aGVjcm93OjIwMDIKJElQ
VEFCTEVTIC10IG5hdCAtQSBQUkVST1VUSU5HIC0tcHJvdG9jb2wgdGNwIFwKCS0tZGVzdGluYXRp
b24tcG9ydCAyMDAyIC1zIDE5Mi4xNjguMC4wLzIwIC1qIEROQVRcCgktLXRvLWRlc3RpbmF0aW9u
IDE5Mi4xNjguMTYuMjoyMwoKIyBBY2PpcyBhIGwnQVM0MDAgcGVyIHRlbG5ldCwgZGVzIGQnb3Jk
aW5hZG9ycyBjb25jcmV0cwokSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLS1wcm90b2Nv
bCB0Y3AgXAoJLS1kZXN0aW5hdGlvbi1wb3J0IDIzIC1zIDgwLjMyLjI5LjIzNCBcCgktZCA4MC4y
NC4yNi4yNSAtaiBETkFUIC0tdG8tZGVzdGluYXRpb24gMTkyLjE2OC4xLjc6MjMKCiMgQWNj6XMg
YWwgRE5TIHNlY3VuZGFyaSAocGVyIGZpbGVtb24sIGEgQW51YmlzKQokSVBUQUJMRVMgLXQgbmF0
IC1BIFBSRVJPVVRJTkcgLS1wcm90b2NvbCB1ZHAgXAoJLS1kZXN0aW5hdGlvbi1wb3J0IDUzIC1z
IDAuMC4wLjAvMCAtZCAxOTIuMTY4LjE3LjEgXAoJLWogRE5BVCAtLXRvLWRlc3RpbmF0aW9uIDE5
Mi4xNjguMS40OjUzCgojIEFjY+lzIGFsIEROUyBwcmltYXJpIChwZXIgbW9ydGFkZWxvLCBhIEFu
dWJpcykKJElQVEFCTEVTIC10IG5hdCAtQSBQUkVST1VUSU5HIC0tcHJvdG9jb2wgdWRwIFwKCS0t
ZGVzdGluYXRpb24tcG9ydCA1MyAtcyAwLjAuMC4wLzAgLWQgMTkyLjE2OC4xNi4xIFwKCS1qIERO
QVQgLS10by1kZXN0aW5hdGlvbiAxOTIuMTY4LjEuMzo1MwoKIyBBY2PpcyBhbCBTTVRQIChwZXIg
bW9ydGFkZWxvLCBhIFNwYXduKQokSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLS1wcm90
b2NvbCB0Y3AgXAoJLS1kZXN0aW5hdGlvbi1wb3J0IDI1IC1zIDAuMC4wLjAvMCAtZCAxOTIuMTY4
LjE2LjEgXAoJLWogRE5BVCAtLXRvLWRlc3RpbmF0aW9uIDE5Mi4xNjguMS4xOjI1CgojIEFjY+lz
IGFsIFBPUDMgKHBlciBtb3J0YWRlbG8sIGEgU3Bhd24pCiRJUFRBQkxFUyAtdCBuYXQgLUEgUFJF
Uk9VVElORyAtLXByb3RvY29sIHRjcCBcCgktLWRlc3RpbmF0aW9uLXBvcnQgMTEwIC1zIDAuMC4w
LjAvMCAtZCAxOTIuMTY4LjE2LjEgXAoJLWogRE5BVCAtLXRvLWRlc3RpbmF0aW9uIDE5Mi4xNjgu
MS4xOjExMAoKIyBBY2PpcyBhbCBXRUIgKHBlciBtb3J0YWRlbG8sIGEgU3Bhd24pCiRJUFRBQkxF
UyAtdCBuYXQgLUEgUFJFUk9VVElORyAtLXByb3RvY29sIHRjcCBcCgktLWRlc3RpbmF0aW9uLXBv
cnQgODAgLXMgMC4wLjAuMC8wIC1kIDE5Mi4xNjguMTYuMSBcCgktaiBETkFUIC0tdG8tZGVzdGlu
YXRpb24gMTkyLjE2OC4xLjE6ODAKCiMgQWNj6XMgYWwgV0VCIEhUVFBTIChwZXIgbW9ydGFkZWxv
LCBhIFNwYXduKQokSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLS1wcm90b2NvbCB0Y3Ag
XAoJLS1kZXN0aW5hdGlvbi1wb3J0IDQ0MyAtcyAwLjAuMC4wLzAgLWQgMTkyLjE2OC4xNi4xIFwK
CS1qIEROQVQgLS10by1kZXN0aW5hdGlvbiAxOTIuMTY4LjEuMTo0NDMKCiMgQWNj6XMgYWwgU1NI
IChwZXIgbW9ydGFkZWxvLCBhIGRucykKJElQVEFCTEVTIC10IG5hdCAtQSBQUkVST1VUSU5HIC0t
cHJvdG9jb2wgdGNwIFwKCS0tZGVzdGluYXRpb24tcG9ydCAyMiAtcyAwLjAuMC4wLzAgLWQgMTky
LjE2OC4xNi4xIFwKCS1qIEROQVQgLS10by1kZXN0aW5hdGlvbiAxOTIuMTY4LjEuMzoyMgoKIyBB
Y2PpcyBhbCBTU0ggKHBlciBtb3J0YWRlbG8sIGEgZG5zKQokSVBUQUJMRVMgLXQgbmF0IC1BIFBS
RVJPVVRJTkcgLS1wcm90b2NvbCB0Y3AgXAoJLS1kZXN0aW5hdGlvbi1wb3J0IDUwIC1zIDAuMC4w
LjAvMCAtZCAxOTIuMTY4LjE2LjEgXAoJLWogRE5BVCAtLXRvLWRlc3RpbmF0aW9uIDE5Mi4xNjgu
MS4zOjIyCgojIExPRyBkZSBwYXF1ZXRzIGVycm9uaXMKaXB0YWJsZXMgLXQgbWFuZ2xlIC1GIFBP
U1RST1VUSU5HCmlwdGFibGVzIC10IG1hbmdsZSAtQSBQT1NUUk9VVElORyAtaiBMT0cgLS1sb2ct
cHJlZml4ICJXUk9ORyBJRkFDRTogIiAtLWxvZy1pcC1vcHRpb25zIC1zIDE5Mi4xNjguMTcuMSAt
byBldGgxCmlwdGFibGVzIC10IG1hbmdsZSAtQSBQT1NUUk9VVElORyAtaiBMT0cgLS1sb2ctcHJl
Zml4ICJXUk9ORyBJRkFDRTogIiAtLWxvZy1pcC1vcHRpb25zIC1zIDE5Mi4xNjguMTYuMSAtbyBl
dGgyCg==
------=_Part_2882_16426650.1120486530469
Content-Type: application/octet-stream; name="routing.multi-eth"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="routing.multi-eth"

IyEvYmluL2Jhc2gKCmVjaG8gMSA+L3Byb2Mvc3lzL25ldC9pcHY0L2NvbmYvYWxsL2ZvcndhcmRp
bmcKCi9zYmluL21vZHByb2JlIGlwX2Nvbm50cmFja19mdHAKL3NiaW4vbW9kcHJvYmUgaXBfbmF0
X2Z0cAoKSVA9Ii9zYmluL2lwIgoKaXAgcm91dGUgZmx1c2ggYWxsCiRJUCBsaW5rIHNldCBldGgw
IHVwCiRJUCBhZGRyIGZsdXNoIGRldiBldGgwCiRJUCBhZGRyIGFkZCAxOTIuMTY4LjEuMi8yMCBi
cmQgKyBkZXYgZXRoMAokSVAgYWRkciBmbHVzaCBkZXYgZXRoMQokSVAgYWRkciBhZGQgMTkyLjE2
OC4xNi4xLzI4IGJyZCArIGRldiBldGgxCiRJUCBhZGRyIGZsdXNoIGRldiBldGgyCiRJUCBhZGRy
IGFkZCAxOTIuMTY4LjE3LjEvMjggYnJkICsgZGV2IGV0aDIKCmlmY29uZmlnIGV0aDAgdXAKaWZj
b25maWcgZXRoMSB1cAppZmNvbmZpZyBldGgyIHVwCiRJUCBydWxlIGRlbCBwcmlvIDUwID4mL2Rl
di9udWxsCiRJUCBydWxlIGFkZCBwcmlvIDUwIHRhYmxlIG1haW4KJElQIHJvdXRlIGRlbCBkZWZh
dWx0IHRhYmxlIG1haW4gPiYvZGV2L251bGwKCiMgYSBtb3J0YWRlbG8gaSBmaWxlbfNuCiNHVzE9
MTkyLjE2OC4xLjEwCiNHVzI9MTkyLjE2OC4xLjEzCkdXMT0xOTIuMTY4LjE2LjIKR1cyPTE5Mi4x
NjguMTcuMgpORTE9MTkyLjE2OC4xNi4wLzI4Ck5FMj0xOTIuMTY4LjE3LjAvMjgKSVBFMT0xOTIu
MTY4LjE2LjEKSVBFMj0xOTIuMTY4LjE3LjEKCiMgcHJvdG8gc3RhdGljCiMkSVAgcm91dGUgZGVs
IHRhYmxlIDIyMiA+Ji9kZXYvbnVsbAojJElQIHJvdXRlIGFkZCBkZWZhdWx0IHRhYmxlIDIyMiBl
cXVhbGl6ZVwKIwluZXh0aG9wIHZpYSAkR1cxIGRldiBldGgxIHdlaWdodCAxIG5leHRob3Agdmlh
ICRHVzIgZGV2IGV0aDIgd2VpZ2h0IDEKJElQIHJvdXRlIGFkZCBkZWZhdWx0IHRhYmxlIDIyMiB2
aWEgJEdXMSBkZXYgZXRoMQoKJElQIHJ1bGUgZGVsIHByaW8gMjIyID4mL2Rldi9udWxsCiRJUCBy
dWxlIGFkZCBwcmlvIDIyMiB0YWJsZSAyMjIKCiRJUCBydWxlIGRlbCBwcmlvIDIwMiBmcm9tICRO
RTEgPiYvZGV2L251bGwKJElQIHJvdXRlIGRlbCB0YWJsZSAyMDIgPiYvZGV2L251bGwKJElQIHJv
dXRlIGFkZCBkZWZhdWx0IHZpYSAkR1cxIGRldiBldGgxIHNyYyAkSVBFMSBwcm90byBzdGF0aWMg
dGFibGUgMjAyCiRJUCByb3V0ZSBhcHBlbmQgcHJvaGliaXQgZGVmYXVsdCB0YWJsZSAyMDIgbWV0
cmljIDEgcHJvdG8gc3RhdGljCiRJUCBydWxlIGFkZCBwcmlvIDIwMiBmcm9tICRORTEgZGV2IGV0
aDEgdGFibGUgMjAyCgokSVAgcnVsZSBkZWwgcHJpbyAyMDEgZnJvbSAkTkUyID4mL2Rldi9udWxs
CiRJUCByb3V0ZSBkZWwgdGFibGUgMjAxID4mL2Rldi9udWxsCiRJUCByb3V0ZSBhZGQgZGVmYXVs
dCB2aWEgJEdXMiBkZXYgZXRoMiBzcmMgJElQRTIgcHJvdG8gc3RhdGljIHRhYmxlIDIwMQokSVAg
cm91dGUgYXBwZW5kIHByb2hpYml0IGRlZmF1bHQgdGFibGUgMjAxIG1ldHJpYyAxIHByb3RvIHN0
YXRpYwokSVAgcnVsZSBhZGQgcHJpbyAyMDEgZnJvbSAkTkUyIGRldiBldGgyIHRhYmxlIDIwMQo=

------=_Part_2882_16426650.1120486530469--

