From: Raido Kurel <raido@elin.ttu.ee>
Subject: dnat problem in transparent firewall
Date: Tue, 3 Aug 2004 14:36:08 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408031436.08494.raido@elin.ttu.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello!

I want to change destination ip in incoming packets. If someone has time to 
answer, read on... In OpenBSD it worked automatically in same hardware 
configuration, just
rdr on xl0 from any to aaa.aaa.aaa.12 -> aaa.aaa.aaa.13
to /etc/pf.rules and thats all.

Configuration:
|LAN|---|ROUTER|---|TRANSPARENT FIREWALL|--|INTERNET GATEWAY|
LAN network: aaa.aaa.aaa.xxx/24
|ROUTER|: integrated into LAN switch
|TRANSPARENT FIREWALL|: a Linux 2.6.x box with iptables 1.2.9
ebtables 2.0.6. without IP's on traffic interfaces br0=eth1+eth2

router-internet gateway network: aaa.aaa.bbb.cdx/31

Needs:
To change destination IP of some packets coming from Internet. ie to change 
dastination IP from aaa.aaa.aaa.12 to aaa.aaa.aaa.13

What I have done:
iptables rule:

iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest 
aaa.aaa.aaa.13

I thought, that this should do it, but it is not working. If I add this rule, 
the incoming packet is dropped in this rule.
For example:

if I log traffic and then change destination ip, I see traffic:

iptables -t nat -A PREROUTING -j LOG
iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest 
aaa.aaa.aaa.13

If I try to change destination IP and then log, I do not see traffic:

iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest 
aaa.aaa.aaa.13
iptables -t nat -A PREROUTING -j LOG

Seems like destination ip rule swollows packet. What could be wrong or is 
there other means to acomplish what I need?

Thanks,
Raido


