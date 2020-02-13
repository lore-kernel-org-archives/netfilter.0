From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [nftables] economics of reverse path filtering - FIB expression
 vs. kernel parameter
Date: Thu, 13 Feb 2020 13:51:16 +0100 (CET)
Message-ID: <alpine.DEB.2.20.2002131342380.9582@blackhole.kfki.hu>
References: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net> <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net> <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="110363376-1677645458-1581598276=:9582"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1581598276; x=1583412677; bh=DycsiE9T/P
        KpZoYhL5nXKyaEk03p8oqStzQMy+7T+E8=; b=f/EBvpFEW0rBpBZ68WnVyebsFC
        GZciQ8WgYlIhldDzSSdFAg2aqwEcJeAR4ouaTxfUq0Jh2WEXgRRRSC6uuOg0NCdR
        QwfU+A+TBWw7bULfWzWo+7B8aGZk4ALAr/smmeB1xHiGDtJNKv66hZ/Fr6cjDa9o
        Zw+lcvrFBON+BQQrk=
In-Reply-To: <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-1677645458-1581598276=:9582
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Feb 2020, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:

> > Been also wondering about potential conflicts between kernel=20
> > parameters vs. firewall rules, which takes precedence?
> >=20
> > Another example - here purposely creating a conflict:
> >=20
> > * net.ipv6.conf.<interface>.accept_redirects =3D 0
> >=20
> > vs.
> >=20
> > * ip6 saddr fe80::/10 ip6 hoplimit 255 daddr FF02::1 icmpv6 type 137 ac=
cept;
>=20
> Looked into various publications, including [1], but came up short in=20
> discovering the hierarchy of /proc parameters vs firewall rules/chains,=
=20
> i.e.
>=20
> * is the kernel treating both the same or considers one or the other=20
> weighing more/higher than the other?
> * if treated equally does timing in availability of structures cancels=20
> out the other, e.g. first available sets the rule or the last one=20
> available cancels out the earlier one?

Check out the packet flow in netfilter and the networking stack, eg:
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.s=
vg

A networking subsystem proc/whatever setting have got a chance to tell=20
what happens with the packet if the netfilter hooks let the packet pass up=
=20
to that point. And vice versa: if a subsytem decides to drop the packet=20
(say routing due to reverse path filtering), then the next netfilter hook=
=20
won't/can't process it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-1677645458-1581598276=:9582--
