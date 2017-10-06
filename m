From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why I can not use physdev module on iptables POSTROUTING chain?
Date: Fri, 6 Oct 2017 22:15:38 +0200
Message-ID: <76c1045f-3e80-547f-0b75-bf35a8ede463@plouf.fr.eu.org>
References: <CAK6Qs9=1tbQJ2ds2QTTt0SfSNX6_OvFX_S=2S41kHgO=xim3=w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAK6Qs9=1tbQJ2ds2QTTt0SfSNX6_OvFX_S=2S41kHgO=xim3=w@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?=c4=b0brahim_Ercan?= <ibrahim.metu@gmail.com>
Cc: netfilter@vger.kernel.org

Le 06/10/2017 à 10:25, İbrahim Ercan a écrit :
> I have a bridged topology and want to match bridge interface on
> mangle/POSTROUTING chain.
> 
> I can add a rule like this.
> 
> iptables -A POSTROUTING -t mangle -m physdev --physdev-in enp0s3

Don't you mean --physdev-out ? According to the man page, --physdev-in 
works only in the PREROUTING, INPUT and FORWARD chains.

> Then I figured out packets aren't matching and I saw this warning on dmesg.
> 
> xt_physdev: using --physdev-out in the OUTPUT, FORWARD and POSTROUTING
> chains for non-bridged traffic is not supported anymore
> 
> Then I just tried "-o enp0s3" and that didnt work either.

-o matches the bridge (master) interface name, not the bridge port name.

> I wonder why this feature isnt suported anymore?

The rationale was described in 
Documentation/feature-removal-schedule.txt in Linux 2.6.18 source :

=======
What: Bridge netfilter deferred IPv4/IPv6 output hook calling
When: January 2007
Why:  The deferred output hooks are a layering violation causing unusual
       and broken behaviour on bridge devices. Examples of things they
       break include QoS classifation using the MARK or CLASSIFY targets,
       the IPsec policy match and connection tracking with VLANs on a
       bridge. Their only use is to enable bridge output port filtering
       within iptables with the physdev match, which can also be done by
       combining iptables and ebtables using netfilter marks. Until it
       will get removed the hook deferral is disabled by default and is
       only enabled when needed.
=======

Note that this change happened in 2006 and only affects non bridged 
traffic, i.e. packets which are sent to a bridge interface. It does not 
affect bridged traffic, i.e. packets received on a bridge port and 
forwarded to another port of the same bridge.

> And Is there a way that I can match by interface on POSTROUTING if I
> have a bridged topology?

If the packets are really bridged, then your failure to match by the 
output bridge port is not related to the above change.
If the packets are just sent to a bridge interface, then you can combine 
netfilter marks and ebtables as indicated above.
