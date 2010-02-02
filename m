From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPV6 and Pre/post routing
Date: Tue, 02 Feb 2010 20:09:22 +0100
Message-ID: <4B687862.7010204@plouf.fr.eu.org>
References: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gary Smith <gary.smith@holdstead.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hello,

Gary Smith a =E9crit :
>=20
> I'm doing some information gathering an IPV4 to IPV6 conversion
> project.  We are looking at migrating to a colo that provides IPV4 an=
d
> IPV6, with IPV4 over IPV6.  Converting all of the servers to IPV6 sho=
uld
> be a pretty simple task as all of the equipment and OS's we run suppo=
rt
> it.  The problem is that we do a lot of NAT stuff.
>=20
> We have a number of web servers that have public IP's but none house
> email (as we have a dedicated infrastructure for that).  So when a
> request for ports 25,110,4somthing,143,587,993,995 (any other mail
> related ports I missed) come in, they get NAT'ed to a set of mail
> proxies.  Under IPV4 this is quite easy (catch it in the PREROUTING
> table).

s/table/chain/

> What I'm wondering, after reading some old documentation on iptables,
> if this is possible with IPV6.

Netfilter has no support for IPv6 NAT, and hopefully never will.
Can't the DNS records for mail just point directly to the addresses of
the mail servers ?
