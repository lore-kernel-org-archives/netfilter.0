From: Jean-Marie <jm.orset@laposte.net>
Subject: mangle + TCP Flags
Date: Wed, 10 Dec 2003 11:08:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031210110849.7d0cd782.jm.orset@laposte.net>
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

Hello, can someone tell me if it is possible, thanks to the mangle table, to modify the flags of a TCP packet before it is routed.
I think to something like that:
iptables -t mangle -A INPUT -j TCPFLAG --set-flags FIN,URG
Thank you.

