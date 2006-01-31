From: fadhelbb@free.fr
Subject: Problem with opensta & iptables
Date: Tue, 31 Jan 2006 10:51:28 +0100
Message-ID: <1138701088.43df3320d952b@imp4-g19.free.fr>
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

We are running some tests on our internal application, our opensta (our l=
oad
testing client Ip 172.16.101.115) is on our LAN.  When our application se=
rver &
sql server are in our LAN, we do not have any problem. When we place our
application server and sql server behind our 2.6 kernel running an iptabl=
es
script (from LAN to DMZ there is no NAT), after few minutes (it depends 4=
 or 5
minutes, 10 or 15 users simultanous), we begin to loose some connexion wi=
th
this "translated" error on the opensta client : error 10060 , A connectio=
n
attempt failed because the connected party did not answer suitably beyond=
 a
certain duration or an established connection failed because the host of
connection did not answer.

The tests continue after the first error and for 50 users simulated, we l=
oose 15
users.
Everything works great when all the servers & the clients are on the LAN.=
 I try
to modufy the value of ip_conntrack_max , but nothing change.

I put informations from my logwatch from my firewall, there is something =
really
strange reported about the ip client on which we launch the opensta clien=
t. the
Ip is seen by logwatch strangely ???
Can somebody tell me where can i look to find suitable informations that =
can
help us dedug this situation ? I don't have the full table : ip_conntrack=
 in
syslog

Logged 44058 packets on interface eth2
   From 12.16.101.115 - 2 packets to tcp(80)
   From 172.FORWARD - 2 packets to tcp(80)
   From 172. - 2 packets to tcp(80)
   From 172 - 2 packets to tcp(80)
   From 172.eth1 - 2 packets to tcp(80)
   From 172.16.WARD - 2 packets to tcp(80)
   From 172.16.1.101.115 - 2 packets to tcp(80)
   From 172.16.101.11_FORWARD - 2 packets to tcp(80)
   From 172.16.101.111.115 - 2 packets to tcp(80)
   From 172.16.101.115T - 2 packets to tcp(80)
   From 172.16.101.115 - 44032 packets to tcward(80) spt(80) tx00(0) tcgp=
(0)
forward(80) xnet(80) ack(0) tcsp(80) t(0,80) tndow(0) tw01_(80) t72(80)
tcpp(80) tc(0) tc01_(80) 172(80) td(80) tcp1_(80) t1(80) t127(80) tcpw(0)
icmp(0) rward(80) tcc(80) tc4(80) tcp92(80)
tcp(K,PROTO,0,RWARD,x00,P,OUT,D,8_,8ARD,8,16,80ROTO,80,80DST,80W01_,80h2,=
80D,80IN,80ORWARD,82,139,445,804,1433,3389,8000,80192)
tcple(80) tcpasp(80) tack(0) tcp7(80) egp(80) tcp0x00(0) tcrd(80) tck(0)
turgp(0)
   From 172.16.105 - 2 packets to tcp(80)
   From 1772.16.101.115 - 2 packets to tcp(80)
   From 172172.16.101.115 - 2 packets to tcp(80)

HEre are my ip_conntrack parameters :

net.ipv4.ip_conntrack_max =3D 1048576
net.ipv4.netfilter.ip_conntrack_tcp_max_retrans =3D 3
net.ipv4.netfilter.ip_conntrack_tcp_be_liberal =3D 0
net.ipv4.netfilter.ip_conntrack_tcp_loose =3D 3
net.ipv4.netfilter.ip_conntrack_tcp_timeout_max_retrans =3D 300
net.ipv4.netfilter.ip_conntrack_log_invalid =3D 0
net.ipv4.netfilter.ip_conntrack_generic_timeout =3D 600
net.ipv4.netfilter.ip_conntrack_icmp_timeout =3D 30
net.ipv4.netfilter.ip_conntrack_udp_timeout_stream =3D 180
net.ipv4.netfilter.ip_conntrack_udp_timeout =3D 30
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close =3D 10
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait =3D 120
net.ipv4.netfilter.ip_conntrack_tcp_timeout_last_ack =3D 30
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait =3D 60
net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait =3D 120
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established =3D 432000
net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_recv =3D 60
net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_sent =3D 120
net.ipv4.netfilter.ip_conntrack_buckets =3D 6143
net.ipv4.netfilter.ip_conntrack_count =3D 499
net.ipv4.netfilter.ip_conntrack_max =3D 1048576

REgards,
Fafa

