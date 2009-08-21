From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: nmap scan makes my apache connection  super slow
Date: Fri, 21 Aug 2009 16:34:18 +0200
Message-ID: <4A8EB06A.6060400@plouf.fr.eu.org>
References: <4A8E638D.8040006@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A8E638D.8040006@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hello,

J. Bakshi a =E9crit :
>=20
> nmap scan " nmap -P0 ...."  makes my apache connection super slow !!!

What do you mean exactly by "slow" ? Low tranfer rate ? It takes longer
to establish a connection ?

> ## SYN-FLOODING PROTECTION
> iptables -N syn-flood
> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
> iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN

1/s is much too strict. Even in normal use a server may receive much
more connection requests in one second.

> ## FRAGMENTS
> iptables -A INPUT -i $IFACE -f -j LOG --log-prefix "IPTABLES FRAGMENT=
S: "
> iptables -A INPUT -i $IFACE -f -j DROP

Useless. Fragment reassembly occurs before the INPUT chains (and even
before PREROUTING chains - except the 'raw' table - when conntrack is
enabled), so there are no fragments there.

> But nmap scan on the server makes apache connection running on it sup=
er
> slow !!!
> If I stop the scan apache again become normal.
> Is there any trick to keep the connection normal even with scanners a=
re
> doing their job ? Please suggest how to cope with it.

Make an exception to the syn flood protection for TCP port 80 (or any
port apache listens on), with at least a much higher limit than 1/s. Ho=
w
high ? Well, as high as your system can take without choking.
