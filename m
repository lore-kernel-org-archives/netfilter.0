From: Ed W <lists@wildgooses.com>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 09:37:43 +0100
Message-ID: <4F8BDA57.4090701@wildgooses.com>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@vger.kernel.org>

On 16/04/2012 09:08, Jozsef Kadlecsik wrote:
> Hostname and IP address are both supported as input and resolved
> internally by getaddrinfo. That can generate DNS lookups, depeding on the
> resolver library. What kind of system do you use, with which
> resolver/libc version?

Thanks so much for replying!

This is a uclibc 0.9.33.1 system, x86. Resolver chain is /etc/hosts, 
then dns. Local dnsmasq is installed.

I can very clearly observe that on something like "ipset add", if I add 
something that isn't quite an IP address then it generates a name 
lookup. What I'm confused by is why the reverse ip lookup for the ip 
address?  I have traced it back I think to the parser.c code, but I 
concede I'm stuck understanding even what is generating the lookup?  You 
mention resolver, so presumably it's a side effect of some other call, 
but could you spare a minute to explain the trigger please?  (just 
interested in the background in case it occurs elsewhere?)

> I could suppress DNS lookups with the price of calling twice getaddrinfo.

You are presumably giving me a clue as the source here!

It would not appear to be a significant performance decrease for the 
normal situation to call twice?  Given the outside edge case of 1+ min 
delays I'm definitely interested in such a change?

Is there any chance of a tentative patch or at least a stronger hint at 
what I should change in order that I could deploy something quite 
imminently?  Its become a bit of a blocker here...  Obviously I'm asking 
with as much icing as possible and a huge cherry on top...

Thanks Jozsef

Ed W

