From: fd4 <fd4@itsec4u.de>
Subject: delete conntrack entry - how
Date: Mon, 30 Jul 2007 13:32:40 +0200
Message-ID: <20070730133240.730c0ef4@alice.thum.ath.cx>
References: <46AB38AC.5050509@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46AB38AC.5050509@netfilter.org>
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

hi,

I want to delete this stale conntrack entry:
conntrack -L
tcp      6 259996 ESTABLISHED src=85.214.110.62
dst=217.199.190.234 sport=44895 dport=80 packets=1 bytes=40 [UNREPLIED]
src=217.199.190.234 dst=85.214.110.62 sport=80 dport=44895 packets=0
bytes=0 mark=0 use=1

iptstate shows:
Source Destination  Proto State       TTL
85.214.110.62:44895 217.199.190.234:80 tcp ESTABLISHED  72:10:59

so I dont want to wait 72 hours more;
I've already reduced some values,
e.g.
echo 216000
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established

but the connection was already EST

an example for deleteing such an entry within the man page would be fine

Regards

