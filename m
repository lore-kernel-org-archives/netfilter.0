From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 20:18:23 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510012011230.17163@filer.marasystems.com>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<200510011827.15384.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510011859560.15331@filer.marasystems.com>
	<200510012003.35387.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510012003.35387.marek.zachara@conexe.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Marek Zachara wrote:

> irongate:~# tcpdump -ni eth1 udp port 4569
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
> 19:56:41.784463 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP, length: 25
> 19:56:43.785641 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP, length: 25

Odd..

> Any suggestions what i could be doing wrong?

What does /proc/net/ip_conntrack say about the session?

   grep 84.16.64.240 /proc/net/ip_conntrack

udp      17 50 src=10.1.1.3 dst=10.1.1.1 sport=32793 dport=53 src=10.1.1.1 dst=10.1.1.3 sport=53 dport=32793 [ASSURED] use=1

the second number (50) is the current timeout of that session.

the first src/dst/port pair is the original packet. The second pair is the 
NAT info.

And what timeouts is your kernel configured with?

   cat /proc/sys/net/ipv4/netfilter/conntrack_udp_timeout
   cat /proc/sys/net/ipv4/netfilter/conntrack_udp_timeout_stream

Regards
Henrik

