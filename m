From: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Subject: Duplicate IPs using proxy_arp
Date: Sat, 25 Nov 2006 12:47:36 -0600
Message-ID: <20061125124736.sd0jrpm1lw8osos8@mail.col.gob.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes"; format="flowed"
To: netfilter@lists.netfilter.org

This is the scenario..
I have a Public IP segment... 148.235.x.x/28
i have my private IP segment 10.10.1.0/24

One of my public ip is used on my router. (148.235.x.97/28)

I read about proxy arp to permit part on two my public network without =20
change the config of my machines.

So, this is my linux..

eth0=3D148.235.x.103/28
eth1=3D10.10.1.1/24
eth2=3D148.235.70.103/28

The eth1 and eth2 are connected to the same switch. eth0 is connected =20
to the router.

So.. i did:
ip route del 148.235.x.x/28 dev eth0
ip route del 148.235.x.x/28 dev eth2
ip route add 148.235.x.97 dev eth0
ip route add 148.235.x.x/28 dev eth2
echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
echo 2 > /proc/sys/net/ipv4/conf/eth2/proxy_arp

The machines with the public Ips are working good, but i have problems =20
with my network 10.10.1.0/24. The machines are reporting duplicated =20
Ips..
I read about i need make filters on ARP request.. so, i use this on my =20
sysctl.conf
net.ipv4.conf.all.arp_filter=3D2
net.ipv4.conf.default.arp_filter =3D 1
net.ipv4.conf.eth0.arp_filter=3D1
net.ipv4.conf.eth1.arp_filter=3D1
net.ipv4.conf.eth2.arp_filter=3D1
net.ipv4.conf.default.log_martians =3D 1
net.ipv4.conf.all.arp_ignore=3D1
net.ipv4.conf.eth0.arp_ignore=3D1
net.ipv4.conf.eth1.arp_ignore=3D1
net.ipv4.conf.eth2.arp_ignore=3D1
net.ipv4.conf.default.arp_announce=3D2
net.ipv4.conf.all.arp_announce=3D2
net.ipv4.conf.eth0.arp_announce=3D2
net.ipv4.conf.eth1.arp_announce=3D2
net.ipv4.conf.eth2.arp_announce=3D2

I apply the parameters using sysctl -p
and when a machine connect to the network, i saw this on arp  tables:

10.10.1.188              ether   00:04:23:CB:00:CA   C                 =20
     eth2
10.10.1.188              ether   00:12:17:98:C2:5F   C                 =20
     eth1

00:04:23:CB:00:CA   its the MAC of the eth1 nic.
00:12:17:98:C2:5F   its the Real MAC of my client.


But i still having Duplicated IPs.

How can i fix that?

Thanks.



--=20
Ing. Rogelio C. Sevilla Fern=E1ndez
Direcci=F3n de Desarrollo Telem=E1tico / Secretaria de Administraci=F3n
Tel (312)3162062 / (312)3162000 ext 2360
Gobierno del Estado de Colima.

-----------------------------------------------------
  "2006, A=D1O DEL BICENTENARIO DEL NATALICIO DEL LIC.
     BENITO JUAREZ BENEMERITO DE LAS AMERICAS"
-----------------------------------------------------


