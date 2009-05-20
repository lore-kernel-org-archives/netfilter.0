From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 19:03:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905201900330.10915@blackhole.kfki.hu>
References: <805815.64593.qm@web44802.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-1473117199-1242838969=:10915"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <805815.64593.qm@web44802.mail.sp1.yahoo.com>
Content-ID: <alpine.DEB.2.00.0905201903020.10915@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Miguel Ghobangieno <mikeeusa@yahoo.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-1473117199-1242838969=:10915
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.00.0905201903021.10915@blackhole.kfki.hu>

On Wed, 20 May 2009, Miguel Ghobangieno wrote:

> Those are various rules I've tried. I've tried the hex, then when that
> didn't work I tried the "ip and IPv4" stuff. None worked.
>=20
> Here is the test network currently:
> laptop---(crossover
> cable)-->[eth1](BridgingFirewall[Br0])[eth0]---->[192.168.0.1](Linksys
> router)--->[Internet]

OK. So the linksys box is the dhcp server.
=20
>       But it's really strange and suspicious that names do not work,
>       something is really broken on your system. Have you got a
>       correct=A0
>       /etc/ethertypes file? Does you run the ebtables commands in
>       chroot?

Why don't you check that file?

>       Why don't you log the packets??

Third times I write: why don't you log the packets?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-1473117199-1242838969=:10915--
