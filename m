From: =?UTF-8?Q?=c3=98yvind_Kaurstad?= <oyvind@dynator.no>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Mon, 3 Jul 2017 01:20:30 +0200
Message-ID: <81cc9e0e-e82b-557a-8c2f-113ea8c6a1cd@dynator.no>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
 <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
 <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
 <a7ef1ff2-4bd7-1f56-c127-e8f30ea05952@plouf.fr.eu.org>
Reply-To: oyvind@dynator.no
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a7ef1ff2-4bd7-1f56-c127-e8f30ea05952@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>> but it still seems to me I need to leverage the connection tracking
>> with packet marking to be able to ensure the reply packets that should
>> go back out a non-default route actually does that.
> 
> I'm afraid so, unless you can add a second IP address to the target device.

The target device is usually a device that I have no control over, and 
in many cases it can be a device that doesn't even have the capability 
to have multiple IP addresses on the physical interface.

So I'll have to treat it as a one-address blackbox.

Still feeling quite happy now, because quite a few lessons has been 
learned about the inner workings of routing (and 
netfilter/nftables/iptables) in Linux, so I will be better equipped to 
tackle future requirements for my device (and other Linux-based devices).

For others that read this later on, while there are lots of docs on 
nftables/netfilter, I came across this one as particularly useful:

https://pelican.craoc.fr/

I can't attest that it is correct in all aspects, but I liked the 
diagram he drew based on the tests he did.

