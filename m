From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: selective routing of port 80
Date: Thu, 31 Mar 2011 19:50:15 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1103311949010.32006@obet.zrqbmnf.qr>
References: <AANLkTi=fVGwx-XeQg0DJofvehGG3RkneRnwg2J1Tmy3_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=fVGwx-XeQg0DJofvehGG3RkneRnwg2J1Tmy3_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ahnkle <ahnkle+netfilter@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-03-31 18:50, ahnkle wrote:

>Hi,
>I have a temporary webserver I want to access from the internet.
>
>internet========router======gateway
>                                   |
>                                   =====webserver
>
>Above is my setup. I want to check that what I am doing is suitable,
>and to check for pitfalls.
>
>Gateway is default gateway for all devices on local network: it
>provides dns & dhcp.
>
>Port 80 is forwarded by the router to webserver. I marked returning
>packets, and route just packets returning from port 80 to the router.
>
>I have used
>
>      iptables -A OUTPUT -t mangle -i eth0 -p tcp -s <local network> -j ACCEPT
>      iptables -A OUTPUT -t mangle -i eth0 -p tcp --sport 80 -j MARK
>--set-mark 0x1
>
>to mark returning http packets.
>
>Then using iproute2:
>
>      echo "1 HTTP" >> /etc/iproute2/rt_tables
>      echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
>      echo 1 > /proc/sys/net/ipv4/conf/eth0/rp_filter
>
>      ip route add default via <router ip> dev eth0 table HTTP
>      ip rule add from all fwmark 0x1 table HTTP
>
>Is this a good solution, or is this flawed?

As long as you avoid address clashes for any given directly-connected
host pair that suits it fine.
