From: Simon Matthews <simon@paxonet.com>
Subject: Iptables, SNAT/MASQ,  Multiple gateways (fwd)
Date: Sun, 29 Sep 2002 16:12:45 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209291602330.16046-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a dual-homed firewall. It has 2 Internet connections, provided by
different ISPs (each with an associated IP address). The 2 Internet
connections are connected to the same physical interface. The 2 Internet
connections do NOT have equal bandwidth. 

I am using the iproute2 tools to configure the 2 internet connections, so
both connections are associated with "eth0" (and not an 'eth0:x' style
device name). 

The iproute2 tools are used to ensure that:
1. I have a 5:1 ratio of the gateway usage. 
2. The outgoing packets have the correct source address for the gateway 
they will use. 

Now this will work for packets coming from the local host. But packets 
that are forwarded from the LAN behind the firewall will come in, and 
during the routing stage, they will be assigned a gateway to use. 

Now, since the gateway is already defined, how do I make MASQ/SNAT work so 
that it set the appropriate source address for the gateway? 

Please remember that I only have one physical interface on the Internet
side and the only device name used for this interface is "eth0".
Hence, I cannot use the "-o" option to select between different
gateways and then do the SNAT/MASQ appropriately.

Please also remember that I want to be able to control the ratio of 
gateway usage -- so the option to use 2 source IP addresses in my SNAT 
command won't work (as this only provides a 1:1 ratio). 

Any suggestions? Is there some other way I can distingush the packets and 
do the proper SNAT/MASQ? Or will  MASQ just work properly -- setting the 
source address according to the gateway that the packet will use?


Thanks!
Simon



