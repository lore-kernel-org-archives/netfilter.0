From: Ruben I Safir <ruben@mrbrklyn.com>
Subject: Simple Packet Forwarding
Date: Tue, 25 Jun 2002 11:06:30 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625110630.G2549@www2.mrbrklyn.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello

I've been banging my head on documentation trying to get simple packet forwarding to function.

I could use some help.

I have a simple network with a gateway to DSL running on the ipaddess

Internet <-->216.254.112.136(eth1 gatway machine eth0)<-->216.254.112.135 <-->INTERNAL NETWORK

The Internal Netowrk has 216.254.112.137 and 216.254.112.138 plus the a 10.0.0.0 subnet

The routing looks like this

216.254.112.1   0.0.0.0         255.255.255.255 UH    0      0        0 eth1
216.254.112.135 0.0.0.0         255.255.255.255 UH    0      0        0 eth0
216.254.112.136 0.0.0.0         255.255.255.255 UH    0      0        0 eth1
216.254.112.137 0.0.0.0         255.255.255.255 UH    0      0        0 eth0
216.254.112.138 0.0.0.0         255.255.255.255 UH    0      0        0 eth0
10.0.0.0        0.0.0.0         255.255.255.0   U     0      0        0 eth0


I need to do simple packet forwarding without a Masquarade to test VPN on a lap top


I can't seem to get it to work without MASQUARADE.

My list looks like this

Chain INPUT (policy ACCEPT 1689 packets, 796K bytes)
 pkts bytes target     prot opt in     out     source               destination         
   81  9031 ACCEPT     all  --  eth0   any     anywhere             anywhere           
 2085  350K ACCEPT     all  --  eth1   any     anywhere             anywhere           

Chain FORWARD (policy ACCEPT 151 packets, 12660 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 1307  110K ACCEPT     all  --  any    any     anywhere             anywhere           
    0     0 ACCEPT     all  --  any    any     anywhere             anywhere           

Chain OUTPUT (policy ACCEPT 1687 packets, 792K bytes)
 pkts bytes target     prot opt in     out     source               destination         
  132 11168 ACCEPT     all  --  any    eth0    anywhere             anywhere           
 2617 1574K ACCEPT     all  --  any    eth1    anywhere             anywhere           







__________________________

Brooklyn Linux Solutions
__________________________
http://www.mrbrklyn.com - Consulting
http://www.brooklynonline.com - For the love of Brooklyn
http://www.nylxs.com - Leadership Development in Free Software
http://www.nyfairuse.org - The foundation of Democracy
http://www2.mrbrklyn.com/resources - Unpublished Archive or stories and articles from around the net
http://www2.mrbrklyn.com/mp3/dr.mp3 - Imagine my surprise when I saw you...
http://www2.mrbrklyn.com/downtown.html - See the New Downtown Brooklyn....

1-718-382-5752




