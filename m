From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: double packet
Date: Fri, 09 Dec 2005 18:25:16 +0100
Message-ID: <BAY103-F24A4CAB54BDD1905665352B2450@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello.
I have a pretty strange problem with routing and iptables mark.
My firewall has a classic 3 NIC config: one nic connected to the
ISP routers, one network for DMZ and the third network for my
private network. Here is the schema:


	       HUB
HDSL router----+----ADSL router
		|
		|
     HDSL IP---eth0---ADSL IP
		|
		|
	+-------+------+
	|	       |
	|	       |
	|	       |
	|	       |
	|	       +-----eth1---ADSL public network and HDSL public network
	|	       |
	|	       |
	|	       |
	|	       |
	+-------+------+
		|
		|
	       eth2---172.16.1.1
		|
		|
		+----Private network 172.16.0.0/23


As you may see from the schema I have two internet connections:
one hdsl and one adsl (for surfing the internet).
This is the output from ip rule sh:

0:	from all lookup local
200:	from all fwmark 0x2 lookup test
32766:	from all lookup main
32767:	from all lookup default

This is the relevant piece of my firewall:

$IPTABLES -I FORWARD -s 172.16.1.15 --protocol icmp -j ACCEPT
$IPTABLES -t nat -I POSTROUTING -s 172.16.1.15 --protocol icmp -j SNAT --to 
'ADSL IP'
$IPTABLES -t mangle -I PREROUTING -s 172.16.1.15 --protocol icmp -j MARK 
--set-mark 2

This is the output from "ip route sh table main":

'HDSL router ip' dev eth0  scope link
'ADSL router ip' dev eth0  scope link
'ADSL public network' dev eth1  proto kernel  scope link  src 'ADSL IP'
'HDSL public network' dev eth1  proto kernel  scope link  src 'HDSL IP'
172.16.0.0/23 dev eth2  proto kernel  scope link  src 172.16.1.1
127.0.0.0/8 dev lo  scope link
default via 'HDSL router ip' dev eth0  metric 1

And this is the output from "ip route sh table test":

default via 'ADSL router ip' dev eth0  metric 1

So far, so good.
If I try to ping any host on the internet from the 172.16.1.15
box, packet are natted to 'ADSL IP' and then they are routed
through the ADSL router. But if I try to ping a system in the
DMZ with ip an address belonging to the 'HDSL public network'
I don't get any response. This is the tcpdump capture on the
eth0 for a single ip echo request:

tcpdump -p -n -i eth0 host ip 'HDSL public network host'
17:39:12.999287 IP 'ADSL IP' > 'HDSL public network host': ICMP echo 
request, id 256, seq 6656, length 40
17:39:13.037471 IP 'ADSL IP' > 'HDSL public network host': ICMP echo 
request, id 256, seq 6656, length 40

and this the tcpdump capture on the eth2:

tcpdump -p -n -i eth2 host ip 'HDSL public network host'
17:39:12.999001 IP 172.16.1.15 > 'HDSL public network host': ICMP echo 
request, id 256, seq 6656, length 40

On eth1 I don't see any packet. (Why!?)

As you may see tcpdump logs two icmp echo request
packets on the eth0 interface. Why?

I'm running linux vanilla 2.6.14 on Slackware 10.2
Can anyone help me?



