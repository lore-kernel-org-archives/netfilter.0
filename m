From: Payal <payal@hotpop.com>
Subject: masquerading and access
Date: Wed, 30 Oct 2002 12:32:00 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030070200.GA1367@localhost.localdomain>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,
	I want to implement a masquerading proxy ( I hope I am clear
here ) on a network of 50 machines. Out of this only 25 machines say
192.168.0.1-192.168.0.25 need to connect to net. Squid will be the
caching proxy.
I just want to know whether I have to put a rule as,

1. #iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
Then I redirect all request to port 80 to port 3128 of squid
Then I make necessary acl changes in squid.conf to allow only
192.168.0.1-192.168.0.25.
And then for ftp I put  iptables ACCEPT rules for these ips in iptables ruleset
and block rest.
				OR

2. #iptables -t nat -A POSTROUTING -s 192.168.0.1/xx -j MASQUERADE
Will this rule do? Also what to put in place of xx for allowing
192.168.0.1-192.168.0.25. I also I will have to put port redirection of
80 to 3128 and use squid access list.

Can someone tell me which of the solution should I implement and if they
are right.

Thanks a lot in advance and bye.
-Payal





