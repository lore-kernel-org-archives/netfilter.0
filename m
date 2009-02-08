From: Eric Leblond <eleblond@inl.fr>
Subject: Re: Incoming packet in wrong chain
Date: Sun, 08 Feb 2009 22:28:03 +0100
Message-ID: <498F4E63.8050603@inl.fr>
References: <20090208171752.32010@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090208171752.32010@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Ritberg <tim_rit@gmx.de>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Tim Ritberg a =E9crit :
> Hi!
>=20
> I got Kernel 2.6.22 und do some Masquerade for my Windows boxes.
>=20
> My problem get visible in this rule:
> Chain INPUT (policy DROP 0 packets, 0 bytes)
> 113 87963 DROP_LOG 0 --  ppp0 * 0.0.0.0/0 0.0.0.0/0 state NEW
>=20
> This rule is at bottom of my INPUT-Chain.
>=20
> Kernel says:
> DROP: IN=3Dppp0 OUT=3D MAC=3D SRC=3D217.13.68.183 DST=3D91.xx.xx.xx L=
EN=3D58 TOS=3D0x00 PREC=3D0x00 TTL=3D59 ID=3D55058 DF PROTO=3DTCP SPT=3D=
80 DPT=3D2409 WINDOW=3D14520 RES=3D0x00 ACK URGP=3D0
>=20
> This ACK packet belongs to surfing WWW and should never get into INPU=
T-Chain. The problem occurs randomly.
> Is this a bug? A why hit a rule for SYN packets at ACK packets?

=46or Netfilter connection tracking, a NEW TCP connection does not have=
 to
start with a SYN packet. If
/proc/sys/net/netfilter/nf_conntrack_tcp_loose is set to 1 (default),
Netfilter will try to pick up connection. By this mean, it is possible
to recover a connection (in some fail-over case for example), but it
introduces this looking-weird-at-first behaviour.

BR,
- --
Eric Leblond <eleblond@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
EdenWall: http://www.edenwall.com/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFJj05dnxA7CdMWjzIRAk2BAJ4p7uOUzgNsTrOrGbg2sVTYEa8bjwCeLowc
tJssXCPP3rJk/isR9cnynvg=3D
=3Dhb1D
-----END PGP SIGNATURE-----
