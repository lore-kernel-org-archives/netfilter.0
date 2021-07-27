From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Dropping UDP packets to port 53 containing known domain string?
Date: Tue, 27 Jul 2021 07:09:11 +0100
Message-ID: <8900c969-32f9-00c1-b78d-bc84b7381034@plushkava.net>
References: <6bf250e7-e0ba-43f2-6e35-c858e85db41c@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=s
        kjkN5/23rVcfRKSH43BNozXH7Of7MLggJEeZU3RHvE=; b=QZGfknpd8VJlLbWvi
        H6NU6Sx/RhK3lNsYnGA866+KahCcSGvDBKCa/RQMnacRwVVhbj4tygxZAIaqrzo1
        1+jNEeM38Kui/qyWLc17vgIwv7W+4ZngsEG8liCX7YLgRa8XgTG/ookMVG9o+rKY
        dQRWijzFSpzRjJmQw42av+z4YnXWipsuNIkzSfyGKsNoMzj7K+RN+2NrH+03gZFg
        sUPhp7eTYvANJWKXDHBbR/FZd6wz+m+ewDIy4aDIiY+4AOXPQpS2eWZsGmvict95
        Ub4hRer3rutVr4CfwOy4wXv+HWm+b89w3cnLiEuJTLza6GNyCSzFd4fGrwZYPKwm
        16TCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=skjkN5/23rVcfRKSH43BNozXH7Of7MLggJEeZU3RH
        vE=; b=KVpCmNp6PqYoEEQLZhrFaUFuIOG01ZpGku+s9QvY0RhUXcnREng7/nP2T
        oeCRLHPEBVC7ecXzE9AUOdR/+UodrbnVrvLOzk0+QZWW9pUFS4sEJwrk11NCVyHr
        yHpLZ8LW3C5bb6cTFO2jBBvZ12H/KzoYo2I1BGFTXg+MsaMz1T+7m+cplRNNle+c
        MDBQfENY4vMcdOPrfxfox1ZqK439uebnil8HSklP1rm00tp9l9eHAhGJY0wiSP2J
        xkfBa2dTwyBlSOTHR+E06wp2BHUzKkqQV0YxxW7IusDZex3a/mAm+fU3VfEsJjTS
        KXxWiIuQorP0AXIe2JuzBFrg5yfMg==
In-Reply-To: <6bf250e7-e0ba-43f2-6e35-c858e85db41c@foscore.com>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom <tom@foscore.com>, Linux Netfilter Users List <netfilter@vger.kernel.org>

On 27/07/2021 02:43, Tom wrote:
> If you run a DNS server you've likely come across lots of requests for 
> RRSIGs of pizzaseo.com. It's a DDOS attack that's been going on for 
> years, off and on. Currently it's on, and how! Thousands of requests an 
> hour for weeks now on all 3 of my DNS servers. Instead of using fail2ban 
> to block the offending IP addresses, I want to drop the packet before it 
> gets to the DNS server.
> 
> I know there is a way for nftables to examine table header strings of 
> UDP packets using something called a "raw payload expression". You need 
> the hex equivalent of the string, and the beginning and end offsets of 
> the string, for example:
> 
> meta l4proto udp udp dport 53 @th,160,120 
> 0x0970726f787970697065036e657400 counter drop comment "block queries for 
> proxypipe.net"
> 
> If I wanted to block pizzaseo.com (and I'm far from alone in this 
> request!), how do I convert that string to a 0x string? How do I check 
> that I have the right start and offset? How would I debug such a rule?
> 
> Thanks in advance!

Let us begin with `tcpdump -n -s0 -X udp port 53`. Here is the payload 
of an offending query, including the encapsulating IPv4 header.

0x0000:  4528 003a bb51 0000 f211 3319 4bad 43f9  E(.:.Q....3.K.C.
0x0010:  c422 8657 0035 0035 0026 0000 0001 0100  .".W.5.5.&......
0x0020:  0001 0000 0000 0000 0870 697a 7a61 7365  .........pizzase
0x0030:  6f03 636f 6d00 002e 0001                 o.com....

In this case, the IPv4 header is 20 bytes long, with the UDP payload 
thus beginning at offset 20, or 0x14 in hex.

$ printf '%x\n' 20 # decimal to hex
14

Note that the first two words following from this offset each have a 
value of 0x35, indicating a source and destination port of 53.

$ echo $(( 0x35 )) # hex to decimal
53

At offset 0x28, an interesting payload of 13 bytes worth is observable.

08 70 69 7a 7a 61 73 65 6f 03 63 6f 6d
     p  i  z  z  a  s  e  o     c  o  m

Note that the first value of this sequence is 0x08, denoting that the 8 
characters of "pizzaseo" follow. Likewise, 0x03 for the three letters of 
"com".

Knowing that the length of the captured IPv4 header must be subtracted 
from the observed offset of 0x28, that the payload to be matched is 13 
bytes in length, and that there are 8 bits in a byte, we are now in a 
position to perform the necessary calculations.

# printf '@th,%d,%d\n' $(( (0x28 - 20) * 8 )) $(( 13 * 8 ))
@th,160,104

All that remains is to incorporate this into a rule, along with the 
necessary hex sequence to be matched.

udp dport 53 @th,160,104 0x0870697a7a6173656f03636f6d counter drop

Ideally, you would debug such a rule by having your DNS server log the 
manner in which it is responding to these requests. For example, I 
operate an authoritative BIND server that does not honour recursive 
queries issued by the general public. In the case that a query is 
refused, BIND logs a message to that effect. After adding the rule, I 
could see that no new messages pertaining to pizzaseo.com were being logged.

-- 
Kerin Millar
