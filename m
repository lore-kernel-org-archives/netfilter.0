From: Daniel <tech@tootai.net>
Subject: nftables mark - tshark show [Frame is marked: False]
Date: Fri, 2 Jun 2023 18:47:28 +0200
Message-ID: <a06475d5-848c-188f-0ea9-549655c0a9f9@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1685724449; bh=Xd06ytiA+taZVKZPOfkiPYd+QdQn6uaNIB00h5tBTpg=;
        h=Date:To:From:Subject:From;
        b=hrPlJ90WsUbHiUlDOTaesrW7wwi8jY1i+crnSLwly2y9yxWvBXG2uUOtqCr6TmWw2
         filj7UnFk8ai8i/yAk4oyrWDyw5LpCFtkPtFzTzyCWMXGjPkL405GLVbn3rCYkI0c+
         QNArHVESbZiBvLIbOMfsIFEOHCN0Z0yW9EU1NFTk=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1685724449; bh=Xd06ytiA+taZVKZPOfkiPYd+QdQn6uaNIB00h5tBTpg=;
        h=Date:To:From:Subject:From;
        b=hrPlJ90WsUbHiUlDOTaesrW7wwi8jY1i+crnSLwly2y9yxWvBXG2uUOtqCr6TmWw2
         filj7UnFk8ai8i/yAk4oyrWDyw5LpCFtkPtFzTzyCWMXGjPkL405GLVbn3rCYkI0c+
         QNArHVESbZiBvLIbOMfsIFEOHCN0Z0yW9EU1NFTk=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

I try on Debian 11/nftables v0.9.8 (E.D.S.) following setup for ipv6, 
nftrace being activated.

Traffic coming on wireguard IF fo IP 2001:xxxx::5870/128 should go out 
through the wireguard IF, other traffic using default gw.

main and default IF=enp35s0
wireguard if=wig0

On incoming packet, in table mangle

chain INPUT {
    type filter hook input priority mangle; policy accept;
    meta mark set ct mark
    mark != 0x0 accept
    iif "wig0" ip6 daddr { 2001:67c:1298::/48 } meta mark set 0x100 ct 
mark set meta mark
}

following nftrace I see that incoming packets are going till

trace id dc77c61b ip6 filter INPUT packet: iif "wig0" ip6 saddr 
2001:yyyy::24 ip6 daddr 2001:xxxx::5870 ip6 dscp cs0 ip6 ecn not-ect ip6 
hoplimit
  6 ip6 flowlabel 729556 ip6 length 24 icmpv6 type echo-request icmpv6 
code no-route icmpv6 parameter-problem 772505885 @th,64,96 0 

trace id dc77c61b ip6 filter INPUT rule meta mark 0x00000100 accept 
(verdict accept)

First problem, a tshark capture shows [Frame is marked: False]: 
shouldn't this frame marked as 0x00000100 as shown per nft trace ?

Second: I add a table in rt_tables and did
#ip -6 rule add from all table <mytable>
#ip -6 route add default via <mygw> dev wig0
#ip -6 route flush cache

Output
#ip -6 rule sh
0:      from all lookup local
32765:  from all fwmark 0x100 lookup <mytable>
32766:  from all lookup main

but my packet are still going out using enp35s0 as default route. What 
am I missing knowing that ct established,related is setted in nftables 
rules.

Thanks for any hint
-- 
Daniel
