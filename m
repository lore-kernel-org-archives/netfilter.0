From: "Marius Cristian CONSTANTIN" <mconstantin@speedymail.org>
Subject: ECN target does not behave as expected
Date: Tue, 7 Jan 2003 10:53:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004101c2b62a$37489320$a268c451@Marius>
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

    I am running a firewall based on 2.4.20 kernel and 1.2.7a iptables
version. Also patch-o-matic is version 20020825.
    I am tryin to disable ECN per destination host, using -j ECN target
and --ecn-tcp-remove option.
    When I try to connect to the hosts using the rule in mangle table, if
the tcp_ecn option is enabled, tcpdump shows bad checksum. According to
documentation this is only a display bug, because tcpdump has a copy of
packet, and does not see entire info. Still, I cannot connect to the host.
    If I disable ECN entirely (by using /proc/sys/net/ipv4/tcp_ecn)
connection works perfectly. Any clue or indication to achieve the desire
results (ECN enabled in general, but disabled for some hosts)?.
    I've searched the archives, found someone reporting similar problem
(http://lists.netfilter.org/pipermail/netfilter/2002-August/037228.html),
but no answer.

Thanx in advance,
    Marius Cristian CONSTANTIN


