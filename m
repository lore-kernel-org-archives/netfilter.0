From: "Chris Lyon" <cslyon@netsvcs.com>
Subject: NAT issues on a VPN tunnel
Date: Tue, 2 Nov 2004 07:40:06 -0800
Message-ID: <CARBON45GHEer27k2Ht000021de@carbon.netsvcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

So, I am trying to use NAT to solve the problem below because of an IP
addressing conflict issue but I am not having much luck. Basically all of
the Site A needs to get to only a few devices at each site B&C so I am
trying to do PREROUTING NAT on the far end systems. I have the tunnels up
and I can see the traffic getting to the remote side on ipsec0 but I just
can't get it to NAT from the 1.1.1.1 to the real 10.10.1.1. 

Command that I think should work
iptables -t nat -A PREROUTING -i ipsec0 -d 1.1.1.1 -j DNAT --to 10.10.10.10 
iptables -t nat -A POSTROUTING -o ipsec0 -s 10.10.10.10 -j SNAT --to 1.1.1.1


Any ideas? Layout and configs are below.


Site A eth0 - 192.168.254.0/24--Internet--Site B eth0 - 10.10.0.0/16
					 \ NAT FROM 1.1.1.1 10.10.1.1
example
					  \--Internet--Site C eth0 -
10.10.0.0/16
						NAT FROM 1.1.2.1 10.10.1.1
example


So here is the openswan configurations for your reference:

Site A

conn site_a-to-site_b
        #---------(local side is left side)
        left=<public site a>
        leftsubnet=192.168.254.0/24
        leftnexthop=%defaultroute
        #---------(remote side is right side)
        right=<public site b>
        rightsubnet=1.1.0.0/16
        #---------Auto Key Stuff
        pfs=yes
        auth=esp
        authby=secret
        esp=3des-md5-96
        keylife=8h
        keyingtries=0


Site B

conn site_b-to-site_a
        #---------(local side is left side)
        left=<public site b>
        leftsubnet=1.1.0.0/16
        leftnexthop=%defaultroute
        #---------(remote side is right side)
        right=<public site a>
        rightsubnet=192.168.254.0/24
        #---------Auto Key Stuff
        pfs=yes
        auth=esp
        authby=secret
        esp=3des-md5-96
        keylife=8h
        keyingtries=0



