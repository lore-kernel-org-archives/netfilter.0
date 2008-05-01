From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Thu, 01 May 2008 17:44:35 -0500
Message-ID: <481A47D3.6080201@usa.net>
References: <460876.13814.qm@web57307.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC8211E8488592F1C1CD59E25"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <460876.13814.qm@web57307.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: levynoa@yahoo.com, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC8211E8488592F1C1CD59E25
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

noa levy wrote:
> Thank you again for your response. Suppose I do want drop existing conn=
ections, but I don't want to add the "drop" rule above the "allow establi=
shed" rule, for performance reasons. Does netfilter provide any API for f=
lushing the conntrack table (all of it or specific entries)?

Not easily, and not without disrupting other active connections.  If=20
conntrack support is compiled in as modules you can unload and reload=20
them, but this requires that no iptables rules reference the conntrack=20
module (ie: you must delete such rules first.)  Once unloaded, the=20
kernel will forget the maintained state table, but this also has the=20
side-effect of breaking any active sessions that were in an ESTABLISHED=20
state when you deleted the rules and reset the state table.

AFAIK there is no way to manually flush the conntrack state table or=20
remove specific entries.

> Will stopping the firewall completely flush these entries?
>  =20

That depends entirely on what the script "stopping the firewall"=20
actually does, but general the answer is "no".  If it simply flushes all =

chains and removes non-standard chains, the state table will still exist =

as this support is provided by the conntrack kernel modules, not the=20
iptables rules themselves.  Most scripts I've seen on any distro will=20
not actually unload the conntrack modules when the firewall initscript=20
is stopped, and of course this wouldn't even be possible if conntrack=20
support is compiled into the kernel rather than as a module.

It sounds like you might be using the wrong tool for the job; to=20
disconnect a user with an active ssh session why not look at running=20
sshd processes and send a SIGTERM or SIGINT signal to the one with the=20
user or users you wish to disconnect?  This strikes me as a problem best =

handled at an application level rather than a kernel level.

>
> --- On Tue, 4/29/08, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrot=
e:
>
>  =20
>> You are asking the wrong question. Iptables is a packet
>> filter, it does=20
>> not filter "sessions" (or connections). As
>> already said, the conntrack=20
>> table is not affected by rule deletion/insertion. So
>> whether packets=20
>> belonging to existing connections are allowed or not
>> depends on the new=20
>> ruleset. If the new ruleset says to ACCEPT packets in the
>> ESTABLISHED=20
>> state, then established connections are still allowed.

--=20
Josh



--------------enigC8211E8488592F1C1CD59E25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkgaR9cACgkQHSSgJy5aUSfV3wCcDfuXRzI4KMQL841VyOlN6ogl
DugAoIZXzEqzCh31HU4cUGOv5SU6uM6X
=Q2Q9
-----END PGP SIGNATURE-----

--------------enigC8211E8488592F1C1CD59E25--

