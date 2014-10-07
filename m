From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Wed, 08 Oct 2014 02:28:31 +0300
Message-ID: <5434771F.6010301@ngtech.co.il>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com> <5434458A.2030701@ngtech.co.il> <CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com> <201410071827.44706.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <201410071827.44706.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/08/2014 01:27 AM, Neal Murphy wrote:
> Would a plain unencrypted GRE tunnel between the TS and the file
> server alleviate the problem? Or if data security is a concern, set
> up a proper VPN between them. And use iptables (and other firewalls
> as necessary) to limit traffic as desired whether it's a simple
> tunnel or a VPN. (You don't want the tunnel to be an easy bypass
> around the firewall.)
+1 on this.
Except a gre tunnel is not that easy on a Windows TS or at all on a
windows machine.
The main issue is that he has 200+ machines in one subnet that needs
access to the other one...

The options I now that works in windows are pptp(with internal GRE),
l2tp, openvpn and maybe couple others.

In this case the GW machine is a linux machine and can be used or
being used as the default gateway.
If it's the gateway it will be pretty simple to setup using a VPN but
he will need to address all sorts of details in the domain level(if used).

Eliezer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUNHcfAAoJENxnfXtQ8ZQU4FAIAJlItszd7wnPBKoLHq2qWOT6
1imYjfq33NIlOZETKCNkBep0bfKkqLvFUFdHe9uaChunXVBBbdDJF5FYqKmfm43X
qdD0m2pNfuy64cvGUwy58YycqtWCXarPgbMl/TGS4Xc0qx3MsZtgibwpkRMOTOiI
++8c7Km0xVzHuGv14WWXnKwSMs7O4nPg2/JXjKwP/FeK6zxuFJE2g/plqxOCOXDN
f/6HakMf+savsbkREORBXi6PVBSr30ByYn6BP1w9os0OwfsXJO2GYei1FnmZ8yot
aIXCIijmNNMrEShJPkX7heJaquGYZ/5NcWIM32ahl1F0imEjCICaq215mt9Nvho=
=qUpW
-----END PGP SIGNATURE-----
