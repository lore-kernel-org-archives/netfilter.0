From: Daniel <tech@tootai.net>
Subject: Nftables 2 WAN
Date: Fri, 14 Aug 2020 18:27:44 +0200
Message-ID: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597422466; bh=Q9LHQtuEpBEUZf4/PuYgu5QDDvf0A5zqLywGWPla2xM=;
        h=To:From:Subject:Date:From;
        b=NoU0BmGZURx3CdCJDvG7ll4r7jr0y0cn/egVy2aeAVrDzRin3YhI0JrqsaQg9N5gc
         ZNNfB6ovxsz8aBY1V/SHKbQrd2TIVic0ZHwwOzIv0XXvT7n57YBkco4ibLkWUSSh3/
         b3LI3SWXuTt8O2Sx2r65RlTEWpW+6toDMBynljKw=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597422465; bh=Q9LHQtuEpBEUZf4/PuYgu5QDDvf0A5zqLywGWPla2xM=;
        h=To:From:Subject:Date:From;
        b=Foq+yhde0CmMatrwosW2QDvyK57Ly2hOCbspv40r1cjdCE71EoZJjvcRa++Msmx3H
         EYkEl+Ce0BopmGh8l0k7Lefwo7eSxhHzwV2HHtrL6RrsyDW5HGcKm1za1n/v4Q1kZm
         ubffRqnx0G2dGBqptUF9Del1oKO+jxqn3cpCajkk=
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hello,

I'm configuring a routeur which has 2 WAN, one being a tunnel over gre 
which is for bgp session accepting all ipv6 routes. I have 2 interfaces, 
eth0 which has 2 ipv6 addresses and gretunnel which has one ipv6 address.

Problem is that incoming ipv6 traffic to eth0 is going out through 
gretunnel. My rules are

fwtables="sudo nft"
myip="sudo ip"

# nft table mangle ip and ip6
#
$fwtables delete table ip mangle 2>/dev/null || true
$fwtables delete table ip6 mangle 2>/dev/null || true
$fwtables add table ip mangle 2>/dev/null || true
$fwtables add table ip6 mangle 2>/dev/null || true
$fwtables add chain ip6 mangle output "{ type nat hook output priority 
-150 ; policy accept ; }"
$fwtables add rule ip6 mangle output oifname != gretunnel meta mark set 
0x254
$fwtables add rule ip6 mangle output oifname gretunnel meta mark set 0x2

# nft table route
#
$fwtables add table ip6 route
$fwtables add chain ip6 route output
$fwtables add rule ip6 route output meta oif gretunnel meta mark != 0x2 
counter drop

# ip route mark
#
$myip rule add fwmark 0x254 table default
$myip rule add fwmark 0x2 table isp2
$myip route flush table isp2
$myip route add prohibit default table isp2

What is wrong with this setup ?

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
