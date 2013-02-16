From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting DNS Not Working
Date: Sat, 16 Feb 2013 11:51:32 +0000
Message-ID: <1361015492.10501.44.camel@andrew-desktop>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	 <1360946103.2251.2.camel@andylaptop> <511F6EF3.5090506@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <511F6EF3.5090506@plouf.fr.eu.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1361015501;
	bh=7eSN1RpOwV1MpwDgrECV4CQ6HOvJy/M3zVmIGYLF0qg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=n6SudT7/ELc0UEe4bNSMHm8EdJivhWYyyq5HASFecmgZw5x7WySG7rF9TkSaOhXdA
	 sQJB+aSDWQWwifEi+c9ryF5npKFNDZ5KdFlmRJBJFftwJbt+7/tPGfpyCVglBygfBO
	 AJqgI0kjyYB4WHbb6PPKbwagwtKakJtvJmLjL2bM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: John Corps <envoys@gmail.com>, netfilter@vger.kernel.org

On Sat, 2013-02-16 at 12:35 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> Andrew Beverley a =C3=A9crit :
> > On Fri, 2013-02-15 at 11:24 -0500, John Corps wrote:
> >>
> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dp=
ort
> >> 53 -j REDIRECT --to-ports 53
> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dp=
ort
> >> 53 -j REDIRECT --to-ports 53
> >=20
> > If you want to redirect the requests to the local server, then you'=
ll
> > need to use the DNAT target instead. All you're doing in your rules=
 is
> > changing to port 53 a packet that is destined to port 53 (so nothin=
g at
> > all).
>=20
> Nonsense. You should read the manpage more carefully.
>=20
> QUOTE
>  REDIRECT
>  This  target is only valid in the nat table, in the PREROUTING and O=
UT-
>  PUT chains, and user-defined chains which are only  called  from  th=
ose
>  chains.   It redirects the packet to the machine itself by changing =
the
>  destination IP  to  the  primary  address  of  the  incoming  interf=
ace
>  (locally-generated packets are mapped to the 127.0.0.1 address).
> END OF QUOTE

Okay, I stand corrected, although I personally would still use the DNAT
target for that use-case :)

Incidentally, the manpage stipulates "--to-ports" but the earlier
example in the same manpage is "--to-port". Both seem to be accepted.
Any difference?


