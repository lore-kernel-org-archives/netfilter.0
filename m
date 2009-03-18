From: Haim Daniel <haim.daniel@expand.com>
Subject: [PATCH 2.4.37] iptables: handle IPT_RETURN from user target
Date: Wed, 18 Mar 2009 15:32:29 +0200
Message-ID: <49C0F7ED.40106@expand.com>
Reply-To: haimdaniel@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

This patch handles IPT_RETURN retcode for user's iptables' targets 
(modules).

Up until now it was handled only for the built-in RETURN iptables' target
and IPT_RETURN in a user target resulted in a NF_DROP.

Signed-off-by: Haim Daniel <haimdaniel@gmail.com>
---

diff -Nuap a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.c
--- a/net/ipv4/netfilter/ip_tables.c    2009-03-18 14:00:12.000000000 +0200
+++ b/net/ipv4/netfilter/ip_tables.c    2009-03-18 14:00:29.000000000 +0200
@@ -383,6 +383,11 @@ ipt_do_table(struct sk_buff **pskb,
 
                 if (verdict == IPT_CONTINUE)
                     e = (void *)e + e->next_offset;
+                else if (verdict == IPT_RETURN) {
+                    e = back;
+                    back = get_entry(table_base,
+                             back->comefrom);
+                }
                 else
                     /* Verdict */
                     break;

