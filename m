From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 13:14:53 +0200
Message-ID: <4AA4EB2D.7070600@plouf.fr.eu.org>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in> <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org> <4AA4C3B8.7080309@infoservices.in> <4AA4D05E.5050909@infoservices.in> <4AA4E1AD.4040200@plouf.fr.eu.org> <4AA4E4C1.2030006@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4E4C1.2030006@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

J. Bakshi a =E9crit :
>=20
> 1> how the time stamp is calculated here ? It might be possible to
> generate it through the date command.

I don't know.

> 2> How long these entries are kept at  /proc/net/ipt_recent/ ?

As long as newer data don't need the space. The list works as a FIFO.

> any way to modify that interval ?

You can only set the number of addresses and packets per address with
the module parameters ip_list_tot and ip_pkt_list_tot described in the
iptables manpage.
