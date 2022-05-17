From: Florian Eckert <fe@dev.tdt.de>
Subject: nftables: priority handling for changes on the same table
Date: Tue, 17 May 2022 16:22:29 +0200
Message-ID: <637fd485a9de3e0f8dc9f1fbada3701c@dev.tdt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hallo Community

OpenWrt has recently switched to nftables for the new release 
openwrt-22.03 [1].
For this purpose, a new firewall service fw4 was created, which 
generates the rules for the nft and loads them into the kernel [2].

Since I am a package manager at openwrt I have a question regarding 
nftables.
I am in the process of making the strongswan and other packages mwan3 
fit for nftables because up now a lot of stuff is not working proper 
with fw4(nftables)
It works with iptables-nft and ip6tables-nft.

My problem now is that the strongswan iptables rules are set when a 
tunnel is up or down via the _updown script.
I wanted to port this to nft now.
To use the script approach with "nft rule add ..." seems to work, but 
deleting them is poor, because I have to search for the handle first.


Is there no other option here?
I have also tried to create my own chain "strongswan_filter_pre_forward" 
before the openwrt fw4 table chain "forward",
but somehow this does not not working as expected!

Not working:
root@G3-10483 ~ # nft list ruleset
table inet fw4 {
     ...
     chain strongswan_filter_pre_forward {
         type filter hook forward priority filter - 2; policy accept;
         iifname "eth0" meta ipsec exists ipsec in reqid 1 ip saddr 
192.168.17.0/24 ip daddr 192.168.99.0/24 accept
         oifname "eth0" meta ipsec exists ipsec out reqid 1 ip saddr 
192.168.99.0/24 ip daddr 192.168.17.0/24 accept
     }
     ...
     chain forward {
         type filter hook forward priority filter; policy drop;
         ct state established,related accept comment "!fw4: Allow 
forwarded established and related flows"
         iifname "eth1" jump forward_lan comment "!fw4: Handle lan 
IPv4/IPv6 forward traffic"
         iifname "eth0" jump forward_wan comment "!fw4: Handle wan 
IPv4/IPv6 forward traffic"
         jump handle_reject
     }
     ...
}
Working:
root@G3-10483 ~ # nft list ruleset
table inet fw4 {
     ...
     chain forward {
         type filter hook forward priority filter; policy drop;
         iifname "eth0" meta ipsec exists ipsec in reqid 1 ip saddr 
192.168.17.0/24 ip daddr 192.168.99.0/24 accept
         oifname "eth0" meta ipsec exists ipsec out reqid 1 ip saddr 
192.168.99.0/24 ip daddr 192.168.17.0/24 accept
         ct state established,related accept comment "!fw4: Allow 
forwarded established and related flows"
         iifname "eth1" jump forward_lan comment "!fw4: Handle lan 
IPv4/IPv6 forward traffic"
         iifname "eth0" jump forward_wan comment "!fw4: Handle wan 
IPv4/IPv6 forward traffic"
         jump handle_reject
     }
     ...
}

I have specially lowered the 'priority' of the chain 
"strongswan_filter_pre_forward" by two so that it runs before the 
'forward' chain.

Is it possible that my approach is wrong and it doesn't work like this? 
I have not found anything in the documentation about that.

Kind regards
Florian

[1] https://github.com/openwrt/openwrt/tree/openwrt-22.03
[2] https://git.openwrt.org/?p=project/firewall4.git;a=summary
