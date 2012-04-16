From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: ipset causes reverse dns lookups?
Date: Tue, 17 Apr 2012 01:08:59 +1200
Message-ID: <4F8C19EB.4070803@treenet.co.nz>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com> <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Ed W <lists@wildgooses.com>, netfilter <netfilter@vger.kernel.org>

On 16/04/2012 9:55 p.m., Jozsef Kadlecsik wrote:
> On Mon, 16 Apr 2012, Ed W wrote:
>
>> On 16/04/2012 09:08, Jozsef Kadlecsik wrote:
>>> Hostname and IP address are both supported as input and resolved
>>> internally by getaddrinfo. That can generate DNS lookups, depeding on the
>>> resolver library. What kind of system do you use, with which
>>> resolver/libc version?
>> Thanks so much for replying!
>>
>> This is a uclibc 0.9.33.1 system, x86. Resolver chain is /etc/hosts, then dns.
>> Local dnsmasq is installed.
>>
>> I can very clearly observe that on something like "ipset add", if I add
>> something that isn't quite an IP address then it generates a name lookup. What
>> I'm confused by is why the reverse ip lookup for the ip address?  I have
>> traced it back I think to the parser.c code, but I concede I'm stuck
>> understanding even what is generating the lookup?  You mention resolver, so
>> presumably it's a side effect of some other call, but could you spare a minute
>> to explain the trigger please?  (just interested in the background in case it
>> occurs elsewhere?)
> That comes from the implementation of "getaddrinfo" in uclibc then. ipset
> itself does not force reverse DNS lookups.

FWIW, I have recently been dealing with user complains with other 
software when built with uclibc. The uclibc implementation has been 
caught ignoring AI_NUMERICHOST and performing full remote resolution 
when passed numeric IPs for conversion.

AYJ
