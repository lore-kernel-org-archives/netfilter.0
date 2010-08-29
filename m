From: Xavier Roche <roche*lkml@httrack.com>
Subject: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Sun, 29 Aug 2010 12:48:52 +0200
Message-ID: <4C7A3B14.9010805@httrack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283078941; bh=jv+RX/eDhSRrksDaM6X150HS9KB1RP06nto0CsK6nT4=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=hBR6NfO5Gy0WeEvNm1IU7CPUbbWXRvVQUk2MiAYthx3YUL2wp7cp2oJ0BpdhmBo4X
	 Jdp090uPrbM0vS0EgLTMO3mtc4CVnxkqCcxP3CTR2eTS+zROHdiQ4nOozo0wK5000p
	 XdZXY+yTtWRwto39hfRT4ZJ0s0/VGfkfmh4W1zRU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi folks,

Following a discussion on comp.os.linux.networking (1), I am wondering 
if a specific rule for source address selection would be a good idea or 
not. The rule might NOT be a netfilter rule at all (ie. the rule would 
be evaluated during source address selection, that is, before packet 
building), but probably with a similar approach. Please redirect the 
discussion to a more adapted list if this is off-topic if necessary.

With the future rise or IPv6 (even if it is a damn slow rise), servers 
will have the opportunity to have [easily] multiple IP addresses 
configured by default on each interface (ip -6 addr add ..), providing 
new features that were difficult to have with the scarce IPv4 resource:
* one outgoing IP per service (for example, a SMTP server would have its 
own address for the outgoing interface - and one unique reverse IP to 
the declared SMTP server address)
* one outgoing IP per user (for multi-user machines) ; with optional 
custom reverse ("smith.users.example.com")
* one outgoing IP for specific network blocks
etc ..

The first case can sometimes be partially solved using 
application-specific configuration (bind to a specific address) - 
however this is not desirable when you need to listen to all interfaces 
(ie. including IPv4-only or IPv6-only ones)

This can not be easily achieved currently ;
* iproute's rt_tables can be used to select a specific route, but some 
ugly NATing is still necessary to rewrite the source address (we do not 
want to do that and can not do that with ipv6 anyway) ; ie. this is 
generally too late as the packet has already been built (2)
* trapping bind/connect (3) for each service using some LD_PRELOAD magic 
is not very clean or easy to deploy

RFC 3484 (4) specifies the way source address is selected ; with the 
following order (5):

1. Prefer same address. (i.e. destination is local machine)
2. Prefer appropriate scope. (i.e. smallest scope shared with the 
destination)
3. Avoid deprecated addresses.
4. Prefer home addresses.
5. Prefer outgoing interface. (i.e. prefer an address on the interface 
we're sending out of)
6. Prefer matching label.
7. Prefer public addresses.
8. Use longest matching prefix.

However, [RFC 3484] "If the eight rules fail to choose a single address, 
some unspecified tie-breaker should be used". The current default, if I 
am not mistaken, is to select the last address added to "the" selected 
interface ; as the only remaining choice is to select addresses within a 
single interface. This seem to be the current "unspecified tie-breaker".

The code logic appears to be in net/ipv6/addrconf.c ; the 
IPV6_SADDR_RULE_PREFIX is the 8th rule, and is used in 
ipv6_get_saddr_eval()

[ip6_dst_lookup()/ip6_sk_dst_lookup()] => ip6_dst_lookup_tail() => 
ipv6_dev_get_saddr() => ipv6_get_saddr_eval()
[ For an UDP packet, the udpv6_sendmsg() directly uses 
ip6_sk_dst_lookup() to get the source address ]

This "unspecified tie-breaker" could be a new rule ; maybe a new 
"netfilter" (or pre-netfilter) rule specific to each interface ; ie. 
when the source address is selected using the RFC 3484 specification, a 
9th rule would select the source address within this interface. (such as 
"IPV6_SADDR_RULE_NETFILTER")

Any remark is welcome (including obvious solutions to the problem, which 
would be great)


Xavier.


(1) <news:i58p94$2pj$1@news.httrack.net>

(2) <news:i58ui8$1n0i$1@saria.nerim.net>

(3) <news:0cc95c92-eae3-4891-8f5e-8f1a414f8ec5@l38g2000pro.googlegroups.com>

(4) <http://www.ietf.org/rfc/rfc3484.txt>

(5) <http://www.davidc.net/networking/ipv6-source-address-selection-linux>


