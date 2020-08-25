From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: Load Balancing WAN connections with nftables
Date: Tue, 25 Aug 2020 11:11:36 +0300
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAGg7dk9mYqJGhbBt3m/ghGwBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAEJgezUuHtQY045Momo/L5AQAAAAA=@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=return-receipt-to:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=ez2kzDu8rh843rKngxYCP8KZwP0+HpVhbF3F/yzVA+A=;
        b=VjupZ0qRJJrYK7x0TWOr0aXJXJKu3HwFMsEKUgNO/zYPW1vJrX987cWl+naKp2+3K/
         ooD30MOtq4uJOHlVVFs+hUO9XrdsHxnhqsT+u5iUo5NVYlJIenehfpSYfH49YsCc7JGs
         rI3so4+/c492N2mjDmMWtRkSaIMd58Nl7UOm48NtfdW1p1FTCxzfIHS1IhqL9yS+8qmd
         b6VbrqVebhc05I8+Ow/yWYNkoqTusA8W5e/qOtuS7a+xGJ1ahLqm+5UteP8fzspntVUy
         ntgAV92GW73hCgjj7SxL3zJBr93UQKvWnKSUG46DCvtRWzkV5UQkhT04Ev3IpHHIRdjr
         V+/Q==
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey All,

I am working on an example for WAN load balancing with nftables.  (Xtables =
iptables/nftables).
I am unsure how and if such a setup can work with flow offloading for
anything if at all.

Also, is there any recommendation for managing and\or handling fail-over
with nftables?
I am not sure if and how to make a "fall back\throw" between routes or
marks.
Can I test if a connection is up or down by either some flag or other means
in nftables?
I was thinking about changing only the vmap and would be happy to hear other
ideas.

For now the main points I have in mind are:
* Connections stickiness (packet/connection/flow) - Xtables CONNMARK/ct
mark/meta mark
* LB Ratio/weight - Xtables nth/other + ipset


The goal of the next lab is to "simulate" IPv4 WAN load balancing across WAN
x N connections which will not tolerate per-packet LB.
Currently in the IPv4 world it means that different ISPs will lease dynamic
ip addresses to the DSL or Cable or Mobile/sat link.
Any TCP\UDP application will not tolerate a "connection"(more then 2
bi-directional packets with some context) which switch the source ip
address. 
The above will leave the basic linux kernel route cache which is either flow
or packet based in many or some cases un-reliable "enough".

My testing environment is:
Client 1 - 192.168.125.100/24 gw 192.168.125.254
R1 - 192.168.125.254/24 , 192.168.126.100/24(Masquerade) with
192.168.111.0/24 via 192.168.126.202 or 192.168.126.202
R2 - 192.168.126.202/24, 192.168.111.92/24(Masquerade) 
R3 - 192.168.126.203/24 , 192.168.111.93/24(Masquerade)
WebServer( HTTP + HTTPS) - 192.168.111.96/24

All of the above are Alpine linux stable 3.12 with kernel 5.4.43-1-virt

With iptables it's simple enough to load balance across links with the nth
module.
The full script is at:
https://gist.github.com/elico/a993f07bb3cceade31ce08e35e97f3dd

The relevant iptables part is:
### Start
IPTABLES="/sbin/iptables"
LAN="eth0"
WAN="eth1"

$IPTABLES -t mangle -F PREROUTING

$IPTABLES -t mangle -F PCC_OUT
$IPTABLES -t mangle -N PCC_OUT

$IPTABLES -t mangle -F PCC_OUT_RET
$IPTABLES -t mangle -N PCC_OUT_RET

$IPTABLES -t mangle -F MARK_COUNTER
$IPTABLES -t mangle -N MARK_COUNTER


$IPTABLES -t mangle -A POSTROUTING -j CONNMARK --save-mark
$IPTABLES -t mangle -A POSTROUTING -o $LAN -m connmark ! --mark 0 -j
MARK_COUNTER
$IPTABLES -t mangle -A POSTROUTING -o $WAN -m connmark ! --mark 0 -j
MARK_COUNTER

$IPTABLES -t mangle -A PCC_OUT -m statistic --mode nth --every 4 --packet 0
-j CONNMARK --set-mark 1
$IPTABLES -t mangle -A PCC_OUT -m statistic --mode nth --every 4 --packet 1
-j CONNMARK --set-mark 2
$IPTABLES -t mangle -A PCC_OUT -m statistic --mode nth --every 4 --packet 2
-j CONNMARK --set-mark 1
$IPTABLES -t mangle -A PCC_OUT -m statistic --mode nth --every 4 --packet 3
-j CONNMARK --set-mark 2

$IPTABLES -t mangle -A PCC_OUT -m connmark --mark 0 -j PCC_OUT_RET


