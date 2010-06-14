From: Federico Alberto Sayd <fsayd@uncu.edu.ar>
Subject: Re: Force traffic
Date: Mon, 14 Jun 2010 10:17:34 -0300
Message-ID: <4C162BEE.5010807@uncu.edu.ar>
References: <4C1513F3.5010508@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1513F3.5010508@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

El 13/06/10 14:22, Jonathan Tripathy escribi=F3:
> Hi Everyone,
>
> Does anyone know any rules that I could use (using iptable, ebtables,=
=20
> or otherwise) that could force all traffic coming from an interface t=
o=20
> go out via a particular interface? I'm using Xen and all the DomUs=20
> ("VMs" or "Guests") are connected to a linux bridge. I wish to force=20
> all traffic from these VMs to go out via the interface which is=20
> connected to my firewall (which itself is a filtering bridge). I wish=
=20
> to do this all at the "link-layer" if possible.
>
> I am lead to believe that in a linux bridge, all frames are sent to=20
> all ports (a bit like the old-school hubs), so it could just be a=20
> matter of blocking all traffic, except those which are for the=20
> firewall interface, using ebtables.
>
> Any help is very much appreciated.
>
> Thanks
>
> Jonathan
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
 From iptables man:

    physdev
        This  module  matches on the bridge port input and output=20
devices enslaved to a bridge device. This module is a part of the=20
infrastructure that enables a transparent bridging IP firewall and
        is only useful for kernel versions above version 2.5.44.

!] --physdev-is-out
               Matches if the packet will leave through a bridge interf=
ace.



May be this module can be useful for you


