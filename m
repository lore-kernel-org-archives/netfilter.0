From: "Mucha Marcin, Sieciuch.com" <m.mucha@sieciuch.com>
Subject: nftables 1.0.6:  snat with maps
Date: Wed, 02 Aug 2023 12:17:58 +0200
Message-ID: <34f5ce6552e75f830d9340e8d576b73e@sieciuch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
I'm having trouble with moving from this snat rule:

chain source-nat {
        type nat hook postrouting priority 100; policy accept;
        ct state invalid drop;
        ip saddr 10.0.0.0/24 oif enp7s0 snat to 192.168.10.8 persistent;
        ip saddr 10.1.0.0/24 oif enp7s0 snat to 192.168.10.9 persistent;
        }
to the one that uses maps based on 
https://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps 
:

chain source-nat {
         type nat hook postrouting priority 100; policy accept;
         ct state invalid drop;
         oif enp7s0 ip saddr maps {10.0.0.0/24 : 192.168.10.8, 
10.1.0.0/24 : 192.168.10.9};
}

My problem is - I'm getting syntax error after checking config with "nft 
-cf /etc/nftables.conf":
"/etc/nftables.conf:43:83-83: Error: syntax error, unexpected newline
     oif enp7s0 ip saddr maps {10.0.0.0/24 : 192.168.10.8, 10.1.0.0/24 : 
192.168.10.9};
                                                                          
             ^"
Could I ask you for a help?
System: Debian 12, Nftables 1.0.6
uname -a: 6.1.0-10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.38-2 
(2023-07-27) x86_64 GNU/Linux


--
Thank you for your help!
Mucha Marcin