$IPTABLES -t mangle -A PREROUTING -m state --state ESTABLISHED,RELATED -j
CONNMARK --restore-mark
$IPTABLES -t mangle -A PREROUTING -m connmark ! --mark 0 -j CONNMARK
--save-mark

$IPTABLES -t mangle -A PREROUTING -i $LAN -m conntrack --ctstate NEW -j
PCC_OUT

$IPTABLES -t mangle -A PREROUTING -m connmark --mark 0x1 -j MARK --set-mark
1
$IPTABLES -t mangle -A PREROUTING -m connmark --mark 0x2 -j MARK --set-mark
2
### End

The result would be round robin load balancing per NEW connection.

The missing parts which nftables gives are:
consistent flow\tuple hash based load balancing and connection distribution

The basic docs lacked the example I was looking for:
https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing

The script I wrote with nftables is at: 
https://gist.github.com/elico/492d8f75f584ec1bed98b2a054a02cbb

and the relevant nftalbes part is(assuming an empty nftables ruleset):
### Start
NFTABLES="/usr/sbin/nft"
LAN="eth0"
WAN="eth1"

#NAT
${NFTABLES} add table nat
${NFTABLES} add chain ip nat postrouting '{ type nat hook postrouting
priority 100; policy accept; }'
${NFTABLES} add rule nat postrouting oif ${WAN} masquerade

${NFTABLES} add table mangle

${NFTABLES} add chain ip mangle prerouting '{ type filter hook prerouting
priority -150; policy accept; }'
${NFTABLES} add chain ip mangle input '{ type filter hook input priority
-150; policy accept; }'
${NFTABLES} add chain ip mangle forward '{ type filter hook forward priority
-150; policy accept; }'
${NFTABLES} add chain ip mangle output '{ type route hook output priority
-150; policy accept; }'
${NFTABLES} add chain ip mangle postrouting '{ type filter hook postrouting
priority -150; policy accept; }'


${NFTABLES} add chain ip mangle wan1
${NFTABLES} add rule ip mangle wan1 counter ct mark set 0x1

${NFTABLES} add chain ip mangle wan2
${NFTABLES} add rule ip mangle wan2 counter ct mark set 0x2

# 5-tuple/flow/PCC(per connection classifier) LOAD Balance
${NFTABLES} add chain ip mangle PCC_OUT_TCP
${NFTABLES} add rule ip mangle PCC_OUT_TCP counter jhash ip saddr . tcp
sport . ip daddr . tcp dport mod 2 vmap { 0 : jump wan1, 1 : jump wan2 }

${NFTABLES} add chain ip mangle PCC_OUT_UDP
${NFTABLES} add rule ip mangle PCC_OUT_UDP counter jhash ip saddr . udp
sport . ip daddr . udp dport mod 2 vmap { 0 : jump wan1, 1 : jump wan2 }

${NFTABLES} add chain ip mangle PCC_OUT_OTHERS
${NFTABLES} add rule ip mangle PCC_OUT_OTHERS counter ip protocol { tcp, udp
}  return
${NFTABLES} add rule ip mangle PCC_OUT_OTHERS counter jhash ip saddr . ip
daddr mod 2 vmap { 0 : jump wan1, 1 : jump wan2 }


${NFTABLES} add rule ip mangle prerouting counter meta mark set ct mark
${NFTABLES} add rule ip mangle prerouting ct mark != 0x0 counter ct mark set
mark
${NFTABLES} add rule ip mangle prerouting iifname "${LAN}" ip protocol tcp
ct state new counter jump PCC_OUT_TCP
${NFTABLES} add rule ip mangle prerouting iifname "${LAN}" ip protocol udp
ct state new counter jump PCC_OUT_UDP
${NFTABLES} add rule ip mangle prerouting iifname "${LAN}" ct state new
counter jump PCC_OUT_OTHERS


${NFTABLES} add rule ip mangle prerouting ct mark 0x1 counter meta mark set
0x1
${NFTABLES} add rule ip mangle prerouting ct mark 0x2 counter meta mark set
0x2

${NFTABLES} add rule ip mangle postrouting counter ct mark set mark
### End

There is another concept sketch which can be used in big networks for
consistent NAT with a set:
### Start
#...
${NFTABLES} add table mangle

${NFTABLES} add set mangle myset { type ipv4_addr . inet_service . ipv4_addr
. inet_service \; flags dynamic ,timeout \; timeout 10m10s \; }

${NFTABLES} add chain ip mangle prerouting '{ type filter hook prerouting
priority -150; policy accept; }'

${NFTABLES} add rule mangle prerouting set add ip saddr . tcp sport . ip
daddr . tcp dport @myset
${NFTABLES} add rule mangle prerouting set add ip saddr . udp sport . ip
daddr . udp dport @myset
# ...
### End

The above will persist a connection mark selection per flow for 10 minutes
and when used correctly with ct set mark a connection will persist as long
as it lives.

Any thoughts or comments are more then welcome? 

Thanks,
Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

