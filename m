From: Jerry Vonau <jvonau@shaw.ca>
Subject: Re: Why does ipv6 addresses appear when loading a module?
Date: Sun, 11 Nov 2007 15:42:29 -0600
Message-ID: <47377745.2090702@shaw.ca>
References: <4736A97E.8070604@shaw.ca> <4736E313.70804@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4736E313.70804@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Amos Jeffries wrote:
> Jerry Vonau wrote:
>> Hi All:
>>
>> I'm not subscribed to the list, please cc me on any replies please.
>>
>> While playing around with the latest fedora, think I found an issue with
>> a netfilter module. I run my boxes with ip6 disabled, you know, don't
>> run what is not needed. I couldn't figure out why I was seeing ipv6
>> addresses on my interfaces, and ipv6 module was loaded when I know that
>> I disabled ipv6 in modprobe.conf and sysconfig/network. For my netfilter
>> needs I use shorewall, which loads the module nf_nat_h323, which loads
>> the nf_conntrack_h323 module, and that loads ipv6! Once ipv6 is loaded,
>> you can't rmmod it and ipv6 addresses are assigned to the interfaces.
>> I've disabled the loading of those modules and the ipv6 addresses don't
>> occur. My question is this the intended behavior for this module?
>>
>> Thanks in advance,
>>
>> Jerry
> 
> Why are you so resistant to IPv6?

I'm not, just not ready for it yet, I need a better understanding.
> 
> Addresses should only start occurring if the network the machine is
> attached to is IPv6-enabled and active. When that happens ::1
> (localhost, actually less dangerous than 127.0.0.1) is assigned, but
> only the IPv6-connected interface gets an actual 2000::/3 public
> allocation to use.
> 
Ah, the fe80 that I saw was more or less the same as a zeroconfig
address, and is not really reachable, except for connections on the same
 wire. That could still cause a problem for someone.

> You appear to be in the perfect position to make the transition now and
> painlessly. By forcibly disabling it you are making yourself come back a
> a few months and re-enable it all piece-by-piece.
> 
I don't think editing 2 files is that much work.

> You would do better to leave it, and just configure the FW through
> ip6tables.
>
Shorewall blocks ipv6, if that option is set.

> Amos
> 
That really doesn't explain why a module could override a user/admin's
wish to disable ipv6.

Jerry
