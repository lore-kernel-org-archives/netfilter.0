From: wschroed@schroedernet.net
Subject: DNAT Now Working
Date: Wed, 21 Apr 2004 10:33:37 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36410.64.81.147.25.1082561617.squirrel@home.schroedernet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
References: 
In-Reply-To: 
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

The DNAT is now working thanks Alistair...
The reason I was seeing it get dropped inbound on eth1 is that I was
accessing the server from my internal LAN. Not a problem...
The reason I was working with PREROUTING was to ensure that  the IPtables
looging app I am finishing will accomodate DNAT,PREROUTING,FORWARD dropped
traffic. I already have POSTROUTING,SNAT,and FORWARD logging working.
Thanks for your help.
Will

BEFORE
# Pre-Routing Redirect for Web Server. in from public ip (eth4) to pss1
(eth3)
iptables -A FORWARD -i eth4 -o eth3 -p tcp --sport $unprivports -d
10.0.0.57 --dport
8080 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth3 -o eth4 -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -A FORWARD -i eth4 -o eth3 -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -t nat -A PREROUTING -i eth4 -p tcp --sport $unprivports -d
$ExtIP2 --dport
8080 -j DNAT --to-destination 10.0.0.57:8080

AFTER
PREROUTE rules at top of list, since preroute is hit first....
# Pre-Routing Redirect for Web Server. in from public ip (eth4) to pss1
(eth3)
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport $unprivports -d
$ExtIP1 --dport
80 -j DNAT --to-destination 10.0.0.57:8080
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport $unprivports -d
$ExtIP1 --dport
22 -j DNAT --to-destination 10.0.0.57:5757




AFTER
forward rules at bottom...
#   Forward
#Forward for pss2
iptables -A FORWARD -i eth0 -o eth3 -p tcp -s x.x.x.x --sport $unprivports -d
10.0.0.57 --dport 8080 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -p tcp -s x.x.x.x --sport $unprivports -d
10.0.0.57 --dport 5757 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -m state --state ESTABLISHED,RELATED
-j ACCEPT
# Forward for internal LAN
iptables -A FORWARD -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
iptables -A FORWARD -o eth1 -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
###########################################################
## Log anything not allowed via FORWARD Rule
iptables -A FORWARD -j LOG --log-prefix "Forward Host Deny Fwd"
#######################################################################################################
#Postrouting
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ExtIP1








