From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FORWARD chain and Interfaces
Date: Sun, 22 May 2011 00:05:26 +0200
Message-ID: <4DD83726.5090604@plouf.fr.eu.org>
References: <1305958205.10779.1454356989@webmail.messagingengine.com> <4DD7A0C5.1040200@plouf.fr.eu.org> <1306007342.28169.1454496985@webmail.messagingengine.com> <4DD825EB.2080300@plouf.fr.eu.org> <1306014018.28595.1454519185@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1306014018.28595.1454519185@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

netfilter@buglecreek.com a =E9crit :
> On Sat, 21 May 2011 22:51 +0200, "Pascal Hambourg"
>>
>> How are the virtual machine network interfaces connected together ?
>> Did you create two separate virtual links ?
>> One explanation could be that all interfaces are connected to the sa=
me
>> virtual link, so traffic coming to the router could arrive at any of=
 its
>> two interfaces.
>=20
> That's an interesting idea.  I'm not sure how Parallels sets up the
> interfaces.

How then do you know which interface of the router is connected to whic=
h
network ?

A quick test could be to send broadcast packets from A then B while
listening on all interfaces of the other machines with tcpdump or the
like. If you can see the broadcast packets on all interfaces then they
all are on the same network.

> Right now I'm writing the FORWARD rules assuming that when the real
> hardware is in place it will function as I expect.  I'm using -i eth0
> and -o eth1 for new traffic originating from Network A going to B  an=
d
> -i eth1 and -o eth0 for new traffic originating from Network B to A. =
=20
> Based on my original diagram below.  Does that sound reasonable?

Sure.
