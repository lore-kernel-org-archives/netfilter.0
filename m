From: Tom <tom@foscore.com>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 09:31:02 -0400
Message-ID: <be7347ec-4aad-92ea-9c87-925f3cad8c62@foscore.com>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
 <75d06629-de72-651f-4167-82d9a973b442@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662643871;
        bh=JUAbUbdBZ4//r8SpRIcXpSv+VxU7NhhDahf18jmQXnU=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=yQjlZpihyUIU7840vWTnYFeHXUuRMha1ilSx/vK1JGWRaTK8/MiqoKXpfaPYpNwrU
         kDn3cpQ0i6g+uLCk/RIKTrXvi2CqRHfPm3FDs6APGgABnbXdqOYgKaGQuW5vhtlebe
         KU7ZvJ8miAmqETyXxsqpiqIAaDcLNXD7kp4mzNzI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662643863;
        bh=JUAbUbdBZ4//r8SpRIcXpSv+VxU7NhhDahf18jmQXnU=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=q0HkqNovaXg7C2HElRhpMNzSjPRRjBEnonLixbwy1HZpv8/mrhlq2yS8aArdoaVpL
         JL/fXRqtfmww5IfRpBFiZOnLBcuN41dX1umGl0qBCUxmZqp0Y6gKRcpObD+L+mV/vF
         qDmRF0UzvEFnCvsDpAE323keeZO1nV5ulAz0eMs0=
Content-Language: en-US
In-Reply-To: <75d06629-de72-651f-4167-82d9a973b442@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

On 2022-09-08 04:46, Reindl Harald wrote:
> Am 07.09.22 um 17:57 schrieb Tom:
>> Now I'm confused. I'd like to avoid ping floods if possible
> but that makes no sense when doing more harm than good - the knee-jerk reaction kill all icmp is a problem for decades even on IPv4 but will no longer work with IPv6

Who said I wanted to kill all ICMP? Isn't it obvious that I'm trying to write a rule that allows it?

>> but I can't seem to get the syntax right, so:
>> enable ping6 rate limiting without crippling icmpv6, please do!

> one of the responses contained "Please use 'icmpv6 type { echo-request, echo-reply}'"

Yes I saw that. As I pointed out, I can't get the syntax right which specifies type in a set and also limits rates. That's why I dropped rate limits.
  
> why do you make all that so complicated instead write a simple ratelimit rule for ping apply to everyone and *before* have a set which ACCEPTs a specific list of ip's if that's needed at all

OK, sounds good. Perhaps you're under the mistaken impression I'm a NFT expert. Clearly I'm not. Perhaps you could suggest a resource where I might find examples which solve my problem. Better yet, you could provide a practical example. It would be appreciated.

> "I'd like to avoid ping floods if possible" don't scale at all with a manually maintained list of source ips and i can't think of anybody with a justification of more than 5 pings per second

Except they're not source IPs, They are destination IPs. The server has multiple IP addresses. I am not limiting which IPs can ping, I'm limiting which of the server IPs they can ping to.

