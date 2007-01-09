From: Techside Security <security@techside.it>
Subject: RE: 2 Internet connection and one local network
Date: Tue, 09 Jan 2007 09:27:59 +0100
Message-ID: <45A3520F.9020400@techside.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi, this configuration don't work for me.
I have traced the packet that arrive from internet to a internal server;
when the packet is sended to public ip that corrspond to default 
internet line all is ok, but when i send a packet to public ip that 
correspond to second internet line the packet arrive to firewall and
don't go forward to internal server. This seems to be an nat or 
forwarding error but I if add the table rule (iproute2)
ip rule add from <internal server ip> table line2
the packet go to server and return from the second line.
All the test is made with the iptables and iproute rule
described in the reply post.

What is the meaning of: echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter

I'm using debian sarge with 2.6.17 kernel and iptables 1.3.7

Any suggestion on what I'm wrong ?

Sorry for my bad english.
Fabio.



> Date: Thu, 4 Jan 2007 11:08:42 -0000
> From: "Matt" <Matt@PlumSoftware.co.uk>
> Subject: RE: 2 Internet connection and one local network
> To: <netfilter@lists.netfilter.org>
> Message-ID:
> 	<117F5E7DA31C17478948DC39E01B948B400F91@frost.PlumSoftwareLtd.local>
> Content-Type: text/plain;	charset="ISO-8859-15"
> 
> 
> 
> Copied from an earlier post of mine... Similiar situation to yours, I believe. Hope you can make sense of it all...
> 
> 
> Matt.
> 
> 
> 
> Copied text below:
> 
> 
> For your, and anyone else's interest, the answer is:
> 
> ====================== IPTABLES commands =================================
> 
> #!/bin/sh
> 
> IPTABLES="/sbin/iptables"
> 
> # prevent incoming packets on masqueraded connections from being dropped
> # as "martians" due to the destination address being translated before the
> # rp_filter check is performed
> # MATT NOTES: this does not seem to be necessary...
> #echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
> #echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
> 
> #Time to clean house
> 
> #Clear out any existing firewall rules, and any chains that might have
> #been created
> $IPTABLES -F
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
> $IPTABLES -F -t mangle
> $IPTABLES -F -t nat
> $IPTABLES -X
> 
> #Setup our policies
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -P FORWARD ACCEPT
> 
> #This enables ip forwarding, and thus by extension, NAT
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe iptable_nat
> 
> #Our actual rules
> 
> #Our NAT stuff
> 
> #Source NAT everything heading out the external interface to be the
> #given IP. 
> $IPTABLES -t nat -A POSTROUTING -o eth1 -j SNAT --to 100.100.251.218
> $IPTABLES -t nat -A POSTROUTING -o eth2 -j SNAT --to 200.200.64.140
> 
> #Mark incoming packets for later routing
> $IPTABLES -t mangle -A PREROUTING -j CONNMARK --restore-mark
> $IPTABLES -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 11
> $IPTABLES -t mangle -A PREROUTING -i eth2 -j MARK --set-mark 12
> 
> #save mark on outgoing packets
> $IPTABLES -t mangle -A POSTROUTING -j CONNMARK --save-mark
> 
> #These are the rules for publishing the internal server
> $IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 56100 -j DNAT --to 192.168.0.5
> $IPTABLES -t nat -A PREROUTING -i eth2 -p tcp --dport 56100 -j DNAT --to 192.168.0.5
> 
> 
> ================== IPROUTE2 STUFF ===========================
> 
> # Set up supplementary routing tables
> 
> ip route add 100.100.251.216/29 dev eth1 src 100.100.251.218 table T1
> ip route add default via 100.100.251.217 table T1
> ip route add 200.200.64.136/29 dev eth2 src 200.200.64.140 table T2
> ip route add default via 200.200.64.137 table T2
> 
> # Not necessary as these routes are added by configuring network cards
> #ip route add 100.100.251.216/29 dev eth1 src 100.100.251.218
> #ip route add 200.200.64.136/29 dev eth2 src 200.200.64.140
> 
> # set default route for traffic originating from this machine to go via third router
> # not necessarily what other people may want to do, as you may want outgoing traffic
> # going through eth1/eth2 in some load balanced way
> ip route add default via 192.168.0.252
> 
> ip rule add from 100.100.251.218 table T1
> ip rule add from 200.200.64.140 table T2
> 
> #not sure what this does, but is recommended in Advanced Routing HOWTO
> ip route add 192.168.0.0/24 dev eth0 table T1
> ip route add 200.200.64.136/29 dev eth2 table T1
> ip route add 127.0.0.0/8 dev lo table T1
> ip route add 192.168.0.0/24 dev eth0 table T2
> ip route add 100.100.251.216/29 dev eth1 table T2
> ip route add 127.0.0.0/8 dev lo table T2
> 
> #route based on mark
> ip rule add fwmark 11 table T1
> ip rule add fwmark 12 table T2
> 
> 
> ================================================
> 
> 
> Regards,
> 
> Matt.
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Techside
> Security
> Sent: 04 January 2007 09:37
> To: netfilter@lists.netfilter.org
> Subject: 2 Internet connection and one local network
> 
> 
> Hi,
> in my company I have to switch to another provider and for a while I
> have to maintain both the internet connection.
> I have 2 server that is reachable from internet that is natted 1:1 with
> local ip.
> 
> 
> INTERNET OLD (32 public ip)	INTERNET NEW (32 public ip)
> 	|			|
> 	|			|
> 	-------------------------
> 	|			|
> 	|	FIREWALL	|
> 	|			|
> 	-------------------------
> 		|
> 		|
> 		LAN (private network)
> 
> 
> Now, the firewall nat all the connection from static ip to local ip for
> the 2 server (WEB, MAIL) and for the navigation of the client.
> 
> public ip 1 -----> FRW  ------> local mail server ip
> public ip 2 -----> FRW  ------> local web server ip
> 
> client navigation ------> FRW --------> default public ip (! mail,! web)
> 
> 
> The problem is that I can't let to be reachable the server from both
> internet connection. Now work only for one connection (with iproute2 and
> rules) based on the source local ip of the server.
> 
> I have tried with MARK, CONNMARK, CONNTRACK but I'm confused about it.
> There is a way to make this working ?
> 
> All info are very appreciated.
> Thanks.
> 
> 
> 
> 
> 


