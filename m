From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: How can I test my tc script?
Date: Fri, 04 Feb 2011 15:22:07 +0100
Message-ID: <4D4C0B8F.10005@unipex.it>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless> <20110203120131.38cd818d@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203120131.38cd818d@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: wilson@optimumwireless.com, netfilter@vger.kernel.org

Marek Kierdelewicz ha scritto:
>> Hello.
>
> Hi,
>
>> I recently wrote a script that adds a new rule for an ip address
>> each time a new user is added to our network. I've noticed my tc
>> rules work ... Our network has about 120 users in total not all of
>>  these get connected Are these rules ok?
>
> If you have such linear ruleset (iptables marking+tc filter) for 120
> users then it's will not work well. If my theory is right, check top
> when there are more users logged in. You'll probably see hi cpu usage
> in "si"/"hi" (software/hardware interrupt) fraction.
>

I, are you sure about the big difference?
I agree with you about tc u32 filters are better than iptables +
marking, but like now I have about 100mbit 1k+ users with
mangle+classify and tc+htb+egress and I have a load at about 0.2.
My cpu are xeon 2.6 quad.

In my experience, instead, I see that nic can make big differences about
throughput

Michele
