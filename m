From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: Ebtables + iptables on a bridge troubleshooting
Date: Fri, 2 Jul 2010 16:57:19 +0200
Message-ID: <AANLkTimWjeXbiEB_s6aZNj2hYVG0XGT9_IaJJtELjRPe@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=ZKirzD45GJDU4BfI9yHDpuDmOhD+DBHyLzNCZ86IUdQ=;
        b=Wx06Lltw4DozIWMNx00tjC2MLaN8tmbtSqvQTj47ODpf/Fqcve7YtQXQNvJHH7HtCc
         etXQh3AkMfwFTTJM9NIMT7KJX42VzxMknHxCMp2l/ZVSRwcuK2PBpUCUFd6naVAJwjd4
         l4SUyJDp7fyib2uRT0O8z0Yrh/xG2jKYnSpC8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi list!

This is the first time I write on this list. First, thanks to all
netfilter developers for the great software!

I'm running into trouble with ebtables + iptables on bridge in wich I
have setup an Squid transparent proxy with TPROXY.

This is my testing schema:

CLIENT_MACHINE -------> BRIDGE -------> DEFAULT GATEWAY

This is my firewall configuration

CLIENT_IFACE=eth0
INET_IFACE=eth1

ifconfig $CLIENT_IFACE down
ifconfig $INET_IFACE down
ifconfig $CLIENT_IFACE 0.0.0.0 up
ifconfig $INET_IFACE 0.0.0.0 up

brctl addbr br0
brctl addif br0 $CLIENT_IFACE
brctl addif br0 $INET_IFACE
brctl stp br0 off

dhclient br0

ip rule add fwmark 1 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
echo 0 > /proc/sys/net/ipv4/conf/lo/rp_filter
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t mangle -N DIVERT
iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j ACCEPT
iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY
--tproxy-mark 0x1/0x1 --on-port 3128
ebtables -t broute -A BROUTING -i $CLIENT_IFACE -p IPv4 --ip-proto tcp
--ip-dport 80 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -i $INET_IFACE -p IPv4 --ip-proto tcp
--ip-sport 80 -j redirect --redirect-target DROP


Everithing works fine if I use the ACCEPT target for redirect in
ebtables, but everywere I found that the target should be DROP for
routing packets. I also noticed that I have twice the traffic on eth1
when I use the ACCEPT target so it's not feasible to use.
Have you any advice? I have read every mesagge I found on google but
cannot find a solution.

Thank you in advance!

Angelo
