From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables: unknown protocol "!" specified
Date: Sun, 22 Nov 2015 18:20:26 +0100
Message-ID: <5651F95A.2060604@plouf.fr.eu.org>
References: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org> <56517A70.4020001@plouf.fr.eu.org> <alpine.LNX.2.00.1511220946050.3864@maria.rogerprice.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1511220946050.3864@maria.rogerprice.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Roger Price a =E9crit :
> On Sun, 22 Nov 2015, Pascal Hambourg wrote:
>=20
>> No, it means to match anything but TCP. There are many other protoco=
ls
>> than TCP, UDP and ICMP.
>=20
> Aha! Does this mean that chapter 10.1 of the iptables tutorial at=20
> https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#GE=
NERICMATCHES=20
> is both syntactically and semantically wrong?

I'm afraid yes. I had read this tutorial but hadn't spotted this big
mistake. I wonder where it comes from. I have searched in early release=
s
of iptables, but "all" or 0 has consistently meant "all", not just TCP,
UDP and ICMP.

> Quoting: << ALL means that it matches only TCP, UDP and ICMP. If this=
=20
> match is given the integer value of zero (0), it means ALL protocols,=
=20
> which in turn is the default behavior, if the --protocol match is not=
=20
> used. This match can also be inversed with the ! sign, so --protocol =
! tcp=20
> would mean to match UDP and ICMP. >>
>=20
> Should this say:
>=20
> << ALL matches every protocol given in /etc/protocols, i.e. all proto=
cols=20
> in the interval (0..255).  ALL is the default behaviour and can also =
be=20
> specified by writing 0 (zero). The match may be reversed by writing "=
!=20
> --protocol x" which means all the 256 protocol numbers except x.  E.g=
=2E "!=20
> -p tcp" means the protocols in intervals (0..5) and (7..255).  >>

Yes, or just quote the relevant part of the manpage :

[!] -p, --protocol protocol
      The protocol of the rule or of the packet to check.  The  speci-
      fied protocol can be one of tcp, udp, udplite, icmp, icmpv6,esp,
      ah, sctp, mh or the special  keyword  "all",  or  it  can  be  a
      numeric  value, representing one of these protocols or a differ-
      ent one.  A protocol name from /etc/protocols is  also  allowed.
      A "!" argument before the protocol inverts the test.  The number
      zero is equivalent to all. "all" will match with  all  protocols
      and is taken as default when this option is omitted.  Note that,
      in ip6tables, IPv6 extension headers except esp are not allowed.
      esp  and  ipv6-nonext  can be used with Kernel version 2.6.11 or
      later.  The number zero is equivalent to all, which  means  that
      you  cannot test the protocol field for the value 0 directly. To
      match on a HBH header, even if it were the last, you cannot  use
      -p 0, but always need -m hbh.

> If people have believed the tutorial and used "! -p icmp" as a shorth=
and=20
> for "TCP and UDP", then they will be letting through more than they=20
> expect.

Bottom line : do not trust tutorials too much. Read the manpage.
