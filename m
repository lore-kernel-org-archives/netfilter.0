From: "Thompson,Peter" <p.thompson@ncl.cjp.co.uk>
Subject: A little bit of progress but still a bit stuck
Date: Thu, 5 Sep 2002 16:26:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8B6215367908D311A346009027719CE5016C7DCF@CJP_NCLE_NT01>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

The saga so far.... 

I have a box running suse 8
kernel 2.4.18  iptables version 1.2.7a



this machine is a mail relay / firewall
i wish to bounce email out via a seperate gateway (cisco router)

Interface (eth0) Intel Pro 100 217.41.191.37
Interface (eth1) 10.1.0.19 3com Boomarang  NAT'ed at Cisco router
Tried swapping them round etc.

so far with various help from people on this list ive gotten to here...

from the internet i can ping both hosts and connect to services on each IP
address meaning im using the gateways correctly for returning packets etc.

however as you can see im trying to mark all packets bound for port 25
and send them out via 10.1.0.21

this isnt working.

when i try to telnet to port 25 of anything i get a 

"no route to host"  

and in TCP dump on "eth0" i get a "admin prohibited filter" msg
and nothing out on eth1

Can anyone advise as to what the problem could be here ?

Thanks in advance

Pete


this is the scirpt i use to set things up.

echo 1 > /proc/sys/net/ipv4/ip_forward 
#echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
#echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter 



ip route add default via 217.41.191.38 table T1
ip route add default via 10.1.0.21 table T2
# adds rules from the tables i guess.
ip rule add from 217.41.191.37 table T1
ip rule add from 10.1.0.19 table T2
#need this to see other internal machines...
route add -net 10.0.0.0/8 gw 10.1.0.21 dev eth1


#marking packets
iptables -t mangle -A OUTPUT -p tcp --dport 25 -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -p tcp --dport 25 -j MARK --set-mark 1
ip route add default via 10.1.0.21 dev eth1 table 10
ip ru add fwmark 1 table 10




















