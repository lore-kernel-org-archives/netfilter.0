From: Jean Wolter <jw5-nf@os.inf.tu-dresden.de>
Subject: Wrong patch in Netfilter Security Advisory: Conntrack list_del() DoS ?
Date: 10 Aug 2003 00:54:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86ekzua1d1.fsf@os.inf.tu-dresden.de>
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

Date: 10 Aug 2003 00:49:59 +0200

Hello,

I just tried to apply the recommended patch to a pristine 2.4.20
kernel and the following part fails:

diff -urN --exclude-from=diff.exclude linux-2.4.20-base/net/ipv4/netfilter/ip_conntrack_proto_tcp.c linux-2.4.20-del/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
--- linux-2.4.20-base/net/ipv4/netfilter/ip_conntrack_proto_tcp.c Tue Feb 18 17:07:26 2003
+++ linux-2.4.20-del/net/ipv4/netfilter/ip_conntrack_proto_tcp.c Fri Feb 21 17:03:35 2003
@@ -192,7 +192,7 @@
	  have an established connection: this is a fairly common
	  problem case, so we can delete the conntrack
	  immediately.  --RR */
-	if (!(conntrack->status & IPS_SEEN_REPLY) && tcph->rst) {
+	if (!test_bit(IPS_SEEN_REPLY_BIT, &conntrack->status) && tcph->rst) {
        	WRITE_UNLOCK(&tcp_lock);
        	if (del_timer(&conntrack->timeout))
            		conntrack->timeout.function((unsigned long)conntrack);

In the original 2.4.20 ip_contrack_prot_tcp the code looks like
follows (starting at line 189):

        WRITE_UNLOCK(&tcp_lock);

        /* If only reply is a RST, we can consider ourselves not to
           have an established connection: this is a fairly common
           problem case, so we can delete the conntrack
           immediately.  --RR */
        if (!(conntrack->status & IPS_SEEN_REPLY) && tcph->rst) {
                if (del_timer(&conntrack->timeout))
                        conntrack->timeout.function((unsigned long)conntrack);

The WRITE_UNLOCK ist not part of the if clause, it is done before
checking the conntrack state. Therefore the patch fails at this point.

Is this a bug in the patch, in the linux archive or did I do anything
wrong?

regards, 
Jean


