From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 13:40:54 -0500
Message-ID: <20180109134054.47146cc3@playground>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
        <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
        <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU w09If1xC029921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1515523261; i=@wpi.edu;
        bh=xYH4MWmX6NO/VE5n0XjrmclsxuheJq0hfvjJy3GcimU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=wuDnIjRkoFyZmsGZW/UxOS3KksylBIyGXdswVICfBD1+Muy+mEggozRAXL1VPlP49
         AtrUb92dBo1xU6S77AiBJSS5UEoN58XIO1mmqsTQHhZ0nomgTgaJjyvAdUapPRkriB
         fSCEcZxdGWo/4rjn8cEsqI62GJKefHVYXuKdecoM=
In-Reply-To: <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Osbourne <dave@osbourne.uk.eu.org>
Cc: netfilter@vger.kernel.org

On Tue, 9 Jan 2018 16:24:50 +0000
Dave Osbourne <dave@osbourne.uk.eu.org> wrote:

> Ah - I looked at that (ipset) - didn't even know it existed...!!
>=20
> I'm getting a lot of resistance from our outsourced IT supplier on=20
> this...=C2=A0 the excuses are variously:
>=20
> * block based on SRCIP being in <insert unfriendly state here> or
> * why don't you migrate to Office365 or
> * don't worry if you patch regularly and have a good passwd policy then=20
> just let the traffic come
>=20
> all completely pointless given the constrains and facts of the case.

I would say lack of awareness is the main reason they resist. The same lack=
 of awareness and the dearth of easy-to-admin firewalls is the main reason =
there are still so many bot nets, so much malware, and so many miscreants a=
round the internet. Another reason is that far too many people believe that=
 end-to-end encryption will solve most of the problems of the internet; but=
 they are wrong. TLS-everywhere has one major drawback; it prevents owners =
of private internets (like you and me) from detecting and blocking malware =
and micreants from crossing our perimeter firewalls. The correct solution i=
s host-to-gateway, gateway-to-gateway, and gateway-to-host encryption; OE w=
ould allow owners and operators of private networks to prevent malware and =
miscreants from entering--and leaving--their networks.

> Does *anyone* have some kind of a reference or best practice for this,=20
> or their own motivation even?

Maybe more than you wanted, but a little knowledge can go a long way. Do th=
ese first thing in mangle:PREROUTING; in short, drop traffic you already kn=
ow you don't want as early as possible in netfilter; waste not one extra CP=
U cycle processing such packets.
  - DROP all INVALID packets; netfilter doesn't know why they arrived nor w=
here they should
    go, so just drop them.
  - Determine countries you *never* want to exchange traffic with and DROP =
packets to and from
    those IPs. But be aware. Sometimes apparently legitimate sites (like al=
ibaba and linux-questions)
    will be blocked.
  - I made a simple mod for Smoothwall Express that automates block sets; i=
t can probably be easily
    adapted for general netfilter use. It uses the Exploited Servers, Chine=
se, Nigerian, Russian
    and LACNIC lists from wizcrafts. The sets are auto-updated daily. I had=
 also used the 90-day
    list from openbl for a while. The problem with some of these blocklists=
 is that they
    occasionally get *too* zealous and block legitimate sites. So I added a=
dmin whitelisting
    capability. And then added admin blocklist capability for completeness.=
 The set of blocklists
    to be used is configurable. It's fairly easy to add parsers for other l=
ist formats.
  - GAR is another Smoothwall Express mod, but is closely tied to Smoothwal=
l; I mention it because
    I think it does almost exactly what you want. It watches snort/suricata=
 alerts and drops
    packets for a period of time to and from any IP that causes an alert. T=
heory: if you see
    someone outside your home checking the locks on your windows, will you =
let him in your front
    door if he knocks? Of course not. So if a host (IP addr) probes your ne=
twork for services that
    don't exist (such as SQL, ftpd, telnetd), or tries a known exploit, don=
't let any packets go
    to or from that IP for some specified period of time.
  - DROP all traffic to and from TEST NET addresses and other address block=
s that should never
    be routed.
  - DROP all internet-side traffic to and from private addresses unless you=
 know that there are some
    private LANs between you and the actual internet.

This should help you to significantly reduce traffic to and from scruffy-lo=
oking sites.

N
