From: zrm <zrm@trustiosity.com>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Mon, 3 Jul 2017 14:07:23 -0400
Message-ID: <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
 <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1499105242; bh=fz7seTsxpTebFUsSw2binIC+m8u3taBr0znO1kYY604=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=t7CnKD2DetVQe+raustqk7SGfR7ALvqcFkY3dGDSs+56RU6kuQCVPBEr1EBKGFVk/
         XrrWbXagqlcTzU9QOUlJodldHbqo9FC90OpewcZKdQVkl/6CrcN9I5ZvofVIw6jkZj
         IoY7BdnVC0ie/+cnPyMfd617H1kjwjOMb0JQTtvE=
In-Reply-To: <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert White <rwhite@pobox.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The hairpin issue is unrelated to the original one so I'll change the 
subject line to separate it.

On 07/01/2017 07:50 PM, Robert White wrote:
 > On 07/01/2017 10:17 PM, zrm wrote:
 >> On 07/01/2017 04:26 PM, Robert White wrote:
 >>> So, for instance, once you DNAT the incoming packet you _don't_ want to
 >>> SNAT it.
 >>
 >> What about hairpin NAT?
 >
 > As stated, you really want to do local services by adjusting the DNS
 > unless it's impossible.
 >
 > Sure, you can do hairpin NAT, but it's usually just a bad design since
 > it doubles the network traffic on the one interface.
 >

In my case I have a Port Control Protocol daemon so I'm stuck with it. 
The client software will often fail for internal peers without hairpin 
and is written by numerous independent third parties.

 > If you want to put the service at a common public IP address and leave
 > it that way, putting your server on a dogleg/spur is already a much
 > better idea anyway.
 >
 > Why?
 >
 > (...reasons...)
 >

Unfortunately that doesn't get me out of it. My daemon has no control 
over the physical topology of the user's network, and the internal hosts 
increasingly _are_ the public-facing hosts. People want to map ports for 
games, VoIP, IPFS, etc.

If you had to put anything that wanted to map any port into the DMZ then 
most everything would be in the DMZ. :)

I feel like isolating public services has always been backwards anyway. 
An internal network with hard shell with soft middle means that one 
compromised internal device becomes a big fire.

And the modern trend has been for devices to offer public services even 
without mapped ports, by making outgoing connections to a server that 
forwards back incoming messages. Everything from Facebook and YouTube to 
VPNs and Tor is doing this now. It's no different fundamentally from 
mapping a port except that now everything appears to the router as 
outgoing TLS or ssh rather than separate ports for different services 
that could previously have been used to decide whether to pass traffic 
or not. So you have to assume everything has public services.

The only answer now is for the endpoint devices to secure themselves 
even against other internal hosts, because only they know what the 
traffic really is. (One could argue it should have been that way the 
whole time.)

The place for externally-imposed network isolation is the naive legacy 
systems that don't do that properly so they have to be protected from 
potentially compromised internal hosts that have no business with them.

 > If you do hairpin, you still don't need to mark any packets or anything.
 > You just use the SNAT/MASQUERADE rule with highly restricted matches
 > just for the hairpin server.
 >
 > An example culled from the internet:
 >
 > -A PREROUTING -d 89.179.245.232/32 -p tcp -m multiport --dports
 > 22,25,80,443 -j DNAT --to-destination 192.168.2.10
 > -A POSTROUTING -s 192.168.2.0/24 -o ppp0 -j MASQUERADE
 > -A POSTROUTING -s 192.168.2.0/24 -d 192.168.2.10/32 -p tcp -m multiport
 > --dports 22,25,80,443 -j MASQUERADE

That requires knowing which address ranges are internal or not, which I 
don't.

What I have currently is something like this:

-A PREROUTING -p udp -d 2.2.2.2 --dport 3456 ! --in-interface external0 
-j MARK --or-mark ${HAIRPIN_MARK}
-A PREROUTING -p udp -d 2.2.2.2 --dport 3456 -j DNAT --to-destination 
10.2.2.2:3456
-A POSTROUTING -m mark --mark ${HAIRPIN_MARK}/${HAIRPIN_MARK} -j SNAT 
--to-source 2.2.2.2

This seems to do the job, but I would prefer not to use marking in a 
daemon like this because it's too easy for the administrator to not 
expect it and then use the same mark for something else.

What would be perfect is to have a rule in POSTROUTING with "! 
-in-interface external0" but --in-interface is not allowed in POSTROUTING.

So the question remains is whether it's possible to get the same effect 
without marking.
