From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: why good to drop *these* TCP flag settings...?....
Date: Wed, 06 Apr 2005 14:33:43 +0200
Message-ID: <4253D727.6060304@mnemon.de>
References: <20050405062553.GA13645@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050405062553.GA13645@spawar.navy.mil>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi,

some time ago that I read the RFC, so everything is not to be taken as
"last wisdom" :)

>
>
> # Is the explanation for these because SYN starts a # connection
> and it doesn't make sense to reset (RST) # or terminate (FIN) at
> the same time your initiating (SYN)??? --tcp-flags SYN,RST SYN,RST
> -j DROP --tcp-flags SYN,FIN SYN,FIN -j DROP

A packet with SYN set has either no other flags set (starting a
connection, moving to state SYN_SENT) or has an additional ACK set
(moving from state SYN_RECIEVED to ESTABLISHED). So these combinations
of flags are impossible in normal TCP/IP communication. Chances are
good, that you are scanned.

>
> # Is this obvious in that you can't finish (FIN) and # reset (RST)
> at the same time? --tcp-flags FIN,RST FIN,RST -j DROP

Yes, also according to the RFC a RST package can only have an
additional ACK.

>
> # Can these be explained by simple fact that *ALL* packets # must
> have ACK set after connection established?? Is that right? # (if
> yes, could we add 'ACK,RST RST' to drop list as well?) --tcp-flags
> ACK,FIN FIN -j DROP --tcp-flags ACK,PSH PSH -j DROP
> --tcp-flags ACK,URG URG -j DROP

As far as I remember PSH and URG must be send only with an ACK, but I
can't tell this for sure. The FIN rule will cause trouble sometimes,
at least this is my opinion. Although normally FIN comes along with an
ACK, the RFC states that single FINs may be send (e.g. moving from
ESTABLISHED to FIN_WAIT_1). So with this FIN rule some connections
will not terminate correctly.

>
> What would DROP rule look like to protect against Xmas tree scan?
> You'd want to drop packets with FIN, PSH and URG /all/ set right?

Yes.

Any other thoughts ?

Have a nice time,

Joerg

>
> Thanks!
>
> Chris



- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCU9cnt9fkjiZ7IE8RArt6AKDN03YfANmy7U1HJ6EHOBVPVpmx9QCglbja
n0RyA2SYzIKa68OP8PDcnbc=3D
=3DmE5U
-----END PGP SIGNATURE-----



