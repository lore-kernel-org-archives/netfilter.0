From: "Simon Lodal" <simonl@mirrormind.com>
Subject: Automatic forwarding to own interfaces
Date: Tue, 23 Sep 2003 07:14:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309230714.AA48627750@mirrormind.com>
Reply-To: <simonl@mirrormind.com>
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
To: netfilter@lists.netfilter.org


Hello

I am seeing strange behaviour, wonder if anyone can confirm this, or else tell me that I have completely screwed my boxes.

My Linux box seems to automatically forward between it's own interfaces, effectively treating them all as one. Traffic coming in on one interface, destined for another interface, should in my mind pass through the FORWARD chain. Instead, it goes through INPUT/OUTPUT. Effectively then any local address can be accessed on any local interface.


Details:

The "victim" box is a Debian-3.0r1 with the default 2.4.18-bf2.4 kernel and iptables-1.2.6a. My other boxes with other 2.4.1[89] kernels behave the same.

Victim has two interfaces, eth0 (10.0.1.2/24) and eth1 (192.168.1.5/24).

Victim's /proc config:
/proc/sys/net/ipv4/ip_forward=0
/proc/sys/net/ipv4/rp_filter=1
/proc/sys/net/ipv4/conf/*/accept_source_route=0

Another host "evil" is on the 10.0.1.0/24 subnet, and has no way to reach the 192.168.1.0/24 subnet. It then configures itself to use victim as gateway to the 192.168.1.0/24 subnet. But since victim has disabled all forwarding, evil can still not reach any 192.168.1.0/24 hosts. Except...

The strange thing is that when evil does 'ping 192.168.1.5' it succeeds. It pings victim's eth1 through eth0.

The really strange thing is that victim does not treat the traffic as forwarding, but as locally destined traffic, going through INPUT and OUTPUT chains.

Log rules in INPUT, FORWARD and OUTPUT chains on victim show that a ping packet with dest=192.168.1.5 comes in through eth0, and a pong packet with src=192.168.1.5 is sent back through eth0. Packets go through INPUT and OUTPUT chains, not FORWARD. Effectively, it is as if eth0 was configured with 192.168.1.5.

Now ping is handled by kernel, so I tried with userspace, and got same result: An apache listening only on 192.168.1.5:80 will happily respond to requests from the 10.0.1.0/24 subnet, coming in on eth0.

Is all this really intentional? It makes no sense to me. Can anyone confirm this behaviour?

Simon



