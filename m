From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: 10 Dec 2002 11:01:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039510862.1709.77.camel@rayw.knowledgefactory.co.za>
References: <014901c2a02a$0dbf59f0$0b00000a@nocpc3>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-e2vSQcojRBnVOvkO6jHQ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <014901c2a02a$0dbf59f0$0b00000a@nocpc3>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: louie miranda <lmiranda@chikka.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-e2vSQcojRBnVOvkO6jHQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-12-10 at 10:56, louie miranda wrote:
> I have an internel ftp server w/c i want to access over my linux router(g=
w)
> Its internel IP is 10.0.0.11 and port 21. My externel IP lets say
> 203.100.100.1.
> I followed the docs w/c i found at linuxdoc
> http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/forwarders.html
> I type in this iptables rule set,
>=20
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A PREROUTING -t nat -p tcp -d $EXTIP --dport 21 -j DNAT --to
> 10.0.0.11:21
>=20
> I enabled ip forwarding thru the kernel by typing this command, (this is =
the
> first thing i type then the iptables rule set)
>=20
> echo "1" > /proc/sys/net/ipv4/ip_forward
>=20
> svr:/# cat /proc/sys/net/ipv4/ip_forward
> 1
> svr:/#
>=20
> And still it does not work..
>=20
> Trying 203.100.100.1...
> telnet: Unable to connect to remote host: Connection refused
>=20
Does this IP (203.100.100.1) belong to the gw?

There are also two diferent type of ftp that work in very different
ways. This only accounts for the control connection.
Also, you don't have forward rules for the return traffic.
>=20
>=20
>=20
>=20
> --
> thanks,
> louie miranda
>=20
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-e2vSQcojRBnVOvkO6jHQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99a1Oh1fuR/Bv+ygRAgGVAKCPk5hGPqD9qzUuEVoMk4T1XC+gzwCgjU9u
fGF/+wB+YB6PZ+esNbDmlF4=
=LaMv
-----END PGP SIGNATURE-----

--=-e2vSQcojRBnVOvkO6jHQ--


