From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: ebtables & VLAN redirect
Date: Mon, 28 Jun 2010 20:33:13 +0300
Message-ID: <AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
	<4C262DA2.1040103@riverviewtech.net>
	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
	<4C2805A3.4070801@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=cgukX1xpFP9mROvhJP+vm9EbQ4a9fopCJjDtfXncZos=;
        b=ajxqCukJIcdHX1o47+0++QUAw11oyDMO7KjdaDYhJ1SZz7xr06raY4xt6QBNVPSef0
         T9bgyz0B172702KPSczEQGxpGL1G55lgTRu7lIRh11YbkvxerVAEuij92q1vJfDtHal8
         htxrRRs5lnxoNox4S9/KtwvxTvEDcRreikMm4=
In-Reply-To: <4C2805A3.4070801@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/28 Grant Taylor <gtaylor@riverviewtech.net>:
> Will you please provide an example of what redirection you are talkin=
g
> about?

Unfortunately, I have a set of tasks to cope with.
1. UDP broadcast relaying for specific ports from specific VLANs - on
second thought I've decided to use udp-broadcast-relay as it's the
simplest way.
2. Multicast feeding and IGMP exchange snooping - I tried to avoid
using igmpproxy but probably I should use it.
3. Mirroring specific sessions to VLAN 9 - and I can postpone this
task for the future.

>
> Remember that you can set a default policy of DROP in your BROUTING c=
hain to
> cause the packets to be routed like normal. =A0So any frames that you=
 don't
> want bridged will simply be routed like normal. =A0There by only brid=
ging the
> frames that you want to.

Yes, I knew about it - very nice feature.

>> That would work but I need to redirect traffic that is not destined =
to
>> VLAN 9 and ARP-proxy trick does not work for this case.
>
> So you are going to have to intercept the traffic and alter the desti=
nation
> MAC (and possibly IP) address(es)?

=46or mirroring purpose I have to alter destination MAC and I can do
that in POSTROUTING chain.
Other tasks use broadcast/multicast destination addresses so I do not
need to alter them.

>
> I believe that EBTables can do that. =A0If not, you can probably have=
 IPTables
> work on bridged frames, and I know that it will do that.
>
> I'm still not sure that you can't do what you want to do with EBTable=
s and /
> or IPTables.
>
> Remember that EBTables will learn where MAC addresses are and won't f=
lood
> frames out (go in to dumb hub mode).
>
> I don't think you will be bridging too many packets. =A0(That is unle=
ss I
> really misunderstand what you are wanting to do.)

Bridging is a good idea, but its current implementation lacks some
features important to me - as impossibility to limit traffic
directions between bridge devices and the fact that a network device
can belong to one bridge only.

>
> Can you provide an example (sanitized if need be) of what you are try=
ing to
> do? =A0Including (hypothetical) source and destination MAC and IP add=
resses on
> either side of the bridge?

In two words :). All user VLANs(eth1.100-eth1.200) have IP belonging
to one subnet( but sometimes to other ) and they can communicate each
other by using proxy-arp trick under control of the router. And now I
need to extend capabilities of this communication as I stated above.
Owing to talking with you and thinking on the problems I understand my
tasks clearer.
Grant, thank you for your support.

--=20
Best regards
Anatoly Muliarski
