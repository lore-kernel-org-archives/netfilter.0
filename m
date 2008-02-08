From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problems using the iptables REDIRECT command
Date: Fri, 08 Feb 2008 20:31:24 +0100
Message-ID: <47ACAE0C.6030003@plouf.fr.eu.org>
References: <80421ab50802080706o576b6502ke7d63f797ede075f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <80421ab50802080706o576b6502ke7d63f797ede075f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jeffrey Rogiers a =E9crit :
>=20
> I am trying to make a service reachable by 2 different ports at the
> same time i.e.3333 to 7777 on the same machine. But i am having
> trouble getting the proper results.

What kind of trouble ?

> I have added
> echo 1 > /proc/sys/net/ipv4/ip_forward

What for ? This is not needed for REDIRECT.
