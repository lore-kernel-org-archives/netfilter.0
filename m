From: rodolphe <rodolphe.averty@oxance.com>
Subject: CONNTRACK problem
Date: Tue, 31 May 2005 11:57:35 +0200
Message-ID: <429C350F.1010802@oxance.com>
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

Hello,

i have two router connected to the internet and i want to divide my tcp 
connection between them.

this is my iptables script :

############################################################################ 

iptables -t mangle -N INTERNET
iptables -t mangle -N INTERNET_ROUTER_1
iptables -t mangle -N INTERNET_ROUTER_2

#le paquet est t'il en direction d'internet
iptables -o eth2 -t mangle -A POSTROUTING -p tcp -d ! 10.0.0.0/8 -j 
INTERNET

iptables -t mangle -N INTERNET
iptables -t mangle -A INTERNET -j CONNMARK --restore-mark

# 50 % connection vers router 1
iptables -t mangle -A INTERNET -m mark --mark 0 -p TCP --tcp-flags ALL 
SYN -m random --average 50 -j MARK --set-mark 1
iptables -t mangle -A INTERNET -m mark --mark 1 -j CONNMARK --save-mark
iptables -t mangle -A INTERNET -m mark --mark 1 -j INTERNET_ROUTER_1

# le reste vers router 2
iptables -t mangle -A INTERNET -m mark --mark 0 -p TCP --tcp-flags ALL 
SYN -j MARK --set-mark 2
iptables -t mangle -A INTERNET -m mark --mark 2 -j CONNMARK --save-mark
iptables -t mangle -A INTERNET -m mark --mark 2 -j INTERNET_ROUTER_2

iptables -t mangle -A INTERNET -j RETURN

iptables -t mangle -A INTERNET_ROUTER_1 -j ROUTE --gw 10.0.2.200
iptables -t mangle -A INTERNET_ROUTER_2 -j ROUTE --gw 10.0.2.254
############################################################################ 


it seems that i have a problem with CONNTRACK marking, i don't retreive 
the mark to route correctly the packet.

My config is kernel 2.6.11.10 with iptables 1.3.1 and last pom.

Thanks for help


