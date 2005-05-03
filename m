From: lester@pccegoa.org
Subject: Setting up a Squid proxy server behind a firewall
Date: Tue, 3 May 2005 10:53:07 +0530 (IST)
Message-ID: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I have setup a squid proxy server for our internal network. It works just
fine without a firewall setup. When I tried to apply rules to block
everything except the ports that squid requires, the proxy failed to get
passed the firewall. I have setup squid to use port 3128.
The rules applied are below:
(eth0 : internal n/w interface
eth2 : external n/w interface)

modprobe ip_conntrack_ftp

modprobe iptable_nat

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP

iptables -A INPUT -i eth0 -p tcp --dport 3128 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o eth2 -p tcp --sport 3128 -m state --state NEW -j ACCEPT

iptables -t filter -A INPUT -i eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A INPUT -i eth1 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT

iptables -t filter -A OUTPUT -o eth0 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A OUTPUT -o eth1 -p tcp -m state --state
RELATED,ESTABLISHED -j ACCEPT
....

What I would like to know is that, does squid use any other ports besides
3128 when contacting the external world? Or are the rules that I have
applied totally wrong? I am using modprobe iptable_nat, echo 1 >
/proc/sys/net/ipv4/ip_forward for port forwarding to internal servers.
(which works). I have not appended those rules.

Thanks for your help.
Lester

