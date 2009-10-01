From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SSH Port Forwarding with iptables
Date: Fri, 02 Oct 2009 00:07:34 +0200
Message-ID: <4AC52826.3030800@plouf.fr.eu.org>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>	 <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com>	 <4AC4864E.4020404@plouf.fr.eu.org> <a0017e7e0910010824x697f1e82h57abe8df7ca68208@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0017e7e0910010824x697f1e82h57abe8df7ca68208@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Hendrickson <wjhendrickson@gmail.com>
Cc: netfilter list <netfilter@vger.kernel.org>

Bill Hendrickson a =E9crit :
>> In the FORWARD chain the destination port has already been changed b=
y
>> the DNAT rule just like the destination address, so this rule must m=
atch
>> on destination port 22, not on the original destination port.
>=20
> So you're saying it needs to be this?
>=20
> $IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
> --dport 22 --sport 1024:65535 -m state --state NEW -j ACCEPT

Correct.

> For now, I've actually got it like this (which is working, but I
> should lock it down):
>=20
> -A FORWARD -p tcp -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

This is much too permissive, it allows any connection through the route=
r.
