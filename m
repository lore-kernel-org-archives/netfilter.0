From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables: unknown protocol "!" specified
Date: Sun, 22 Nov 2015 09:18:56 +0100
Message-ID: <56517A70.4020001@plouf.fr.eu.org>
References: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Roger Price <roger@rogerprice.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Roger Price a =E9crit :
>=20
>   Explanation ... This match can also be inversed with the !
>   sign, so --protocol ! tcp would mean to match UDP and ICMP.

No, it means to match anything but TCP. There are many other protocols
than TCP, UDP and ICMP.
