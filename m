From: Andreas Herz <andi@geekosphere.org>
Subject: IPv6 fragmentation next header missing in some cases in the skb
Date: Mon, 31 Aug 2015 14:03:02 +0200
Message-ID: <20150831120302.GU29140@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

While playing around with the IPv6 extension headers i found a strange
behaviour when it comes to the IPv6 fragmentation header. First i used the
thc-ipv6 toolkit with that i could trigger the issue below in the first place.

I used the ipv6header match to check for those extension headers and
noticed that sometimes the match for "check if frag header set" didn't
match although i saw it in tcpdump/tshark and all the other checks for
ext headers worked.

I added a debug output after the "nexthdr = ipv6_hdr(skb)->nexthdr;" in
"net/ipv6/netfilter/ip6t_ipv6header.c" and saw that with special packets
the skb just returns the last nexthdr. So i'm quite confused why.

I generate packets with scapy and the easiest packet to reproduce it is
a simple ICMPv6 Echo Request packet with a fragmentation header.

##[ IPv6 ]###
  version= 6L
  tc= 0L
  fl= 0L
  plen= 16
  nh= Fragment Header
  hlim= 64
  src= FOO
  dst= BAR
###[ IPv6 Extension Header - Fragmentation header ]###
     nh= ICMPv6
     res1= 0L
     offset= 0L
     res2= 0L
     m= 0L
     id= 0
###[ ICMPv6 Echo Request ]###
        type= Echo Request
        code= 0
        cksum= 0x848e
        id= 0x0
        seq= 0x0
        data= ''

Which looks like this in tcpdump:

IP6 (hlim 64, next-header Fragment (44) payload length: 16) FOO > BAR frag
(0x00000000:0|8) ICMP6, echo request, seq 0

But if i printk the value of nexthdr it's just 58 for ICMPv6.  The same packet
generate with dst,hopbyhop,routing header results in nexthdr value being
60,0,43 and then the 58.
So i can narrow it down to the frag header missing in the skb info at this point.

Does anyone have an idea why this happens and where i might need to look for
this issue?

Thanks.

-- 
Andreas Herz
