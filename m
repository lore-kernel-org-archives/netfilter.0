From: Evgeniy Zaitsev <eightn@roger.net.ru>
Subject: CONNMARK patch do not work in kernel 2.6.9
Date: Sat, 4 Dec 2004 13:24:15 +0300
Message-ID: <1241129595.20041204132415@roger.net.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Resent-Message-Id: <20041204102412.199D943FD2@roger.roger.net.ru>
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

Hello.

I try to use latest patch-o-matic to
I have tried to use last patch-o-matic
(patch-o-matic-ng-20040621.tar.bz2 also do not work)
for addition of purpose CONNMARK in iptables on a kernel 2.6.9

But the patch is not set, as does not find the necessary lines of a code in a file
linux/net/ipv4/netfilter/ip_conntrack_standalone.c

================code===================
diff -uN --exclude .* --exclude *.o linux-2.4.3-pre3/net/ipv4/netfilter/ip_conntrack_standalone.c
linux-2.4.3-pre3-uml/net/ipv4/netfilter/ip_conntrack_standalone.c
--- linux-2.4.3-pre3/net/ipv4/netfilter/ip_conntrack_standalone.c       Thu Aug 10 21:35:15 2000
+++ linux-2.4.3-pre3-uml/net/ipv4/netfilter/ip_conntrack_standalone.c   Wed Mar 21 13:04:19 2001
@@ -92,6 +92,9 @@
                len += sprintf(buffer + len, "[UNCONFIRMED] ");
        len += sprintf(buffer + len, "use=%u ",
                       atomic_read(&conntrack->ct_general.use));
+#if defined(CONFIG_IP_NF_CONNTRACK_MARK)
+       len += sprintf(buffer + len, "mark=%ld ", conntrack->mark);
+#endif
        len += sprintf(buffer + len, "\n");

        return len;  
================/code==================



The code "&conntrack->ct_general.use" is mentioned in this piece:

Will not prompt where to make changes what it would be possible to activate CONNMARK on a nucleus 2.6.9?
================code===================
if (test_bit(IPS_ASSURED_BIT, &conntrack->status))
   if (seq_printf(s, "[ASSURED] "))
      return 1;

if (seq_printf(s, "use=%u\n", atomic_read(&conntrack->ct_general.use)))
   return 1;

return 0;
}

================/code==================

but this code is completely not similar that in a patch.

Prompt please, it is necessary to bring in what changes to a kernel
2.6.9, that CONNMARK would work?


-- 
Best regards,
 Evgeniy                          mailto:eightn@roger.net.ru


