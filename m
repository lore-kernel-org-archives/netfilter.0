From: Damjan <gdamjan@mail.net.mk>
Subject: [PATCH]: make ipt_XOR.c compile with recent kernels
Date: Wed, 21 Dec 2005 19:58:03 +0100
Message-ID: <20051221185803.GB25744@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

skb_ip_make_writable has been renamed to skb_make_writable in more
recent kernels:

--- net/ipv4/netfilter/ipt_XOR.c~       2005-12-21 17:36:53.000000000 +0100
+++ net/ipv4/netfilter/ipt_XOR.c        2005-12-21 17:37:11.000000000 +0100
@@ -31,7 +31,7 @@
        struct udphdr *udph;
        int i, j, k;

-       if (!skb_ip_make_writable(pskb, (*pskb)->len))
+       if (!skb_make_writable(pskb, (*pskb)->len))
                return NF_DROP;

        iph = (*pskb)->nh.iph;

-- 
damjan | дамјан
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

