From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: IPv6 connection tracking mDNS
Date: Sat, 25 May 2013 15:43:13 +0200
Message-ID: <51A0BFF1.8070309@plouf.fr.eu.org>
References: <20130523125852.591af01c@leda>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130523125852.591af01c@leda>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Hesse <list@eworm.de>
Cc: netfilter@vger.kernel.org

Hello,

Christian Hesse a =E9crit :
>=20
> I have problems with my IPv6 firewall concerning connection tracking =
and
> mDNS. This is part of the rules:
>=20
> -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -m conntrack --ctstate INVALID -j DROP
> -A INPUT -s fe80::/64 -d ff02::fb -p udp -j LOG --log-prefix "DEBUG1:=
 "
> -A INPUT -s fe80::/64 -d ff02::fb -p udp --dport 5353 -j ACCEPT
> [...]
> -A INPUT -j LOG --log-prefix "DEBUG2: "
> -A INPUT -j REJECT
>=20
> So why is the connection not tracked? I would expect the fragment to =
belong
> to an established connection and accepted.

mDNS uses multicast, and AFAIK netfilter connection tracking does not
(yet ?) handle multicast because the source/destination addresses in th=
e
reply packet do not match those in the request packet, so it does not
qualify as a "connection" by the conntrack standards.
