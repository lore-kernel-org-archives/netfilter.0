From: "Jan =?ISO-8859-2?Q?Moli=E8?=" <mig@1984.cz>
Subject: GRE tunnel freeze after adding "bad" route (2.4.32 kernel)
Date: 7 Jun 2006 16:06:54 +0200
Message-ID: <kimC3Lf7.1149689214.2983030.mig@1984.cz>
Reply-To: Jan =?ISO-8859-2?Q?Moli=E8?= <mig@1984.cz>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello,



I have created a GRE tunnel between two hosts A and B with endpoint

addresses 192.168.0.1/24 and 192.168.0.2/24.



The tunnel works fine (there are automatically created routes

192.168.0.0/24 on each host to the tunnel).



I added second route to the tunnel with address 10.0.0.0/8. Works.

But when I add third route with address 81.0.238.160/27, the tunnel

freezes after one ping reply. Never mind if I deleted the second route,

the problem is caused by the address 81.0.238.160/27 (when I remove the

route, tunnel starts working again).



I've tried to replace the 192.168.0.0/24 network route by host route but

the problem remains.



The machine is

Linux host_a 2.4.32-ow1-sk831-vp2 #5 SMP Tue Mar 28 10:31:34 CEST 2006

i686 unknown unknown GNU/Linux



Is it a bug?

Thank you for reply!



Jan Molic



----------



HOST A

$ ip tunnel add host_b mode gre remote  5.6.7.8 local 1.2.3.4

$ ip link set host_b up

$ ip addr add 192.168.0.2/24  dev host_b



HOST B

$ ip tunnel add host_a mode gre remote 1.2.3.4 local 5.6.7.8

$ ip link set host_a up

$ ip addr add 192.168.0.1/24 dev host_a



$ ip route

x.x.x.x/x dev eth0  proto kernel  scope link  src 5.6.7.8

192.168.0.0/24 dev host_a  scope link

127.0.0.0/8 dev lo  scope link

default via y.y.y.y dev eth0  metric 1



$ ping 192.168.0.2

works



$ ip route add 10.0.0.0/8 dev host_a



$ ping 192.168.0.2

still works



$ ip route add 81.0.238.160/27 dev host_a



$ ping 192.168.0.2

stops working after one reply=20

tcpdump on host_b shows the one ping:

15:54:29.772001 IP 192.168.0.1 > 192.168.0.2: ICMP echo request, id

62556, seq 1, length 64

15:54:29.772015 IP 192.168.0.2 > 192.168.0.1: ICMP echo reply, id 62556,

seq 1, length 64



$ ip route del 10.0.0.0/8 dev host_a



$ ping 192.168.0.2

still no reply



$ ip route del 81.0.238.160/27 dev host_a



$ ping 192.168.0.2

works again

