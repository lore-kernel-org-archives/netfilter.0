From: Guillermo Calvo <guillermocalvo@datacenter1.com>
Subject: ipsec nat and iptables
Date: Thu, 25 Aug 2005 11:31:02 -0400
Message-ID: <430DE436.5000200@datacenter1.com>
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


Hello

I'm trying to setup a network to network vpn using native ipsec support 
on Centos 4.1


Network A
eth0=  conected to internet
eth1= conected to private lan 192.168.1.1

Network B
eth0 conected to Internet
eth1= conected to private lan 192.168.2.1

From server A I'm able to ping 192.168.2.1 and viceversa but computers 
in the private lan can't see the other side

I'm using pre-shared keys also I set nat_transversal in racoon

Also I set my servers like iptables router
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

iptables -A FORWARD -i eth1 -o eth0
iptables -A FORWARD -i eth0 -o eth1

iptables -P INPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -i ethY -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE


Thanks in advance

Guillermo Calvo


