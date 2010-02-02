From: "Andre Schild" <a.schild@aarboard.ch>
Subject: RE: Re: How to debug RST filter ?
Date: Tue, 2 Feb 2010 07:42:05 +0100
Message-ID: <L0C87CB4F1E0446438C91652886BDCF5B.1265092923.scalix01.aarboard.ch@MHS>
References: <4B672B7F.4060603@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B672B7F.4060603@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello Pascal,

> > Rule 15 is the one which should allow everything "local" on the
> firewall
> >
> > #
> > # Rule 15 (global)
> > #
> > echo "Rule 15 (global)"
> > #
> > #
> > #
> > $IPTABLES -N Cid4A4A84F123430.0
> > $IPTABLES -A INPUT  -s myip   -m state --state NEW  -j
> Cid4A4A84F123430.0
> > $IPTABLES -A INPUT  -s 127.0.0.1   -m state --state NEW  -j
> Cid4A4A84F123430.0
> > $IPTABLES -A Cid4A4A84F123430.0  -d myip   -j ACCEPT
> > $IPTABLES -A Cid4A4A84F123430.0  -d 127.0.0.1   -j ACCEPT
> > $IPTABLES -N Cid4A4A84F123430.1
> > $IPTABLES -A OUTPUT  -s myip    -m state --state NEW  -j
> Cid4A4A84F123430.1
> > $IPTABLES -A OUTPUT  -s 127.0.0.1   -m state --state NEW  -j
> Cid4A4A84F123430.1
> > $IPTABLES -A Cid4A4A84F123430.1  -d myip   -j ACCEPT
> > $IPTABLES -A Cid4A4A84F123430.1  -d 127.0.0.1   -j ACCEPT
>=20
> I do not see here "a rule which allows everything in/out on the
> lo interface". Such rules would be :
>=20
> iptables -A INPUT -i lo -j ACCCEPT
> iptables -A OUTPUT -o lo -j ACCCEPT
>=20
> Instead, your rules accept only packets in the NEW state (RST packets
> are never in that state) whose source and destination addresses are
> "myip" or 127.0.0.1 (not only 127.0.0.1 but also the whole 127.0.0.0/=
8
> range may be used on the loopback interface).

Ok,

I see what you mean, is the RST not (one of) the last packet when a=20
connection
is closed/dropped ?



Andr=E9
