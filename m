From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Problem Found! - Firewall Rule
Date: 06 Jun 2003 08:52:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054882347.13616.53.camel@raylinux.internal>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019266@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VK1+HYtcCLq6dmBa7I8x"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A019266@wardrive.citadelcomputer.com.au>
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


--=-VK1+HYtcCLq6dmBa7I8x
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-06-06 at 02:56, George Vieira wrote:
> Your local IP is the same as the remote networks IP.. so how is the
> local machine to know that 192.168.0.55 or 66 or 32 is on the VPN!?
> =20
> The only way I know is to proxyarp the ppp device that the vpn is
> running on.. I'm assuming it's PPTP so you could try this command when
> the VPN comes up :
> echo 1 > /proc/sys/net/ipv4/conf/$VPNDEV/proxy_arp
You can also use the netfilter P-O-M route patch, which allows you to
redirect traffic via different interfaces (route) based on regular
iptables conditions (-s, -d, -p, etc).

> =20
> and this must be done on the VPN server too..
> I've never done it this way with a VPN.. but you can only try it..
> =20
> I'm surprised that anything really works properly the way you've done
> it because the firewall has 2 network devices with the same IP range.
>=20
> Thanks,
>=20
>=20
> =20
> ____________________________________________
> George Vieira
> Citadel Computer Systems Pty Ltd Systems Managergeorgev AT
> citadelcomputer DOT com DOT au
> Citadel Computer Systems Pty Ltd
> Phone : +61 2 9955 2644HelpDesk: +61 2 9955 2698
> http://www.citadelcomputer.com.au
> =20
> =20
> -----Original Message-----
> From: John Paul [mailto:john@pinoylinux.sytes.net]
> Sent: Friday, June 06, 2003 9:56 AM
> To: netfilter@lists.netfilter.org
> Subject: Problem Found! - Firewall Rule
>=20
>=20
> Hello Folks, its me again :(
> =20
> Below is my config. My problem is, I can connect to VPN but for some
> reason, I cannot see machines inside the network after being
> connected. Can somebody give me the simpliest firewall rule on this?
> just for me to see the machines inside the network.
> =20
> Thanks!
> /JP
> =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-VK1+HYtcCLq6dmBa7I8x
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+4Dorh1fuR/Bv+ygRAuE9AKC7AxQoZo829JhTnkXAi0AvCiyOmgCfcxWC
9NqHE8n8qMAAxYTAbXmFN5M=
=rllM
-----END PGP SIGNATURE-----

--=-VK1+HYtcCLq6dmBa7I8x--


