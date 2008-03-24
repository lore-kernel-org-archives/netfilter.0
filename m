From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Disappearing packets
Date: Mon, 24 Mar 2008 12:18:40 +0100
Message-ID: <47E78E10.80102@plouf.fr.eu.org>
References: <1206222481.14091.19.camel@len.t-t-l.co.uk>	 <47E58F01.10800@erentil.net> <1206226655.14091.24.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1206226655.14091.24.camel@len.t-t-l.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

george a =E9crit :
> On Sat, 2008-03-22 at 15:58 -0700, Jon Wilson wrote:
>=20
>>/proc/sys/net/ipv4/ip_forward is set to 1?
> Thanks Jon,
>=20
> I hadn't checked that because I /knew/ that it was set already.  How
> embarrassing...

I wonder how outgoing packets went through without ip_forward set. Did=20
you play with /proc/sys/net/ipv4/conf/*/forwarding ?
