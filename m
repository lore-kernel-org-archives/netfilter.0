From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: What order ? I'm confused ...
Date: Tue, 13 Jan 2004 12:57:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401131257.26388.mrakotom@free.fr>
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

Hi all ,
I run Iptables 1.2.9 on a 2.4.24 kernel :

I dont understand the way a (network) packet follows through the iptables rules .

For example , for the INPUT  table , i have this set of rules (in this order) :
#========================================
iptables -P INPUT DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 10080 -j ACCEPT
iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT

iptables -A INPUT -j REJECT

iptables -A INPUT -j LOG --log-level info --log-prefix "iptables_rktmb : "
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -A INPUT -i ppp0 -m unclean -j DROP
#========================================

well , my questions are :

If a packet arrives ( fromt the Net , ppp0 interface ) , what rule does he meet first ? 
( "iptables -P INPUT DROP" or "iptables -A INPUT -i ppp0 -m unclean -j DROP") 

I am tempted to answer : "iptables -A INPUT -i ppp0 -m unclean -j DROP" ...
so that the filtering process begins from the last rule to the first .
Am I right ?

So . 
On the other hand , when i read man iptables about logging ( LOG target ) : i see that
the LOG target should be _after_ the DROP ( or REJECT ) so that I understand that if the packet comes from the net , 
it meets the first rule first and the last one at last .

What's the truth ?

i put the rule about the "unclean" stuff at the end because i read somewhere in a tutorial that its best place is there ...
-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


