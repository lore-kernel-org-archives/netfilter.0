From: Martijn Lievaart <m@rtij.nl>
Subject: Re: ICMP fragmentation needed packets lost
Date: Mon, 31 Mar 2008 23:07:48 +0200
Message-ID: <47F152A4.2080701@rtij.nl>
References: <200803201813.36278.bossk@tyntec.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803201813.36278.bossk@tyntec.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bossk@tyntec.biz
Cc: netfilter@vger.kernel.org

bossk wrote:
> Hi,
>
> I have the following setup
>
> -------           ----------------                     -----------------            -------------           ----------------
> | B   |--------| VPN-GW2 |=======|  VPN-GW1 | --------|   GW      |--------|       A        |
> -------          -----------------                     ------------------           -------------           ---------------- 
>
> The server GW is in the same net (10.0.1.0/28) as VPN-GW via interface bond0 and connected to the same network (10.0.3.0/24) as server A with interface bond2.
> Server A can send packets to server B which can be reached through the VPN.
>
> Now the tricky part if server A sends a packet with a size of 1460 Bytes the VPN-GW1 sends an ICMP fragmentation-needed packet to A which
> is not passing the GW, if the FORWARD policy is set to DROP.
>
> I have enabled the following rules
> iptables -A FORWARD -i bond0 -o bond2 -j ACCEPT
> iptables -A FORWARD -i bond2 -o bond0 -j ACCEPT
>
> and specials rules 
> iptables -A FORWARD -s 10.0.1.0/28 -d 10.0.3.0/24 -j ACCEPT
> iptables -A FORWARD -s 10.0.3.0/24 -d 10.0.1.0/28 -j ACCEPT
>
> If I set the FORWARD policy to ACCEPT then the ICMP fragmentation-needed packet is passing the GW. After I change the FORWARD policy to DROP
> that packet is not passing the GW.
>
> Has someone an idea why this happens?
>   

Just a guess, but has VPN-GW1 an IP not in those ranges? Then the icmp 
errors have a different source address and are logically dropped. Adding 
a rule allowing RELATED traffic in should do the tric, or if you don't 
use conntrack, create an explicit rule for these packets.

HTH,
M4

