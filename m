From: Andrew Beverley <andy@andybev.com>
Subject: Routing locally generated traffic on fwmark
Date: Wed, 28 Sep 2011 23:20:12 +0100
Message-ID: <1317248412.26402.39.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317248413;
	bh=CylptqricHpP2cX9rKhrk8Bseb1/bt7WJUi4zGlrVq8=;
	h=Subject:From:To:Content-Type:Date:Message-ID:Mime-Version:
	 Content-Transfer-Encoding;
	b=cF/0frk5rLu+0GCTlGQrBh2gRue7TGPewNLWEzYof8JAonG56ppdTwEhduKFWQO5j
	 VcEd69d1Hfw/CkKXQ3vyHm0OuC7NwWTrM4lv0uSmjYSPVHSvwZtX4AccY3xd95ndHo
	 Z7OOsm5L4LVJA4bqX69h7slBdtgzvQQl/+7E2Gds=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'd like to route locally generated traffic via a particular interface
based on its mark value.

From what I have researched, this is theoretically possible and lots of
people have tried it, but nobody has got it working.

Here's my rules:

# Mark the packets
iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800

# Route the marked packets via routing table T2:
ip rule add fwmark 0x800/0xffff table T2

# Force T2 packets out of the interface ppp1
ip route add table T2 default dev ppp1 via 94.30.127.76

# Flush the cache, just in case
ip route flush cache

However, the packets still go out of the default route (ppp0).

cwdwr:~# ip rule
0:	from all lookup local 
32765:	from all fwmark 0x800/0xffff lookup T2 
32766:	from all lookup main 
32767:	from all lookup default 

cwdwr:~# ip route show table T2
default via 94.30.127.76 dev ppp1 

Any ideas? Should this be possible?

Thanks,

Andy


