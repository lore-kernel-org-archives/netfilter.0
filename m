From: Robert White <rwhite@pobox.com>
Subject: Re: TCP flags syntax in nftables
Date: Thu, 23 Mar 2017 19:43:25 +0000
Message-ID: <a270fb38-5ad2-d3b5-a527-eee85548328e@pobox.com>
References: <CAJRbyBz+ujYaTFbTAMnWnNXcO061upw7-f34BuDnirMzvRkmmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJRbyBz+ujYaTFbTAMnWnNXcO061upw7-f34BuDnirMzvRkmmQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Filipek <bfilipek@betterworldbooks.com>, netfilter@vger.kernel.org

On 03/23/17 12:11, Brian Filipek wrote:
> Hi,
>
> I've done some digging but really can't find a good explanation of the
> syntax for matching TCP flags in nftables. In iptables a rule can be
> written like:
> -A TEST_BADFLAGS -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG_BADFLAGS
>
> How do I do the equivalent in nftables? Also are we still able to use
> the "ALL" and "NONE" keywords?

So a quick preamble. The iptables command and structure didn't include 
basic math support because the engine didn't have any sort of expression 
evaluation.

So in iptables the tow expressions are (first) the mask to bitwise-and 
with the actual flags, then (second) the expected result.

So --tcpflags M R is the same as "if ((packet_flags & M) == R) then"

In nftables you write that out as an actual expression.

So "tcp flags & (syn|fin) == syn|fin"

Which is "fetch tcp flags", make a bitwise or of syn and fin bits, use 
that value as a mask to ingore other bits, now make a bitwise or of syn 
and fin again, finally compare the two values and make sure they are equal.

Now the front-end is going to compile this into "flags & 0x03 == 0x03", 
which is exactly the sort of thing that the iptables match did so WTF 
amirite?

Since the nft system basically introduces a limited mathematical context 
you can use other expressions. Not equal and less-than and so on.

So lets say you want a counter of all the tcp packets with "exotic" flags.

thats "tcp flags ge urg counter"

This will catch any packet with urg, ecn, or cwr set regardless of any 
other flags also set.

So the math context relieves you of the strict equality test in the 
iptables version, but it's a hair more hands-on in terms of knowing how 
boolean expressions work in C-like languages.

--Rob.

