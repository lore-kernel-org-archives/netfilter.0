From: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: SSH Port Forwarding with iptables
Date: Thu, 01 Oct 2009 18:26:15 +0200
Message-ID: <4AC4D827.3040101@freemail.hu>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com> <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com> <4AC4864E.4020404@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AC4864E.4020404@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Bill Hendrickson <wjhendrickson@gmail.com>, netfilter list <netfilter@vger.kernel.org>

Hi!

Pascal Hambourg =EDrta:
> You don't need SNAT nor masquerade. It hides the real source address
> from the server. You just need to add a proper route on the server so=
 it
> knows how to reach the client address via the router.
>
> Besides, the SNAT rule proposed by Gaspar could not help because it
> works on the external interface, while the missing route on the serve=
r
> requires SNAT/MASQUERADE on the internal interface.
>  =20
After reading back the whole conversation I found out that you are righ=
t! :D
I just thought that we have here an usual "gateway/firewall" scenario.

So you really only need SNAT/MASQUERADE on any interface (mostly on the=
=20
internet side) if your connected network (internet) does NOT knows=20
anything about the other side of your gateway (your LAN).

Swifty
