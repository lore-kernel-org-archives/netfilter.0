From: "Mcminn, Matt 8869" <melfinadev@chartermi.net>
Subject: iptables and port mapping
Date: Mon, 10 Mar 2003 01:05:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-117748330@back2.chartermi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm trying to get port mapping working on a debian box I
just set up - I'm pretty new to iptables, but I managed to
get everything working except for port mapping with the
netfilter howtos.

What I want to do is map port 80 on the external interface
(eth0) to port 80 on my internal (eth1) 192.168.0.2 ip
address.  So what I thought would do this is:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
DNAT --to 192.168.0.2
iptables -I INPUT -d 192.168.0.0/32 -j ACCEPT

If I understand that correctly, when the new packet comes
in on port 80, first the dest address should be changed to
192.168.0.2 by the first rule, then it should hit the INPUT
chain, and hit the second rule, which would accept it and
send it on to be routed to my local machine.  And this
doesn't work.

Any ideas?  Here's my iptables -vL (before running the
previous rules):

Chain INPUT (policy ACCEPT 0 packets, 0 bytes) 
pkts bytes target     prot opt in     out     source
             
destination
18137   16M block      all  --  any    any     anywhere
           
anywhere

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
             
destination
10303 5774K block      all  --  any    any     anywhere
           
anywhere

Chain OUTPUT (policy ACCEPT 11785 packets, 990K bytes)
 pkts bytes target     prot opt in     out     source
             
destination

Chain block (2 references)
 pkts bytes target     prot opt in     out     source
             
destination
26723   21M ACCEPT     all  --  any    any     anywhere
           
anywhere           state RELATED,ESTABLISHED
 1375  291K ACCEPT     all  --  !eth0  any     anywhere
           
anywhere           state NEW
  342  114K DROP       all  --  any    any     anywhere
           
anywhere

and iptables -vL -t nat:

Chain PREROUTING (policy ACCEPT 798 packets, 142K bytes)
 pkts bytes target     prot opt in     out     source
             
destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
             
destination
  435 21613 MASQUERADE  all  --  any    eth0    anywhere
           
anywhere

Chain OUTPUT (policy ACCEPT 37 packets, 2379 bytes)
 pkts bytes target     prot opt in     out     source
             
destination

Thanks

Matt

