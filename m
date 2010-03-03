From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Stateful port redirection?
Date: Thu, 04 Mar 2010 00:32:11 +0100
Message-ID: <4B8EF17B.3090808@plouf.fr.eu.org>
References: <653bea161003031448i233ecaap18afa475241b0704@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <653bea161003031448i233ecaap18afa475241b0704@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

=46ar=E9 a =E9crit :
>=20
> Is it possible using netfilter to
> a- redirect TCP traffic from port 10000 (visible to the public) to
> port 10010 (invisible to the public)

What do you mean by invisible ?

> b- change the rule so that that traffic to port 10000 is now
> redirected to port 10020 (also invisible to the public) *except* for
> packets associated with existing connections, that will remain
> redirected to port 10010.

Yes. This is the way stateful NAT works. Changes in NAT rules apply onl=
y
to new connections.
