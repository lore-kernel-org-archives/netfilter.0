From: Jeff Kletsky <netfilter@allycomm.com>
Subject: [nftables][ipv6] Header examination
Date: Sun, 1 Oct 2017 16:40:14 +0100
Message-ID: <5709c6d1-1f6f-ac3a-2b10-05b3261b496d@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

In reading the nft man page and the wiki, it is not clear if the 
'nexthdr' examines *all* of the header chain, or only the next header in 
particular.

As one specific use case, I would like to block all packets which 
contain next-header values of 43, 135, or 201, no matter where in the 
header chain they occur.

Can someone confirm or deny if the straightforward

    ip6 nexthdr 43 drop

will scan the complete header chain for *any* header 43?

In general, is such a nexthdr search robust to multiple instances of the 
same header type, even such a packet is arguably malformed?  Namely, 
will it scan *all* of the headers that potentially match, including 
further qualification of the match past the header type?



Related is how can I inspect the *contents* of a header and its options?

I don't immediately see a way to, for example, select a packet based on 
it having a specific Router Alert option value set.



I also would like to ensure that Pad1 and PadN options do not harbor a 
backchannel; no payload (looks like 'length' covers part of this), 
padding is all zeros, no more than five bytes of padding, no more than 
one Pad1/N option.  Yes, I realize that such packets are "wrong" -- that 
is exactly why I want to block them.



On a side note -- If anyone else is wondering why the locally generated 
man page isn't being installed, apparently the docbook2x package is 
required or the generation of the man page is silently skipped.



Thanks,

Jeff Kletsky
