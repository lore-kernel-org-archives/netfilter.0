From: netfilter@buglecreek.com
Subject: Re: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 16:31:17 -0600
Message-ID: <1306017077.11298.1454526649@webmail.messagingengine.com>
References: <1305958205.10779.1454356989@webmail.messagingengine.com>
 <4DD7A0C5.1040200@plouf.fr.eu.org>
 <1306007342.28169.1454496985@webmail.messagingengine.com>
 <4DD825EB.2080300@plouf.fr.eu.org>
 <1306014018.28595.1454519185@webmail.messagingengine.com>
 <4DD83726.5090604@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:cc:mime-version:content-transfer-encoding:content-type:references:subject:in-reply-to:date; s=smtpout; bh=4JTTSsb2fTAvoQz54ooY+JKg1c4=; b=bkhWTiaVuxxRYHmdS8Obd4MjT56UXI+Zv1volmkD0WE2AdYqWUkfyaYEbjzkTMWQ/XFpJ77PALAPsMnczsVbyes5bVNe9qZswjN8OVOsRiorXPzplH1+dr5h6+fgoffpB7q77Ug7+FIuX8Rkh+zdtmMcVSQBdYSdGIkPr/F6MpA=
In-Reply-To: <4DD83726.5090604@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Sun, 22 May 2011 00:05 +0200, "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org> wrote:
> netfilter@buglecreek.com a =E9crit :
> > On Sat, 21 May 2011 22:51 +0200, "Pascal Hambourg"
> >>
> >> How are the virtual machine network interfaces connected together =
?
> >> Did you create two separate virtual links ?
> >> One explanation could be that all interfaces are connected to the =
same
> >> virtual link, so traffic coming to the router could arrive at any =
of its
> >> two interfaces.
> >=20
> > That's an interesting idea.  I'm not sure how Parallels sets up the
> > interfaces.
>=20
> How then do you know which interface of the router is connected to wh=
ich
> network ?

I'm basing the router connections to the various networks by the IP
addresses and network Addresses.  When I say I don't know how Parallels
sets up the interfaces I mean I do not know the underling code that the=
y
use.  Using standard tools (ifconfig, route, traceroute etc) all seems
normal.

Sending a broadcast packet (good idea) from network B I see the packet
show up at network A machine and on both interfaces of the firewall.  I
even see the packets show up on network A when the firewall/router is
turned off.  Both Net A and Net B are assigned IPs on two entirely
different networks.  Obviously, this is not the expected behavior.  I
assumed that when I created two virtual machines and assigned them
entirely different IPs on different networks they would be isolated fro=
m
each other and not be able to see traffic (broadcasts etc) from the
other net.   I will have to look at how the virtual machines are setup,
maybe there is something I missed.  It clearly does not function as I
expected.  My hope was to simulate real life different nets connected b=
y
the firewall/router. =20

>=20
> A quick test could be to send broadcast packets from A then B while
> listening on all interfaces of the other machines with tcpdump or the
> like. If you can see the broadcast packets on all interfaces then the=
y
> all are on the same network.
>=20
> > Right now I'm writing the FORWARD rules assuming that when the real
> > hardware is in place it will function as I expect.  I'm using -i et=
h0
> > and -o eth1 for new traffic originating from Network A going to B  =
and
> > -i eth1 and -o eth0 for new traffic originating from Network B to A=
=2E =20
> > Based on my original diagram below.  Does that sound reasonable?
>=20
> Sure.
>=20
