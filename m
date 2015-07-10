From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: SNAT and connection tracker: should established connections be
 dropped when a rule is removed from nat table?
Date: Fri, 10 Jul 2015 18:29:22 +0200
Message-ID: <559FF2E2.1030703@familie-kuntze.de>
References: <CAH+_UjXdghtMhmdovrim1LBqBNGLFht7qJ4Y70wkwN6dw+SfPw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH+_UjXdghtMhmdovrim1LBqBNGLFht7qJ4Y70wkwN6dw+SfPw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitaly Repin <vitaly.repin@gmail.com>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Vitaly,

Create a drop rule in *filter FORWARD, that drops incoming
packets for SNATed IPs without a matching policy

- -A FORWARD -m ipset --set snatedIPs dst -m policy --pol none --dir ou=
t -j DROP

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 10.07.2015 um 18:26 schrieb Vitaly Repin:
> Hello,
>
> I need am advice on SNAT.
>
> There is SNAT setup where my clients connected through ipsec. Wheneve=
r
> new connection appears, SNAT rule for respective IP is created.
> Whenever client disconnects, corresponding SNAT rule is dropped.
>
> In general it works, but this schema leads to the packets leakage thr=
ough NIC:
>
> 1) IPSEC client disconnects
> 2) Rule for this client is deleted from the nat table
> 3) But incoming messages (from remote servers) for already establishe=
d
> connections are continuing to come! They are "de-NATed" regardless of
> the fact the rule does not exist anymore.
> 4) They come to xfrm subsystem which does not take them (as no SA
> associated with this IP exists)
> 5) As a result these packets (addressed to the private addresses) are
> appearing on the eth0 interface
>
> As of now my solution is to drop these packets using ebtables. But I
> am still not sure it's an optimal one.
>
> So, my questions:
>
> - Do I understand it right that when SNAT rule is deleted from the na=
t
> table, it does not mean that already established connections are
> stopped from being tracked? And the they are continuing to flow using
> the rule which was assigned to them at the moment when corresponding
> connection was created?  Can this behavior be changed?
> - Any idea how can current schema be improved?   The first option I
> see is to be able to stop SNATting of the connections for which the
> rule was deleted. In theory I can do it even from userland. The secon=
d
> option is to ask xfrm to drop all the packets from specific network i=
f
> there no SA for dest IP address of the packet (sounds weird).
>
> Thanks in advance!
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVn/LdAAoJEDg5KY9j7GZYfBAP/18DtqJMLoLu/1AG0u+8aZLO
LmjHXjM71vHzccTOvhEyZxIzqXSiuPmDjBE5jq9Q353aloQwkwJaO8XOJVhnUpuN
qmx+niDhkXOiRtZGhm+C5qiewx4ZW7V+njljYapZkRd93GIVdVViVffiIM8/VMeA
pOy5Wax4KK1J/68grBU6U5dObDGWhvJschb3bTIZEEoJdR5H7+3/utYGemyghqtR
k3UjGvfRONWoSF/kX7vUgnKkzmI0ZgsneenHMuD4Jr1UaQ1hdxXu6iwZ3b8b88u5
a7drQkqal5CLoINBPPhlYwemC7hVwEJLfLC6eEfvwpvhwNB9dtgStwFSZjfwJQ/d
q5K/qpHMW79WNUwalKsjXzfAUzndUk9ZoZhPwZrzML5UqbzRimN1v3QlpH9ERCAc
b0h1z0LcsPXkexh24PyjgAw2GGJk1AlCip4VYT8XLw1+xSes67C2hxlhWwq0upDF
HBpgUzJqmrLQYuuBcwQhBF2syTFxFwZvTQzKXF07gJmKAFrXuO1tQghi3/BOMiWt
f1hlGws4AJrhL6a00/Y53eXWjM36vYDDSvh8ClqHMvimNQksTozGjupmMd0ME9ar
1S76/RGz2FhL1ZmKcGXANY9hevlvoOlbsypxyE5gBpZOK77gNILDztBmP2QfMCfv
Rr2/8zvxsgYevPG1fwIU
=3DmuPm
-----END PGP SIGNATURE-----

