From: bossk <bossk@tyntec.biz>
Subject: ICMP fragmentation needed packets lost
Date: Thu, 20 Mar 2008 18:13:35 +0100
Message-ID: <200803201813.36278.bossk@tyntec.biz>
Reply-To: bossk@tyntec.biz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have the following setup

-------           ----------------                     -----------------            -------------           ----------------
| B   |--------| VPN-GW2 |=======|  VPN-GW1 | --------|   GW      |--------|       A        |
-------          -----------------                     ------------------           -------------           ---------------- 

The server GW is in the same net (10.0.1.0/28) as VPN-GW via interface bond0 and connected to the same network (10.0.3.0/24) as server A with interface bond2.
Server A can send packets to server B which can be reached through the VPN.

Now the tricky part if server A sends a packet with a size of 1460 Bytes the VPN-GW1 sends an ICMP fragmentation-needed packet to A which
is not passing the GW, if the FORWARD policy is set to DROP.

I have enabled the following rules
iptables -A FORWARD -i bond0 -o bond2 -j ACCEPT
iptables -A FORWARD -i bond2 -o bond0 -j ACCEPT

and specials rules 
iptables -A FORWARD -s 10.0.1.0/28 -d 10.0.3.0/24 -j ACCEPT
iptables -A FORWARD -s 10.0.3.0/24 -d 10.0.1.0/28 -j ACCEPT

If I set the FORWARD policy to ACCEPT then the ICMP fragmentation-needed packet is passing the GW. After I change the FORWARD policy to DROP
that packet is not passing the GW.

Has someone an idea why this happens?

Thanks,
bossk
