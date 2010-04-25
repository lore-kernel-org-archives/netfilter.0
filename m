From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with rdate and iptables
Date: Sun, 25 Apr 2010 13:54:41 +0200
Message-ID: <4BD42D81.1000501@plouf.fr.eu.org>
References: <hqstu1$7hm$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hqstu1$7hm$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Bauman <baumane@livejournal.dk>
Cc: netfilter@vger.kernel.org

Hello,

Eric Bauman a =E9crit :
>=20
> I'm having an issue with getting rdate working over UDP.
> I'm using the rule "--append INPUT --match state --state=20
> ESTABLISHED,RELATED --jump ACCEPT". It works fine over TCP, but times=
=20
> out when using UDP.

Is this on the server or client ? That rule does not care about the
protocol, but a rule alone without the rest of the ruleset does not tel=
l
much.

> Any ideas?

Rather a suggestion. You could trace relevant traffic with a packet
sniffer and/or iptables LOG rules and try to see what's going on.
Disable all filtering and check if it works. Does the rdate server
accept UDP queries ?
