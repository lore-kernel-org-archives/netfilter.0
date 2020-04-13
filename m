From: Mickael Bosch <mickael.bosch@posteo.net>
Subject: marking/routing packets breaks the conntrack rule for NAT
Date: Mon, 13 Apr 2020 10:42:40 +0200
Message-ID: <23f9f429-7e47-4520-0889-5f465741804c@posteo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1586767361; bh=TAQDuMKx7m6XVxLeSypZCN1KbdB03TB2Mj7UzALodow=;
        h=To:From:Subject:Date:From;
        b=CFnzyPrLAgZ2xsznuandkyKXWlDzm93rMKUlyNJ7QDb1G2kR1SYrmu21815DKa9vi
         Q0pZK4pljvXq8LJtshnW0WVn7izO3KDsec4Qnwbt+dlfBy9Z8quA7lTl9omz6xHG+D
         EoRHC589a86PVpqi/x+m4XvYfNLXeQaRCHdiY017RY7mc5wA2HJAouEt8LTUZRly5w
         sII4fpmjaehx8jT/nr1hlstJpn+49id6FfXRzwUVkeuj1RmLEttXk8+hVolBYBDyMs
         OWYXEA9+hZNdRWxJVZgbf7svsYTI1ccNLR9uEdeYbXEfgb9DYxEVPT+55XJzlAKqGA
         y5MiUpfsVeQQg==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a home server with several NICs. enp8s0 and enp7s0 are facing WAN 
through 2 different ISP boxes. Other NICs are in the LAN.
I would like to masquerade LAN to enp8s0 by default but in some cases, 
e.g. based on the LAN computer IP address, use enp7s0 instead.

I tried to mark packets matching my "change route" rule with nftables
"meta mark set 42"
  and then use iproute2 to route traffic with:

```
ip route add 0.0.0.0/0 dev enp7s0 via 192.168.1.1 table 42
ip rule add from all fwmark 42 table 42
ip route flush cache
```

the nftables configuration is:
```
flush ruleset

table inet filter {

     set lan_if { type ifname; elements = {
         br0,
     }}
     set wan_if { type ifname; elements = {
         enp7s0,
         enp8s0,
     }}
     set lan_tcp_service { type inet_service; elements = {
         22, #ssh, sshfs (sftp), git
         2049, #nfs
     }}

     chain base_checks {
         ct state {established, related} accept # allow 
established/related connections
         ct state invalid drop # early drop of invalid connections
     }

     chain input {
         type filter hook input priority 0; policy drop;
         jump base_checks
         iifname lo accept # allow from loopback
         tcp dport @lan_tcp_service iifname @lan_if accept # allow LAN 
services
         # allow icmp
         ip protocol icmp icmp type { echo-request, echo-reply, 
time-exceeded, parameter-problem, destination-unreachable } accept
         ip6 nexthdr icmpv6 icmpv6 type { echo-request, echo-reply, 
time-exceeded, parameter-problem, destination-unreachable, 
packet-too-big, nd-router-advert, nd-router-solicit, 
nd-neighbor-solicit, nd-neighbor-advert, mld-listener-query } accept
         reject with icmpx type port-unreachable
     }

     chain forward {
         type filter hook forward priority 0; policy drop;
         jump base_checks
         iifname @lan_if oifname @wan_if accept
         iifname @wan_if oifname @lan_if ct state related,established accept
         reject with icmpx type port-unreachable
     }

     chain output {
         type filter hook output priority 0; policy accept;
     }
}

# NAT
table ip nat {
     set wan_if { type ifname; elements = {
         enp7s0,
         enp8s0,
     }}

     set lowbw { type ipv4_addr; elements = {
         172.16.0.203,
     }}

     chain prerouting {
         type nat hook prerouting priority 0; policy accept;
         #ip saddr @lowbw meta mark set 42;
         #ip saddr @lowbw ct mark set mark; #test
         nftrace set 1;
     }

     chain postrouting {
         type nat hook postrouting priority 100; policy accept;
         oifname @wan_if masquerade;
     }
     chain output {
         type nat hook output priority 100; policy accept;
     }
}
```

If "ip saddr @lowbw meta mark set 42;" in ip nat/prerouting is not 
commented out, the output traffic (a web request) flows through enp7s0 
as expected but the reply (a DNS reply) is dropped because "ct state 
{established, related} accept" in inet filter/base_checks is not triggered:

```
trace id 984930c5 ip nat prerouting packet: iif "enp7s0" ether saddr 
<remote MAC> ether daddr <enp8s0 MAC> ip saddr 1.0.0.1 ip daddr 
192.168.1.10 ip dscp cs0 ip ecn not-ect ip ttl 53 ip id 59111 ip length 
120 udp sport 53 udp dport 58689 udp length 100 @th,64,96 
3516843934384394949493
trace id 984930c5 ip nat prerouting rule meta nftrace set 1 (verdict 
continue)
trace id 984930c5 ip nat prerouting verdict continue
trace id 984930c5 ip nat prerouting policy accept
trace id 984930c5 inet filter input packet: iif "enp7s0" ether saddr 
<remote MAC> ether daddr <enp8s0 MAC> ip saddr 1.0.0.1 ip daddr 
192.168.1.10 ip dscp cs0 ip ecn not-ect ip ttl 53 ip id 59111 ip 
protocol udp ip length 120 udp sport 53 udp dport 58689 udp length 100 
@th,64,96 35168439343843949494935964644
trace id 984930c5 inet filter input rule jump base_checks (verdict jump 
base_checks)
trace id 984930c5 inet filter base_checks verdict continue
trace id 984930c5 inet filter input rule meta nftrace set 1 (verdict 
continue)
trace id 984930c5 inet filter input rule reject (verdict drop)
```

Please note that "ether daddr" is the enp8s0 MAC address, not the enp7s0 
MAC address as I would expect.

Could you please help me finding my mistakes? Is there a preferred 
method to choose the WAN NIC depending on IP addresses or ports?

configuration :
- nftables-1:0.9.4-1
- iproute2-5.6.0-1
- linux 5.5.7-arch1-1

Best regards,
Mickael
