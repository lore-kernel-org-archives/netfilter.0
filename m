From: =?UTF-8?Q?=c3=98yvind_Kaurstad?= <oyvind@dynator.no>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Mon, 3 Jul 2017 01:09:00 +0200
Message-ID: <66f644e4-81fd-140d-c242-989baec01d8a@dynator.no>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
 <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
 <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
 <5e96bc48-550c-4ec1-e0c4-5a929a456012@pobox.com>
Reply-To: oyvind@dynator.no
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5e96bc48-550c-4ec1-e0c4-5a929a456012@pobox.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>> My device is not meant to be a system (or full blown) router per se. It
>> is a specialized custom device that for some cases needs to be able to
>> act as a router. It does not act as a DNS server, and in most cases
>> there will be other routers in the system (at least on the eth0 network,
>> and my device is usually set up as a DHCP client on eth0).
> 
> That's as "router-ish" as routers get. Don't think of it as "not a
> full-blown router". It may be expected to only have a light packet load
> but that doesn't make it anything less than a router.

I get what you're saying, and I don't really disagree, it's just that on 
this device there's still quite a few things missing (on purpose) that a 
"full blown" router has. Hence I said what I did.

> First I am going to juggle your addresses a little to get your device
> (and all of eth1), that is the inner protected network ("PRO") out of

<detailed explanation snipped for brevity>

Thanks for writing down all of that. It is useful, even though I 
actually had most of it down working already. As also mentioned in the 
subject, the real point of this thread was to find out if packet marking 
is actually the best/easiest way to solve my problem, and both you and 
others have confirmed that now.

I'm also using nftables (as mentioned in the OP), so the rules you used 
in iptables are different than mine. The principles are the same though 
(and netfilter is of course still the underlying framework), so your 
answer is still useful as a guide to where and when.

I've struggled with this for quite some time, and it is a relief to 
finally have a better grip on it.

> Again, apologies. Being told I missed "something" wasn't as helpful as
> being told what thing I missed. /D'oh

No apologies needed. You've been very helpful, to misunderstand is only 
human.  :-)
