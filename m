From: Andrew Beverley <andy@andybev.com>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 07:51:16 +0100
Message-ID: <1317279076.26402.52.camel@andybev-desktop>
References: <1317248412.26402.39.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317279076;
	bh=EDd4IlPKVLF9qCgh6Q7IUhx1fZlGK3auy2a7jNRcfNw=;
	h=Subject:From:To:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=DKQdzaltVL7AZNB3bgnLbtZl2Rna5+C9BU9hmbZAVSugalP6M1T/W2WEaT+lHZamh
	 u0Jp4J1zV3Pdipn/rN1qdqXzhChvLGdjX78lPvCyPug6StvRQdQ8N6SQ1Ak1YkGKts
	 06e3ZLwzh+ZWYpMjEtmBW8/UYyMnpRA8Dra+KGjA=
In-Reply-To: <1317248412.26402.39.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2011-09-28 at 23:20 +0100, Andrew Beverley wrote:
> Hi,
> 
> I'd like to route locally generated traffic via a particular interface
> based on its mark value.
> 
> From what I have researched, this is theoretically possible and lots of
> people have tried it, but nobody has got it working.
> 
> Here's my rules:
> 
> # Mark the packets
> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
> 
> # Route the marked packets via routing table T2:
> ip rule add fwmark 0x800/0xffff table T2
> 
> # Force T2 packets out of the interface ppp1
> ip route add table T2 default dev ppp1 via 94.30.127.76
> 
> # Flush the cache, just in case
> ip route flush cache
> 
> However, the packets still go out of the default route (ppp0).

I've also added the following, which makes no difference:

iptables -t nat -A POSTROUTING -o ppp1 \
	-j SNAT --to-source 109.224.134.110

And I've done a test with:

ip rule add to 89.16.176.81 table T2

which *does* work.

So, I assume the problem is that the packet is marked too late to affect
the routing. Looking at the packet flow diagram[1] though, there should
be a re-route check after the mangle table, which should re-route if a
packet's mark has changed. Does this feature need enabling?

Andy

[1] http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg


