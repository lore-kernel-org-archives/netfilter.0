From: <fred_sos@swing.be>
Subject: unresolved symbol nf_unregister_sockopt
Date: Mon, 7 Jul 2003 20:46:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c344b8$1c681400$3200a8c0@fred>
Reply-To: <fred_sos@swing.be>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello the list,

I have just compiled a new kernel on my debian box, but I got this messages
when I try to load iptables:


/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o:
unresolved symbol nf_unregister_sockopt
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o:
unresolved symbol nf_register_sockopt
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o:
insmod /lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o
failed
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o: insmod
ip_tables failed
iptables v1.2.8: can't initialize iptables table `filter': iptables who? (do
you need to insmod?)

Perhaps iptables or your kernel needs to be upgraded.



Any idea?


Regrads

Fred



