From: Alexander Samad <alex@samad.com.au>
Subject: Re: Two link adsl on the same server
Date: Wed, 11 May 2005 09:58:28 +1000
Message-ID: <20050510235828.GJ15049@samad.com.au>
References: <00ee01c5557d$e1979d90$8b00000a@PIVT>
	<4280EA95.8020306@phreaker.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j/HO4hzKTNbM1mOX"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4280EA95.8020306@phreaker.net>
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


--j/HO4hzKTNbM1mOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2005 at 01:08:37AM +0800, ro0ot wrote:
> Below is only examples: -
>=20
> First, include this in /etc/iproute2/rt_tables as below: -
>=20
> 201 http.out
> 202 ftp.out
> 203 smtp.out
> 204 pop3.out
>=20
> Next, include this in a preferred executable file such as=20
> /usr/local/bin/rc.routing as below: -
>=20
> #!/bin/sh
>=20
> # first ISP
> ip route add 1.1.1.68/30 dev eth2 src 1.1.1.70 table 1
> ip route add default via 1.1.1.69 table 1
>=20
> # second ISP
> ip route add 2.2.2.116/30 dev eth4 src 2.2.2.118 table 2
> ip route add default via 2.2.2.117 table 2

you also need to add the local routes in these tables as well, otherwise
they will not be able to talk inside !


>=20
> ip rule add from 1.1.1.70 table 1
> ip rule add from 2.2.2.118 table 2
>=20
> ip route add 172.17.0.0/16 dev eth1 table 1
> ip route add 2.2.2.116/30 dev eth4 table 1
>=20
> ip route add 172.17.0.0/16 dev eth1 table 2
> ip route add 1.1.1.68/30 dev eth2 table 2
>=20
> ip route add default scope global nexthop via 1.1.1.70 dev eth2 nexthop=
=20
> via 2.2.2.118 dev eth4
>=20
> ip rule add fwmark 1 table http.out
> ip rule add fwmark 2 table ftp.out
> ip rule add fwmark 3 table smtp.out
> ip rule add fwmark 4 table pop3.out
>=20
> ip route add default via 1.1.1.69 dev eth2 table http.out
> ip route add default via 1.1.1.69 dev eth2 table ftp.out
>=20
> ip route add default via 2.2.2.117 dev eth4 table smtp.out
> ip route add default via 2.2.2.117 dev eth4 table pop3.out
>=20
> Next, include this in a preferred executable file such as=20
> /usr/local/bin/rc.firewall as below: -
>=20
> #!bin/sh
>=20
> iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 1.1.1.70
> iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 2.2.2.118
>=20
> iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 80 -j MARK=20
> --set-mark 1
> iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 21 -j MARK=20
> --set-mark 2
> iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 25 -j MARK=20
> --set-mark 3
> iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 110 -j MARK=20
> --set-mark 4
>=20
> Hope it helps...
>=20
> Regards,
> ro0ot
>=20
>=20
> Sebasti?o Ant?nio Campos (GWA) wrote:
>=20
> >Hi!
> >
> >We have two ADSL link on the same server and we'd like to use load balan=
ce.
> >
> >I tried to used, but I didn't have success.
> >
> >I use on eth1 172.17.1.6 mask 255.255.0.0 my local network;
> >on eth2 my first ADSL 200.168.1.19 mask 255.255.255.192 default gw=20
> >200.204.140.1
> >on eth4 my first ADSL 200.204.140.10 mask 255.255.255.192 default gw=20
> >200.179.1.1
> >
> >This IP are static.
> >
> >On my local network I have two servers (E-mail server and one web server=
)=20
> >and I need to PREROUTING with DNAT.
> >
> >And we would like to separate the port 80 and 21 using one link on eth0=
=20
> >and the port 25 and 110 other link eth4 and other ports eth0 or eth4 lin=
k.
> >
> >My files:
> >
> >My ifcfg-ethx files:
> >
> >#NIC SIS on board, usando link1 ADSL
> >DEVICE=3Deth0
> >ONBOOT=3Dyes
> >#BOOTPROTO=3Ddhcp
> >BOOTPROTO=3Dstatic
> >BROADCAST=3D200.168.1.63
> >IPADDR=3D200.168.1.19
> >NETMASK=3D255.255.255.192
> >NETWORK=3D200.168.1.0
> >#GATEWAY=3D200.168.1.1
> >___________________________________________________________
> >#Placa Realtek, Uso Local, slot 1
> >DEVICE=3Deth1
> >ONBOOT=3Dyes
> >BOOTPROTO=3Dstatic
> >IPADDR=3D172.17.1.6
> >BROADCAST=3D172.17.255.255
> >NETMASK=3D255.255.0.0
> >NETWORK=3D172.17.0.0
> >________________________________________________________
> >#NIC Realtek, link 2 ADSL
> >DEVICE=3Deth4
> >ONBOOT=3Dyes
> >BOOTPROTO=3Dstatic
> >BROADCAST=3D200.204.140.63
> >IPADDR=3D200.204.140.10
> >NETMASK=3D255.255.255.192
> >NETWORK=3D200.204.140.0
> >
> >_________________________________________________
> >file /etc/sysconfig/network
> >
> >NETWORKING=3Dyes
> >HOSTNAME=3Drbz-firewall
> >#GATEWAY=3D200.168.1.1
> >GATEWAY=3D200.204.140.1
> >___________________________________________________
> >file /etc/iproute2/rt_tables
> >
> >#
> ># reserved values
> >#
> >#255    local
> >#254    main
> >#253    default
> >#0      unspec
> >
> >#
> ># local
> >#
> >#1      inr.ruhep
> >
> >
> >Could some one help me??
> >
> >Thanks
> >
> >
> >Sebasti?o Ant?nio Campos
> >Infojoi Computadores Ltda
> >89.224-000 Joinville -SC - R. Iriri?, 3587
> >Cml. (47) 437-0796 - Cel. (47) 9927-5349
> >tiao@infojoi.com.br
> >http://www.lupusnet.com.br
> >
> >
> >=20
> >
>=20
>=20
>=20
>=20
>=20

--j/HO4hzKTNbM1mOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCgUqkkZz88chpJ2MRAtZrAJ92Weg8dGE/A5SyrRUlvK9dlxyM5QCfcvxW
F9W59m2flNrmP9aHbBG6khY=
=smPx
-----END PGP SIGNATURE-----

--j/HO4hzKTNbM1mOX--

