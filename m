From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 13:48:25 +0200
Message-ID: <49F59B89.3060706@plouf.fr.eu.org>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>    <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>    <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com> <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jorge Bastos a =E9crit :
>=20
> That is no solution. it may be for your cenario but not for the most =
of
> people. Just think, if who makes the connection is a modem, and you h=
ave
> your *unix machine on nat, that won't work.

Whether the host is behind a NAT device or not is irrelevant. If there=20
is a NAT device, its address is irrelevant to the iptables running on=20
the host behind it.

> For iptables to do a DNS query every time a packet comes, that's a di=
saster.
> But other thing cames in mind, when doing: "iptables -L" it does a re=
verse
> lookup on the IP's, is iptables doing a reverse lookup on every packe=
t? or
> only when listing the rules?

Only when adding/removing/listing rules.
iptables comes in two parts :
1) A userland part, usually the iptables command, adds/removes/lists=20
rules into the kernel. Before doing so it may do DNS lookups to resolve=
=20
names into addresses.
2) A kernel part which enforces the ruleset for every packet. It does=20
not do DNS lookups, as the kernel itself does not even know about DNS=20
(/etc/resolv.conf et al. are userland stuff).
