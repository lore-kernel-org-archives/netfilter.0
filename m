From: "Doc Nielsen" <WebMaster@DocNielsen.dk>
Subject: ip_tables.o not loading - nf_unregister_sockopt error
Date: Tue, 2 Sep 2003 21:03:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c37184$d6701fc0$7b01a8c0@Doc>
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

hey guys

Im having some trouble compiling and using iptables/netfilter
Its enabled in the kernel, and the modules are there, but when I try to load
them I get this:

root@server:~# modprobe ip_tables
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol
nf_unregister_sockopt
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol
nf_register_sockopt
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_tables.o: insmod ip_tables
failed

What am I doing wrong?

Please CC mail directly to me, as Im not subscribed to the list.
And yes, I have browsed the archives with no luck.

- Doc


