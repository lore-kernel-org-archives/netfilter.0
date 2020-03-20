From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables 0.9.3, sets with concatentation
Date: Fri, 20 Mar 2020 12:41:49 -0400
Message-ID: <4220067c-41e2-d3e2-fc78-8ac0fb909911@fhmtech.com>
References: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=7Ln833WwtKnsytW5M78fBBA73u6tnWv4RJKPEaGwTKQ=;
        b=lbZK0mJpONOVctepU+Rs6/N+FhGoOpoT5mxf72IYroATpxGTVBNu/AoynzblZUbgAot+5ohkNq09wYm7Jiht3ebnpjgtti9+YksHRLsNYRZ31n87RvwbDItdSkMhwslzWN8NZvkQjAWnZFTnecx3B6Qsoj73ZA7SYnYijA8d2Hk=;
In-Reply-To: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On 2020/03/20 11:51, Stefan Hartmann wrote:

> For the sake of a well-arranged ruleset,
> it would be nice to have a concatenated set like
>      set s4_MISC-SERVICES {
>          type inet_proto . inet_service
>          elements = { udp . 69, tcp . 23 ]
> 
> and then use this set like
>      ip daddr $IP4_IF2 . dport @s4_MISC-SERVICES accept
> 
> But I got a syntax error "unexpected dport".
> 
> With eg ip daddr $IP4_IF2 . udp dport @s4_MISC-SERVICES accept it is 
> working, but this is here useless for simplyfying.
> 
> What is the right syntax or is the mixing of udp and tcp in this manner 
> impossible?
> Is there a better approach to get the abstraction from a group of 
> services into a mixed tcp udp ruleset?

Hi Stefan,

Interesting problem. A simple approach would be to use 2 rules, one for 
udp services and one for tcp services.

But I get that you'd prefer to handle both in a single rule.
The man page suggests a solution: use the raw payload expression:
https://www.mankier.com/8/nft#Payload_Expressions-Raw_Payload_Expression

I'm unsure of exactly the match you're after, because in your example
set s4_MISC-SERVICES type is inet_proto . inet_service
but then you try to match against ipv4_addr . inet_service

If you in fact want ipv4_addr . inet_proto . inet_service
it looks like this should work:

set s4_MISC-SERVICES {
           type ipv4_addr . inet_proto . inet_service
           elements = { $IP4_IF2 . udp . 69, $IP4_IF2 . tcp . 23 ]

meta l4proto {tcp, udp} \
	ip daddr . meta l4proto . th dport @s4_MISC-SERVICES   accept


Or, you may well want to handle ipv4 addresses in a separate set:

set s4_MISC-SERV2 {
	type inet_proto . inet_service
       	elements = { udp . 69, tcp . 23 ]

set ip_allowed {
	type ipv4_addr
	elements = { $IP4_IF2 }

ip daddr @ ip_allowed   meta l4proto {tcp, udp} \
	meta l4proto . th dport @s4_MISC-SERVICES   accept


The apparently redundant meta l4proto {tcp, udp} in both versions above 
is because the man page notes you must take care not to use raw match 
without verifying the actual type of packet.


Disclaimer: I am an nftables newbie, and have not tried the above. But 
enjoyed taking a stab at it. Let us know if it works. :-)

Best regards,
Frank
