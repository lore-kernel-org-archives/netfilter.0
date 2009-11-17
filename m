From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables/when loading a webpage, get subsequent firewall   block(s)?
Date: Tue, 17 Nov 2009 12:07:16 +0100
Message-ID: <4B0283E4.8010905@plouf.fr.eu.org>
References: <alpine.DEB.2.00.0911140807540.27423@p34.internal.lan> <4AFEF457.6080208@plouf.fr.eu.org> <alpine.DEB.2.00.0911160615450.12141@p34.internal.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0911160615450.12141@p34.internal.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Justin Piszcz a =E9crit :
>=20
> Do you know what would cause a RST for an already closed connection?

My guess would be some kind of stateful firewall because the TTLs are
different.

> Is this normal, do you/others see this as well?

I don't know if it is normal, but I do see it as well.

