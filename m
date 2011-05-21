From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 22:51:55 +0200
Message-ID: <4DD825EB.2080300@plouf.fr.eu.org>
References: <1305958205.10779.1454356989@webmail.messagingengine.com> <4DD7A0C5.1040200@plouf.fr.eu.org> <1306007342.28169.1454496985@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1306007342.28169.1454496985@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

netfilter@buglecreek.com a =E9crit :
>=20
> As far as the virtual machines.  All three test systems are virtual.=20
> They run RH5 using Mac with parallels.  The routing tables are below.=
=20

[Nothing unexpected in the routing tables]

How are the virtual machine network interfaces connected together ?
Did you create two separate virtual links ?
One explanation could be that all interfaces are connected to the same
virtual link, so traffic coming to the router could arrive at any of it=
s
two interfaces.
