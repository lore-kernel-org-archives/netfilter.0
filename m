From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Subject: Prob with IPTABLES + REDIRECT + IPROUTE2
Date: Thu, 23 Jun 2005 21:45:57 -0300
Message-ID: <03db01c57856$16243780$8b00000a@PIVT>
Reply-To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: Netfilter list <netfilter@lists.netfilter.org>

Someone could help me???



I have two links to internet, one by ADSL (512 kbps) e other EMBRATEL ( 1024
Kpbs ).
I did "ip route" e it happen ok, but whem I put the with iptables to traffic
on 80 port redirect to 3128 port of SQUID, I can only use the ADSL link,
what is default link.
The configurations:

( ADSL 512K )       eth0
Server IP  =3D 192.168.7.2
Modem IP     =3D 192.168.7.1

( EMBRATEL 1024K )  eth1
Server IP  =3D 200.200.200.2
Router IP    =3D 200.200.200.1

( LAN 1)      eth2
Server IP  =3D 10.0.0.1
LAN   =3D 10.0.0.0/24

( LAN 2)      eth2:1
Server IP  =3D 192.168.0.1
LAN   =3D 192.168.0.0/24

#iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j
SNAT --to-soutce 192.168.7.1
#iptables -t nat -A POSTROUTING -o eth1 -s 10.0.0.20 -j SNAT --to-soutce
200.200.200.2
#ip rule add from 10.0.0.20/32 table embratel
#ip route add 200.200.200.1 dev eth1 table embratel
#ip route add default via 200.200.200.1 table embratel
#ip route add 10.0.0.20/32 via 10.0.0.1 table embratel

Here everything is workingm, but when I put the following rule....the
traffic goes to only ADSL Link that is the default gateway.

#iptables -t nat -A PREROUTING -p tcp -i eth2 --dport 80 -j
REDIRECT --to-port 3128

I am some help me.

Tks

Sebasti=E3o Ant=F4nio Campos=20


