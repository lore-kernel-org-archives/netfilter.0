From: Lars Nixdorf <lars.nixdorf@genion.de>
Subject: confused fw block int and ext traffic ..
Date: Wed, 24 Nov 2004 13:58:15 +0100
Message-ID: <41A48567.9070507@genion.de>
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

hi,

i want to make a ruleset, that protect the intranet. Ok, no Problem. But 
it should also protect the "internet". That means only .. simple :

ruleset extern_to_intern:
	allow some ports to fw
	allow some ports through fw to some hosts / subnets
	deny all

ruleset intern_to extern:
	allow some ports (most of them) to fw
	allow some ports trough fw to some hosts in internet
	deny all

ruleset vpn-connections
	allow all to intranet and fw
	deny all (also traffic to internet)

ruleset for special handling
	some nats / port forwards intern <--> intern

ruleset for masquarading
	masq. all behind offical ip

My interfaces are:
	eth0 - intranet interface
	eth1 - internet interface


.. short lines from my configs :
-----------------------------------------------------------------------
-N extern
-A extern -m state --state ESTABLISHED,RELATED -j ACCEPT
-A extern -i $INTERNET -m state --state NEW -p tcp --dport 22 -j ACCEPT
-A extern -i $INTERNET -m state --state NEW -p tcp --dport 25 -j ACCEPT
-A extern -i $INTERNET -p 50 -j ACCEPT 

-A extern -i $INTERNET -p 51 -j ACCEPT
-A extern -i $INTERNET -m state --state NEW -p udp --dport 500 -j ACCEPT
-A extern -j DROP
-A INPUT -j extern
-A FORWARD -j extern


-N intern
-A intern -m state --state ESTABLISHED,RELATED -j ACCEPT
-A intern -m state --state NEW -i ! $LOCAL -j ACCEPT

-A intern -i $LOCAL -m state --state NEW -p tcp -d $FIREWALL --dport 25
	-j ACCEPT
-A intern -i $LOCAL -m state --state NEW -p udp -d $FIREWALL --dport 37
	-j ACCEPT
-A intern -i $LOCAL -m state --state NEW -p tcp -d $FIREWALL --dport 37
	-j ACCEPT
-A intern -i $LOCAL -m state --state NEW -p udp -d $FIREWALL --dport 53
	-j ACCEPT
-A intern -i $LOCAL -m state --state NEW -p tcp -d $FIREWALL --dport 53
	-j ACCEPT
-A intern -i $LOCAL -m state --state NEW -p tcp -d $FIREWALL --dport 80
	-j ACCEPT
-A intern -j DROP
-A INPUT -j intern
-A FORWARD -j intern

-N vpn
-A vpn -i ppp+ -j ACCEPT
-A INPUT -j vpn
-A FORWARD -j vpn

iptables -t nat -A POSTROUTING -o $INTERNET -j MASQUERADE

--------------------------------------------------------------------------

it doesnt work correctly . :/ Need some hints, how to organize this 
construction, or a suggest for a better one.

Thx all
   Best regards

Lars Nixdorf


