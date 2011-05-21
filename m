From: netfilter@buglecreek.com
Subject: Re: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 15:40:18 -0600
Message-ID: <1306014018.28595.1454519185@webmail.messagingengine.com>
References: <1305958205.10779.1454356989@webmail.messagingengine.com>
 <4DD7A0C5.1040200@plouf.fr.eu.org>
 <1306007342.28169.1454496985@webmail.messagingengine.com>
 <4DD825EB.2080300@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:cc:mime-version:content-transfer-encoding:content-type:references:subject:in-reply-to:date; s=smtpout; bh=KNnZXef0hkL2w/LEIe1qwhuZ4/U=; b=lTBB4+jKX74gmfLJZmxROPtr+QCxvq1ibQvl9A5lgQRtll8pjkRhJpKPGlF++EvHqP24M9KiGZV1SGi0nlBaok/R442HremqY8kK6gbWw3Je2XcSF6cj3e8qAPygSrIP9V9B3N9qC50gLSkqCPo3c0ZqEjEA6mGbDSXhXXvbEgE=
In-Reply-To: <4DD825EB.2080300@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Sat, 21 May 2011 22:51 +0200, "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org> wrote:
> netfilter@buglecreek.com a =E9crit :
> >=20
> > As far as the virtual machines.  All three test systems are virtual=
=2E=20
> > They run RH5 using Mac with parallels.  The routing tables are belo=
w.=20
>=20
> [Nothing unexpected in the routing tables]
>=20
> How are the virtual machine network interfaces connected together ?
> Did you create two separate virtual links ?
> One explanation could be that all interfaces are connected to the sam=
e
> virtual link, so traffic coming to the router could arrive at any of =
its
> two interfaces.
>=20

That's an interesting idea.  I'm not sure how Parallels sets up the
interfaces.  When I created the virtual machines I selected "Host Only"
networking so I could make distinct systems and I didn't use shared
since I did not need the machines to connect to the Internet via the
physical host interface.   When I do a ifconfig on the firewall/router
it lists eth0 and eth1 like you see on a normal system.  I'm not sure
what is going on. I'll look into how the interfaces are created.

Right now I'm writing the FORWARD rules assuming that when the real
hardware is in place it will function as I expect.  I'm using -i eth0
and -o eth1 for new traffic originating from Network A going to B  and
-i eth1 and -o eth0 for new traffic originating from Network B to A. =20
Based on my original diagram below.  Does that sound reasonable?

Network A Machine Eth0 <-------> Eth0 Firewall/Router Eth1 <------->
Eth0 Network B Machine
