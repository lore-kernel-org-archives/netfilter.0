From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 17:07:46 -0500
Message-ID: <4813A7B2.8020401@usa.net>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com> <f36b08ee0804261302ubcc568fyab0d42e5645e3eab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigDF569A244CBDAA8DA770DA63"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f36b08ee0804261302ubcc568fyab0d42e5645e3eab@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Yakov Lerner <iler.ml@gmail.com>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDF569A244CBDAA8DA770DA63
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Yakov Lerner wrote:
> Allow me rewrite and clarify my question, I was not clear:
>
> I need to setup iptables on system A to drop packets
> from all IPs except packets coming from system B.
> System B has dynamic IP (dynip.sh).  B's DNS name
> is known but B's IP is not fixed. What are my options to setup iptables=
 on A ?
>  =20

iptables only deals with IP addresses, although it will convert a DNS=20
name in the command to an IP (or series of IP's if the lookup returns=20
multiple A records.)  As such, you can use any method you prefer in=20
userland to check for and update your rules when the DNS resolution chang=
es.

> Is there better solution than crontab-script, that every 10 minutes
> resolves this domain and reinstalls iptables rule if IP changed ?

If you have a script that works when called from cron, why use a=20
different method?  Depending on your specific scenario, various options=20
might be available.  As an example, if you happened to be using a VPN=20
between A and B, you could have a monitor script that checks for valid=20
authentication from system B and updates the iptables rule if the=20
address has changed (of course, then you wouldn't need to restrict=20
inbound traffic - see below.)  Regardless of what you use, the basic=20
principle is always the same; you need a way to check the IP (such as by =

resolving it) and update the rule if the IP has changed.

I'll also point out that this isn't a replacement for proper IP security =

between hosts A and B; a possible attack vector on your setup would be=20
another user of the subnet on the WAN side of host A executing a=20
MAC-spoofing attack between you and the ISP's default gateway and then=20
spoofing the IP of host B, thus enabling 2-way communication between the =

attacker and host A.  Using TLS or a VPN to secure the traffic will=20
eliminate this problem, and allow you to listen on the secure port from=20
anywhere also solving the dynamic DNS update problem you described above.=


--=20
Josh



--------------enigDF569A244CBDAA8DA770DA63
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkgTp7cACgkQHSSgJy5aUSdtywCfVIjrSNvZ4bjLTmMSbrPcPWdE
f28AoI0WvGvU44bbZIKBG5x5jmUtwaOD
=ZY9q
-----END PGP SIGNATURE-----

--------------enigDF569A244CBDAA8DA770DA63--

