From: Alain RICHARD <alain.richard@equation.fr>
Subject: kernel 2.6 ipsec and DNAT
Date: Fri, 3 Sep 2004 19:01:41 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <ED78BD9E-FDCA-11D8-8A26-000A95BDFB08@equation.fr>
Mime-Version: 1.0 (Apple Message framework v619)
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

we are using iptables and ipsec since several years now (starting with=20=

freeswan 1.0) without too much problems. We have now upgraded to the=20
2.6 kernel (under Fedora 2) and Openswan 2.x.

Our setup works perfectly, with several dozens of tunnels up and=20
running. We have avoided the lake of ipsec0 interface by marking=20
packets (in fact this is great solution that enable us to separate=20
completely the firewall settings from the vpn tunnels).

The problem I am encountering now is that it seems that DNAT is not=20
working when the d-natted session is from a tunneled site. My settup is=20=

:


192.168.1.0/24 local intranet
192.168.2.0/24 distant intranet

the ipsec tunnel is setup from distant to local in order to get all the=20=

traffic passing into the local firewall (192.168.2.0/24 -> 0.0.0.0/0).

This works perfectly and all the traffic either intranet or internet=20
pass thru the local firewall.

The problem now is that I want now to redirect the web traffic to squid=20=

using a classical transparent proxying :

iptables -t nat -A PREROUTING -p tcp --dport 80 -m mark --mark=20
0x50010000/0xFFFF0000 -j DNAT --to 192.168.1.99:3128

for an unknown reason, this is not working. On the 192.168.1.99 host, I=20=

see the connexion arriving but not correctly coming up :

tethereal host 192.168.2.18
   0.256680 192.168.2.18 -> 192.168.1.99 TCP 1166 > http [SYN] Seq=3D0=20=

Ack=3D0 Win=3D64512 Len=3D0 MSS=3D1260
   0.256718 192.168.1.99 -> 192.168.2.18 TCP http > 1166 [SYN, ACK]=20
Seq=3D0 Ack=3D1 Win=3D5840 Len=3D0 MSS=3D1460
   0.442346 192.168.2.18 -> 192.168.1.99 TCP 1024 > http [RST] Seq=3D0=20=

Ack=3D0 Win=3D0 Len=3D0

the last line RST seams not to be issued by the 192.168.2.18 host, but=20=

probably by the firewall/VPN gateway. I have also tried to set=20
/proc/sys/net/ipv4/conf/*/rp_filter to 0, but the problem is the same.

the same setup was correctly working under a kernel 2.4, so I think the=20=

problem is about natting the vpn connexion.

Is there any problem like this under the current 2.6.8 kernel ? Do you=20=

have any idea to try to bypass the problem ?

-------------------------------------------------------
Alain RICHARD <mailto:alain.richard@equation.fr>
EQUATION SA <http://www.equation.fr/>
Tel : +33 477 79 48 00	 Fax : +33 477 79 48 01
Applications client/serveur, ing=E9nierie r=E9seau et Linux=


