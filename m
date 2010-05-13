From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: chain/table traversal for loopback packets
Date: Thu, 13 May 2010 21:52:35 +0200
Message-ID: <4BEC5883.6000309@plouf.fr.eu.org>
References: <AANLkTikgvzyLOesxU5RNb3MmEPPMsnotOj-oZcWGlkuT@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikgvzyLOesxU5RNb3MmEPPMsnotOj-oZcWGlkuT@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

Hello,

Curby a =E9crit :
> Hello, I'm trying to understand
> http://www.frozentux.net/iptables-tutorial/images/tables_traverse.jpg
>=20
> Would a packet created locally and sent over the loopback interface
> traverse the POSTROUTING and PREROUTING hooks as implied by the
> diagram,

Yes. However be aware that the nat/PREROUTING chain is skipped even for
the first packet of a new connection because at that stage the
connection is already confirmed. Thus destination NAT must be performed
in OUTPUT.

> or does the last Routing Decision notice that it's bound for
> the local host and send it straight to the beginning of the INPUT
> hook?

No.
