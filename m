From: David Fokkema <fokkema@nat.vu.nl>
Subject: Iptables 'hang'
Date: Mon, 23 Dec 2002 13:21:12 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.43.0212231312460.4174-100000@selene.nat.vu.nl>
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

Hi there!

I have a problem, and I think it is the same as one posted earlier, but
the solution given is not correct. I run kernel 2.4.20, iptables 1.2.7a. I
have this, as a test:

iptables -P INPUT DROP
iptables -A INPUT -p tcp -j ACCEPT

And this will hang my system for about 1 minute. In that time, I noticed
(with the use of tcpdump) that iptables tries to connect to port 111 on my
box using udp. Why? Anyway, because the policy is DROP, it won't connect,
and an ICMP message is not sent back. If I take a policy of ACCEPT, ICMP
messages will be sent and iptables behaves fine. When I want to list my
rules using iptables -L, it again hangs for some time (trying to connect
to 111) and finally gives the list. The rule mentioned above is added, it
only took some time. If I do iptables -nL (notice the 'n') it all works
fine. Why is this? It is very annoying, particulary since another linux
partition on my box doesn't have this problem. If I chroot to that
partition, so using the same kernel version, iptables does not hang. Same
version of iptables, same version of libc. What is going on here? Am I
missing a configuration file somewhere? What does iptables want with udp
port 111? If someone can clear this up for me, I'd be very happy to hear
about it.

Regards,

David


