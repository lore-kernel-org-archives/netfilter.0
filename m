From: sean darcy <seandarcy2@gmail.com>
Subject: setting up separate route for VOIP
Date: Sat, 15 Nov 2008 12:16:33 -0500
Message-ID: <gfn05j$hi1$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

My server NAT's an internal asterisk VOIP server. That works, but we're 
trying to use a separate dsl connection for VOIP.

eth0 : internal LAN
eth1 : default internet
eth3 : VOIP connection ( DHCP)


The VOIP traffic is SIP and IAX, but for now I'm just trying to set up 
IAX, which uses port 4569 for all traffic.

I've manually edited /etc/iproute2/rt_tables:

cat rt_tables
#
# reserved values
#
255	local
254	main
253	default
0	unspec
#
# local
#
#1	inr.ruhep
180     voip

and created this script:

# manually set up table 180 in /etc/iproute2/rt_tables

# for any iax packets that come in set fwmark to 180
/sbin/iptables -t mangle -A PREROUTING -s 10.10.10.180 -p udp --dport 
4569 -j MARK --set-mark 180

# any packets with fwmark 180 are routed through table 180
/sbin/ip rule add fwmark 180 table 180

# this should send out the voip packets over eth3
/sbin/ip route add dev eth3 table 180

Will this mess up the NAT? Anything else to look out for?

sean

