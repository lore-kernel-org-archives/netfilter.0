From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: rerouting after postrouting in NAT table
Date: Fri, 17 Oct 2003 14:40:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066394458.12615.27.camel@raylinux.internal>
References: <3F8F9BA5.1090502@cc.iitb.ac.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1KTuBQNTb9B6eif8ngS/"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8F9BA5.1090502@cc.iitb.ac.in>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-1KTuBQNTb9B6eif8ngS/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-17 at 09:35, Madhuri Patwardhan wrote:
> Hi,
>=20
> I would like to choose the appropriate routing table using the packet=20
> source address which is altered by the NAT table post-routing chain.
> Is it possible? I have given the detailed scenerio below.
>=20
> This is what I have:
>=20
> I have a linux box with connections to two WAN links.
> We are doing load balancing using Ultra monkey software. The same linux=20
> box also works as a Linux director and directs the packets to real=20
> servers. The real servers have private IP's. It is similar to the=20
> example given on the ultramonkey site:=20
> http://www.ultramonkey.org/2.0.1/topologies/lb-eg.html
>=20
> On the Linux Director box (which has two WAN links), masquerading for=20
> the real server's private IP's happens with the following command.
>=20
> /sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.6.0/24
> (as given in the example on ultramonkey site, which is mentioned above)
>=20
> So, in the POSTROUTING chain the source address gets changed to one of=20
> the WAN links public IP.
>=20
> I would like to route the reply packets on the same WAN link on which=20
> the query came.
>=20
> For example:
>=20
> I have two WAN links whose IP ranges are 203.199.51.0/24(WAN link X) and=20
> 203.197.74.128/25 (WAN link Y).
>=20
> A packet comes on WAN link X destined to a address 203.199.51.159, which=20
> is a virtual IP of the Linux Director on the Linux box.
>=20
> This packet is handed over to the real server which generates reply and=20
> sends the packet back to Linux Director. The Linux Director changes the=20
> source IP to 203.199.51.159 as per the iptables masqurade rule mentioned=20
> above in the NAT tables post-routing chain.
>=20
> I have created two routing tables one with a default route of WAN link X=20
> and the other with a default route of WAN link Y. Depending on the=20
> source address, in this case 203.199.51.159 I would like it to choose=20
> the appropriate routing table and hence WAN link X.
>=20
> Is this possible? What I am wondering is since it is in the post routing=20
> chain that the source address is changed, is it possible that rerouting=20
> will happen again and the appropriate default route will be chosen after=20
> postrouting chain is traversed?
>=20
>=20
> If any part needs better explaination please let me know. I would really=20
> appreciate any pointers/clues.
>=20
How are you doing the 'redirector' part? Are you redirecting the
incoming requests using iptables?

It sounds like what you're after is DNAT with connection tracking.
(unless I missed the bus completely)
>=20
> Thanks in advance.
>=20
> Madhuri
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-1KTuBQNTb9B6eif8ngS/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/j+Nah1fuR/Bv+ygRAns/AKCEDvXUZcJP21l6plv5j1cQDobYNQCgtBR/
kENGG7BnrNTyUIRMqoVzohk=
=DHfD
-----END PGP SIGNATURE-----

--=-1KTuBQNTb9B6eif8ngS/--


