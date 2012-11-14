From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 17:38:50 +0200
Message-ID: <50A3BB0A.9070301@ngtech.co.il>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr> <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com> <alpine.LNX.2.01.1211141055040.4653@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1211141055040.4653@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: =?ISO-8859-1?Q?J=F6rn_Krebs?= <jk@smartbyte.de>, netfilter <netfilter@vger.kernel.org>

Or instead just use DNAT with specific ports that will allow any other 
traffic from this host to others based on basic NAT what called 
"port-forwarding"

Regards,
Eliezer

On 11/14/2012 1:23 PM, Jan Engelhardt wrote:
> #  <-> both ways
>
> First, you only used one MASQUERADE rule, which says to establish a
> mapping 192.168.1.38:P <-> 114.XX.234.123:Q, if and only if,
> 192.168.0.0/16 is the src address on the initiating packet. This is
> not the case for that <122.XX.115.203:10020->114.XX.234.123:44608>
> packet of yours.
> In weird Wikipedia terms, nf_nat implements "Cone NAT" exclusively.
>
> There are two ways here.
>
> 1.
> `modprobe nf_nat_sip` and see if that yields the desired result.
>
>
> If not,
>
> 2.
> To get the "1:1 NAT", you will need to add a "second" cone in the
> other direction, so to speak. This is then something like
>
>   iptables -t nat -A PREROUTING -i internet [-d 114.XX.234.123] \
>            -j DNAT --to 192.168.1.38
>
> As you no doubt will notice, this makes the router as a host
> inaccessible on 114.XX.234.123, but that's what 1:1 means.
>
> HTH.

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
