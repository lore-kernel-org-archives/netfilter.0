From: Michael Gale <mgale@utilitran.com>
Subject: Setting a default policy does not work :(
Date: Tue, 2 Dec 2003 08:33:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202083315.212b9e05.mgale@utilitran.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	I have a firewall with multiple interfaces. When I try to set a default policy it does not work. I believe this is a problem with netfilter and multiple interfaces.

Example:

Inserting the following to the bottom of my firewall script:

### Causes all traffic to or from the box on either interface to be dropped regardless of all other rules.

iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP

### Causes all traffic to or from the box on either interface to be dropped regardless of all other rules.

iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
itpables -A FORWARD -j DROP

### But when adding:

iptables -A INPUT -i $EXT_FACE -j DROP
iptables -A INPUT -i $INT_FACE -j DROP
iptables -A OUTPUT -o $EXT_FACE -j DROP
iptables -A OUTPUT -o $INT_FACE -j DROP
iptables -A FORWARD -i $EXT_FACE -j DROP
iptables -A FORWARD -i $INT_FACE -j DROP

The firewall rules behave as they should only allow traffic that matches the rules and the default policy now is DROP based on the rules.

I believe the problem is caused by having multiple interfaces -- if you only have 1 interface then the default policy is applied to this interface. But if you have multiple networks cards any rule or policy that does not specify a network interface becomes a global rule .. as in (iptables -A INPUT -j DROP) and takes affect before any other rules that are based upon network interface.


So if you have these two rules in your firewall script:
iptables -A INPUT -i $EXT_FACE -j ACCEPT
iptables -A INPUT -j DROP

Even though the first rule is to accept all traffic everything would be denied because the second rule becomes like a global policy since no interface is associated with it and it actually gets checked before the packet can make it to the second rule.

-- 
Michael Gale
Network Administrator
Utilitran Corporation

