From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 09:33:34 +0200
Message-ID: <4C6CDE4E.7000609@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6CAA60.60808@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6CAA60.60808@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> Pascal Hambourg wrote:
>> It depends what "traffic" means. Ethernet frames, no. IP packets, ye=
s=20
>> if the box also acts as an IP router between the bridges.
>=20
> I took Jonathan's comment to be referring to ethernet frames.

Me too, but I wanted to be more general.

> Even if the box is acting as an IP router between the bridges, I view=
=20
> that as an operation that is happening out side of the bridge(s).

Of course.

> The same thing can be said about two switches that have a router betw=
een=20
> them.

Or one L3 switch with two port-based VLANs. Packets should not leak
between VLANs unless they're routed.
