From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: Why does nf_log_register bind loggers?
Date: Thu, 3 Feb 2011 18:54:34 +0100
Message-ID: <20110203175430.GA8864@buero.cygnusnet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Suppose you boot into a modularized Linux system and add an iptables -j
NFLOG rule. The automatic module loading causes xt_NFLOG to be loaded
and all goes well. Then you add an iptables -j LOG rule. Again the
module ipt_LOG would be loaded which causes a call to nf_log_register to
register the ipt_LOG logger for AF_INET. This function is also kind
enough to nf_log_bind_pf (manually inlined) this logger. Incidentally
the NFLOG rule targets the same protocol family. At this point you
better find a way to turn console logging off, because otherwise you get
swamped with log messages (with priority 0 (EMERG) if your kernel is
old). What caused those messages again? A simple iptables -A ... -j LOG.

Looks like I solved task 3 in "Ghosts of Unix past, part 2: Conflated
designs" (http://lwn.net/Articles/412131/) by pointing out how the
automatic binding of loggers at registration time can seriously harm the
user.

Still a few things are not yet clear to me. If I unbind ipt_LOG the
logging continues. It seems like the ipt_LOG logger has no use. Why is
it bound in the first place?

Is this automatic binding of loggers during registration considered part
of the kernel API? It caused quite a bit of confusion and is likely to
cause confusion in future (for instance when module load orders change).
I therefore suggest to simply remove the automatic binding. Note that
for NFPROTO_UNSPEC no binding will occur, so the API is also
inconsistent with itself.

Helmut

PS: Here is a patch for Pablo:
diff --git a/net/netfilter/nf_log.c b/net/netfilter/nf_log.c
--- a/net/netfilter/nf_log.c
+++ b/net/netfilter/nf_log.c
@@ -49,14 +49,8 @@ int nf_log_register(u_int8_t pf, struct nf_logger *logger)
 	if (pf == NFPROTO_UNSPEC) {
 		for (i = NFPROTO_UNSPEC; i < NFPROTO_NUMPROTO; i++)
 			list_add_tail(&(logger->list[i]), &(nf_loggers_l[i]));
-	} else {
-		/* register at end of list to honor first register win */
+	} else
 		list_add_tail(&logger->list[pf], &nf_loggers_l[pf]);
-		llog = rcu_dereference_protected(nf_loggers[pf],
-						 lockdep_is_held(&nf_log_mutex));
-		if (llog == NULL)
-			rcu_assign_pointer(nf_loggers[pf], logger);
-	}
 
 	mutex_unlock(&nf_log_mutex);
