From: Gabriel C Millerd <gmillerd@qualhost.com>
Subject: syntax help
Date: Thu, 10 Oct 2002 20:08:12 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210101846130.8201-100000@nlx>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


i have your typical broadband connection and a trusty sparc5 debian
machine that i use for a firewall / nat for my home network. i cannot get
a newer iptables capabile kernel to run on the little guy and thus i am
working with ipchains.

i am having problems figuring out how to:

 * nat/masquarade internal network
 * allow incoming ssh traffic to my network from outside
 * allow all outgoing traffic from my network
 * allow all incoming traffic to my network that is 'established'
 * deny & log all everything else

i have been toying with lots of scripts of this nature ...

ipchains -F
ipchains -P input ACCEPT
ipchains -P forward DENY
ipchains -P output ACCEPT
ipchains -A input -p udp -i eth1 --dport 22 -j ACCEPT
ipchains -A input -p tcp -i eth1 --dport 22 -j ACCEPT
ipchains -A forward -i eth1 -j MASQ
ipchains -A input -i eth1 -j DENY

... most of which basically make the machine dead in the water as far as
forwarding packets since they lack the 'established' like commands here:

iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED --j ACCEPT
iptables -A INPUT -p tcp --tcp-option ! 2 -j REJECT --reject-with tcp-reset

can anyone show me the light here? i have truly tried to investigate this
i believe everywhere i could.


