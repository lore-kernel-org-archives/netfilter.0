From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Sun, 03 Feb 2013 12:51:40 +0100
Message-ID: <510E4F4C.50202@plouf.fr.eu.org>
References: <51014395.1000101@doodle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51014395.1000101@doodle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gubler <dg@doodle.com>
Cc: netfilter@vger.kernel.org

Hello,

David Gubler a =E9crit :
>=20
> iptables -A INPUT -p tcp --syn --dport 8080 -m connlimit=20
> --connlimit-above 4 -j REJECT

You should reject with TCP reset instead of (default) ICMP destination
port unreachable.

> The fifth connection fails as expected, but after I kill some of the=20
> other connections (verified with netstat -anp | grep ESTABLISHED), I=20
> *still* cannot open new connections!
>=20
> To be able to connect again, I have to cease *any* connect attempts f=
or=20
> about two minutes. If I repeatedly try to connect, I'm not able to=20
> connect ever again (!), even when there are no more established conne=
ctions.
>=20
> As far as I can tell, the problem is the way connlimit works: It look=
s=20
> at the conntrack table and considers all entries there, even the=20
> SYN_WAIT ones (the ones that have been rejected by connlimit end up i=
n=20
> that state). Or to put it differently: If connlimit denies a connecti=
on,

The connlimit match just matches packets, it does not deny anything. Th=
e
REJECT target does.

> that connection will *still* create a conntrack entry and thus will a=
lso=20
> count against the connection limit. This can be verified using the=20
> "conntrack -L" command.

This is not the expected behaviour. AFAIK, when a packet creating a new
connection is DROPPed or REJECTed, the conntrack entry should be
deleted. This is what I observe on my system. And connlimit does not
even count closed connection still in the TIME_WAIT state.
What is your kernel version ?
