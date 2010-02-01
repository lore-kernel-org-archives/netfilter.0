From: Serg Buslovsky <serg.buslovsky@gmail.com>
Subject: policy based routing - leaking packets
Date: Mon, 1 Feb 2010 21:38:15 +0200
Message-ID: <91f85b781002011138j8391807xa93f7ae73afddec2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=L35QB5MP+RX9yqtOsiyHPAmP73hBLVy77kLw6YC44Yw=;
        b=eNKOMyM37DnlVBeOh1EiroPPYIOzXKTbGs3deuBLCUqs01OzxmOqmgP8rUXI3iWCWj
         pffgaEVWENyrE5w7+9LMQJ5VDRTcfQgkgRFmDH9Nz3ogA3j2QoODLgoltWmf5qU79xQ1
         PJGfQ4oEGgligCDPz+ySBnmFGbKDHKLJFXHG8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, All.

I've set up policy based routing. All traffic for a specific user goes
through a specific interface.
Here's the config:

> #!/bin/bash
>
> echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/tun0/rp_filter
>
> ip route flush table 201
>
> iptables -t mangle -N TUNMARK
> iptables -t mangle -A TUNMARK -j MARK --set-mark 101
> iptables -t mangle -A TUNMARK -j CONNMARK --save-mark
> iptables -t mangle -N RESTOREMARK
> iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark
>
> iptables -t mangle -A OUTPUT -p all -m state --state NEW -m owner --uid-owner vpnroute ! -d 192.168.0.0/24 -j TUNMARK
> iptables -t mangle -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -m owner --uid-owner vpnroute ! -d 192.168.0.0/24 -j RESTOREMARK
>
> iptables -t mangle -A OUTPUT -m iprange --src-range "10.10.6.0"-"10.10.6.255" -j TUNMARK
>
> iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 101 -p udp --dport 53 -j ACCEPT
> iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 101 -j DROP
>
> iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
>
> ip rule add fwmark 101 table 201
> ip route add default dev tun0 table 201
> ip route flush cache

In single-thread mode it works fine, all traffic goes to tun0. When I
start multi-threaded process rarely some packets go to eth0. (seeing
that in tcpdump)

Any ideas?

Thanks,
Serg
