From: Dominic Irrcher <dirrcher@colosseum.com>
Subject: game server rules
Date: Fri, 10 Jan 2003 13:46:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A0B5F46E38ADD411967800805F777E983B81BF@colosrva.colosseum.com>
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

hi,

was wondering if anyone has successfully setup a ruleset for a quake3 server
with iptables ?

this is the ruleset i have in place so far, but i keep getting the following
error:

NET_SendPacket ERROR: Operation not permitted to <connecting ip>:27960

is there something that i am missing for the ruleset ?

iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p udp --dport 27960 -m state
--state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p tcp --dport 27960 -m state
--state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $IFACE1 -s $IPADDR3 -p udp --sport 27960 -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $IFACE1 -s $IPADDR3 -p tcp --sport 27960 -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p udp --dport 27960 -m state
--state ESTABLISHED -j ACCEPT
iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p tcp --dport 27960 -m state
--state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $IFACE1 -s $IPADDR3 -p udp --dport 27960 -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $IFACE1 -s $IPADDR3 -p tcp --dport 27960 -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p udp --sport 27960 -m state
--state ESTABLISHED -j ACCEPT
iptables -A INPUT -i $IFACE1 -d $IPADDR3 -p tcp --sport 27960 -m state
--state ESTABLISHED -j ACCEPT

thanks in advance for any suggestions

Dom

