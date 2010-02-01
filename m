From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to debug RST filter ?
Date: Mon, 01 Feb 2010 20:29:03 +0100
Message-ID: <4B672B7F.4060603@plouf.fr.eu.org>
References: <4B668B62.1090200@gmail.com> <L749C3EBF46964d4a9E404BAF2BFD837F.1265011977.scalix01.aarboard.ch@MHS>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <L749C3EBF46964d4a9E404BAF2BFD837F.1265011977.scalix01.aarboard.ch@MHS>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: a.schild@aarboard.ch
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

a.schild@aarboard.ch a =E9crit :
>=20
> Rule 15 is the one which should allow everything "local" on the firew=
all
>=20
> #
> # Rule 15 (global)
> #
> echo "Rule 15 (global)"
> #
> #
> #
> $IPTABLES -N Cid4A4A84F123430.0
> $IPTABLES -A INPUT  -s myip   -m state --state NEW  -j Cid4A4A84F1234=
30.0
> $IPTABLES -A INPUT  -s 127.0.0.1   -m state --state NEW  -j Cid4A4A84=
=46123430.0
> $IPTABLES -A Cid4A4A84F123430.0  -d myip   -j ACCEPT
> $IPTABLES -A Cid4A4A84F123430.0  -d 127.0.0.1   -j ACCEPT
> $IPTABLES -N Cid4A4A84F123430.1
> $IPTABLES -A OUTPUT  -s myip    -m state --state NEW  -j Cid4A4A84F12=
3430.1
> $IPTABLES -A OUTPUT  -s 127.0.0.1   -m state --state NEW  -j Cid4A4A8=
4F123430.1
> $IPTABLES -A Cid4A4A84F123430.1  -d myip   -j ACCEPT
> $IPTABLES -A Cid4A4A84F123430.1  -d 127.0.0.1   -j ACCEPT

I do not see here "a rule which allows everything in/out on the
lo interface". Such rules would be :

iptables -A INPUT -i lo -j ACCCEPT
iptables -A OUTPUT -o lo -j ACCCEPT

Instead, your rules accept only packets in the NEW state (RST packets
are never in that state) whose source and destination addresses are
"myip" or 127.0.0.1 (not only 127.0.0.1 but also the whole 127.0.0.0/8
range may be used on the loopback interface).
