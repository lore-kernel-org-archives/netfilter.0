From: Tom Smith <tom@openadventures.org>
Subject: PPP Routing
Date: Wed, 26 Feb 2003 10:59:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5D008A.7070804@openadventures.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

RedHat 7.3 Kernel 2.4.9-31
iptables 1.2.5

I have a working Firewall/VPN. Problem is that I need to create a 
seperate set of rules for each ppp# connection. For example, ppp0's 
ruleset would be:

$IPTABLES -A INPUT -i ppp0 -s $INTNET -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o ppp0 -s $INTNET -d $INTNET -j ACCEPT
$IPTABLES -A FORWARD -i ppp0 -d $INTNET -j ACCEPT
$IPTABLES -A FORWARD -o ppp0 -d $INTNET -j ACCEPT

Is there a way to dynamically create the ppp# as new connections come 
and go?

Tom
tom@openadventures.org



