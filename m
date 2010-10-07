From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to best limit "rate of rejects"
Date: Thu, 7 Oct 2010 21:40:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010072135260.17644@obet.zrqbmnf.qr>
References: <20101006142149.95231l9rz87p044g@webmail.physik.uni-muenchen.de>  <alpine.LNX.2.01.1010061444180.21694@obet.zrqbmnf.qr> <1286476201.3383.48.camel@fermat.scientia.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1286476201.3383.48.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter@vger.kernel.org

On Thursday 2010-10-07 20:30, Christoph Anton Mitterer wrote:

>Hi Jan.
>
>On Wed, 2010-10-06 at 14:45 +0200, Jan Engelhardt wrote:
>> > Is there some smart way to just limit the rate on those rejects? e.g. something
>> > like a "wait with sending the reject for a second" target?
>> 
>> -m hashlimit --hashlimit 1/second
>
>Which one do you mean (just --hashlimit seem to not exist).

--hashlimit is a backwards-compatible alias for --hashlimit-upto.

>And as far as I understand the documentation, this is the same as limit,
>and it's just for matching,...

hashlimit offers more possibilities (at the cost of a bit of computing 
of course), such that there is only one hashlimit configuration of many 
that mirrors limit's behavior, which is when using --hashlimit-mask 0 
--hashlimit-mode whateverpickone.

>so if the rate is exceeded the rule would
>simply no longer match and I'd have again such a packet burst?

You asked for reply rate reduction. So

 -p tcp --dport 23 -m hashlimit --hashlimit 1/s --hashlimit-mode srcip 
	--hashlimit-mask 24 -j REJECT
 -p tcp --dport 23 -j DROP

will cause no more than one ICMP unreachable to be emitted per second 
for all the telnet attempts coming from an exemplary /24 netblock.
