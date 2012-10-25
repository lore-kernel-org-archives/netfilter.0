From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel panic
Date: Thu, 25 Oct 2012 10:19:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210251009400.31762@blackhole.kfki.hu>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com> <CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com> <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com> <alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
 <CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com> <alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu> <CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com> <CADuigkXm99qcdm-GcaLSQQt0vreK7WxTs4AXv6sZKH+jxe4hDQ@mail.gmail.com>
 <alpine.DEB.2.00.1210181425120.2232@blackhole.kfki.hu> <CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com> <alpine.DEB.2.00.1210181439560.2232@blackhole.kfki.hu> <CADuigkXgXLkoivronrBwuYSQo+faQG9Xx=F8=G33hss7s5Tfgg@mail.gmail.com>
 <CADuigkU+S9-9SjT6=VFYr93NAdk42Yrw7PyfgSkhgg_hZKakBQ@mail.gmail.com> <alpine.DEB.2.00.1210191028520.5049@blackhole.kfki.hu> <CADuigkWVW3Lyij-goXypXAD4SrXEi3-YdKrjAL1kXxnz=1qJwA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkWVW3Lyij-goXypXAD4SrXEi3-YdKrjAL1kXxnz=1qJwA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 19 Oct 2012, Ricardo Klein wrote:

> so are you a ipsec developer?
> If you need help to test something, I can help you.

I develop ipset :-). So, here follows the patch on top of 6.14, which 
restores the support of kernels below 2.6.35. I have tested the 
compilation against 2.6.32.57. It'd be great if you could run the 
testsuite in ipset.

diff --git a/kernel/include/linux/netfilter/ipset/ip_set.h b/kernel/include/linux/netfilter/ipset/ip_set.h
index 81d9213..1217faf 100644
--- a/kernel/include/linux/netfilter/ipset/ip_set.h
+++ b/kernel/include/linux/netfilter/ipset/ip_set.h
@@ -210,8 +210,13 @@ enum ip_set_kopt {
 #include <linux/netfilter/x_tables.h>
 #include <linux/stringify.h>
 #include <linux/vmalloc.h>
+#include <linux/version.h>
 #include <net/netlink.h>
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 35)
+#define xt_action_param	xt_match_param
+#endif
+
 #define _IP_SET_MODULE_DESC(a, b, c)		\
 	MODULE_DESCRIPTION(a " type of IP sets, revisions " b "-" c)
 #define IP_SET_MODULE_DESC(a, b, c)		\
diff --git a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
index ef9acd3..df6eb04 100644
--- a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
+++ b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
@@ -4,6 +4,9 @@
 #include <linux/rcupdate.h>
 #include <linux/jhash.h>
 #include <linux/netfilter/ipset/ip_set_timeout.h>
+#ifndef rcu_dereference_bh
+#define rcu_dereference_bh(p)	rcu_dereference(p)
+#endif
 
 #define CONCAT(a, b, c)		a##b##c
 #define TOKEN(a, b, c)		CONCAT(a, b, c)
diff --git a/kernel/net/netfilter/xt_set.c b/kernel/net/netfilter/xt_set.c
index 865a9e5..0556151 100644
--- a/kernel/net/netfilter/xt_set.c
+++ b/kernel/net/netfilter/xt_set.c
@@ -27,6 +27,14 @@ MODULE_ALIAS("ip6t_set");
 MODULE_ALIAS("ipt_SET");
 MODULE_ALIAS("ip6t_SET");
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 35)
+#define CHECK_OK	1
+#define CHECK_FAIL(err)	0
+#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,35) */
+#define CHECK_OK	0
+#define CHECK_FAIL(err)	(err)
+#endif
+
 static inline int
 match_set(ip_set_id_t index, const struct sk_buff *skb,
 	  const struct xt_action_param *par,
@@ -94,19 +102,19 @@ set_match_v0_checkentry(const struct xt_mtchk_param *par)
 	if (index == IPSET_INVALID_ID) {
 		pr_warning("Cannot find set indentified by id %u to match\n",
 			   info->match_set.index);
-		return -ENOENT;
+		return CHECK_FAIL(-ENOENT);
 	}
 	if (info->match_set.u.flags[IPSET_DIM_MAX-1] != 0) {
 		pr_warning("Protocol error: set match dimension "
 			   "is over the limit!\n");
 		ip_set_nfnl_put(info->match_set.index);
-		return -ERANGE;
+		return CHECK_FAIL(-ERANGE);
 	}
 
 	/* Fill out compatibility data */
 	compat_flags(&info->match_set);
 
-	return 0;
+	return CHECK_OK;
 }
 
 static void
@@ -117,6 +125,60 @@ set_match_v0_destroy(const struct xt_mtdtor_param *par)
 	ip_set_nfnl_put(info->match_set.index);
 }
 
+/* Revision 1 */
+
+static bool
+set_match_v1(const struct sk_buff *skb, struct xt_action_param *par)
+{
+	const struct xt_set_info_match_v1 *info = par->matchinfo;
+	ADT_OPT(opt, par->family, info->match_set.dim,
+		info->match_set.flags, 0, UINT_MAX);
+
+	return match_set(info->match_set.index, skb, par, &opt,
+			 info->match_set.flags & IPSET_INV_MATCH);
+}
+
+static int
+set_match_v1_checkentry(const struct xt_mtchk_param *par)
+{
+	struct xt_set_info_match_v1 *info = par->matchinfo;
+	ip_set_id_t index;
+
+	index = ip_set_nfnl_get_byindex(info->match_set.index);
+
+	if (index == IPSET_INVALID_ID) {
+		pr_warning("Cannot find set indentified by id %u to match\n",
+			   info->match_set.index);
+		return CHECK_FAIL(-ENOENT);
+	}
+	if (info->match_set.dim > IPSET_DIM_MAX) {
+		pr_warning("Protocol error: set match dimension "
+			   "is over the limit!\n");
+		ip_set_nfnl_put(info->match_set.index);
+		return CHECK_FAIL(-ERANGE);
+	}
+
+	return CHECK_OK;
+}
+
+static void
+set_match_v1_destroy(const struct xt_mtdtor_param *par)
+{
+	struct xt_set_info_match_v1 *info = par->matchinfo;
+
+	ip_set_nfnl_put(info->match_set.index);
+}
+
+/* Revision 0 interface: backward compatible with netfilter/iptables */
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 35)
+#undef xt_action_param
+#define xt_action_param	xt_target_param
+#define CAST_TO_MATCH	(const struct xt_match_param *)
+#else
+#define	CAST_TO_MATCH
+#endif
+
 static unsigned int
 set_target_v0(struct sk_buff *skb, const struct xt_action_param *par)
 {
@@ -127,9 +189,9 @@ set_target_v0(struct sk_buff *skb, const struct xt_action_param *par)
 		info->del_set.u.compat.flags, 0, UINT_MAX);
 
 	if (info->add_set.index != IPSET_INVALID_ID)
-		ip_set_add(info->add_set.index, skb, par, &add_opt);
+		ip_set_add(info->add_set.index, skb, CAST_TO_MATCH par, &add_opt);
 	if (info->del_set.index != IPSET_INVALID_ID)
-		ip_set_del(info->del_set.index, skb, par, &del_opt);
+		ip_set_del(info->del_set.index, skb, CAST_TO_MATCH par, &del_opt);
 
 	return XT_CONTINUE;
 }
@@ -145,7 +207,7 @@ set_target_v0_checkentry(const struct xt_tgchk_param *par)
 		if (index == IPSET_INVALID_ID) {
 			pr_warning("Cannot find add_set index %u as target\n",
 				   info->add_set.index);
-			return -ENOENT;
+			return CHECK_FAIL(-ENOENT);
 		}
 	}
 
@@ -156,7 +218,7 @@ set_target_v0_checkentry(const struct xt_tgchk_param *par)
 				   info->del_set.index);
 			if (info->add_set.index != IPSET_INVALID_ID)
 				ip_set_nfnl_put(info->add_set.index);
-			return -ENOENT;
+			return CHECK_FAIL(-ENOENT);
 		}
 	}
 	if (info->add_set.u.flags[IPSET_DIM_MAX-1] != 0 ||
@@ -167,14 +229,14 @@ set_target_v0_checkentry(const struct xt_tgchk_param *par)
 			ip_set_nfnl_put(info->add_set.index);
 		if (info->del_set.index != IPSET_INVALID_ID)
 			ip_set_nfnl_put(info->del_set.index);
-		return -ERANGE;
+		return CHECK_FAIL(-ERANGE);
 	}
 
 	/* Fill out compatibility data */
 	compat_flags(&info->add_set);
 	compat_flags(&info->del_set);
 
-	return 0;
+	return CHECK_OK;
 }
 
 static void
@@ -188,49 +250,7 @@ set_target_v0_destroy(const struct xt_tgdtor_param *par)
 		ip_set_nfnl_put(info->del_set.index);
 }
 
-/* Revision 1 match and target */
-
-static bool
-set_match_v1(const struct sk_buff *skb, struct xt_action_param *par)
-{
-	const struct xt_set_info_match_v1 *info = par->matchinfo;
-	ADT_OPT(opt, par->family, info->match_set.dim,
-		info->match_set.flags, 0, UINT_MAX);
-
-	return match_set(info->match_set.index, skb, par, &opt,
-			 info->match_set.flags & IPSET_INV_MATCH);
-}
-
-static int
-set_match_v1_checkentry(const struct xt_mtchk_param *par)
-{
-	struct xt_set_info_match_v1 *info = par->matchinfo;
-	ip_set_id_t index;
-
-	index = ip_set_nfnl_get_byindex(info->match_set.index);
-
-	if (index == IPSET_INVALID_ID) {
-		pr_warning("Cannot find set indentified by id %u to match\n",
-			   info->match_set.index);
-		return -ENOENT;
-	}
-	if (info->match_set.dim > IPSET_DIM_MAX) {
-		pr_warning("Protocol error: set match dimension "
-			   "is over the limit!\n");
-		ip_set_nfnl_put(info->match_set.index);
-		return -ERANGE;
-	}
-
-	return 0;
-}
-
-static void
-set_match_v1_destroy(const struct xt_mtdtor_param *par)
-{
-	struct xt_set_info_match_v1 *info = par->matchinfo;
-
-	ip_set_nfnl_put(info->match_set.index);
-}
+/* Revision 1 target */
 
 static unsigned int
 set_target_v1(struct sk_buff *skb, const struct xt_action_param *par)
@@ -242,9 +262,9 @@ set_target_v1(struct sk_buff *skb, const struct xt_action_param *par)
 		info->del_set.flags, 0, UINT_MAX);
 
 	if (info->add_set.index != IPSET_INVALID_ID)
-		ip_set_add(info->add_set.index, skb, par, &add_opt);
+		ip_set_add(info->add_set.index, skb, CAST_TO_MATCH par, &add_opt);
 	if (info->del_set.index != IPSET_INVALID_ID)
-		ip_set_del(info->del_set.index, skb, par, &del_opt);
+		ip_set_del(info->del_set.index, skb, CAST_TO_MATCH par, &del_opt);
 
 	return XT_CONTINUE;
 }
@@ -260,7 +280,7 @@ set_target_v1_checkentry(const struct xt_tgchk_param *par)
 		if (index == IPSET_INVALID_ID) {
 			pr_warning("Cannot find add_set index %u as target\n",
 				   info->add_set.index);
-			return -ENOENT;
+			return CHECK_FAIL(-ENOENT);
 		}
 	}
 
@@ -271,7 +291,7 @@ set_target_v1_checkentry(const struct xt_tgchk_param *par)
 				   info->del_set.index);
 			if (info->add_set.index != IPSET_INVALID_ID)
 				ip_set_nfnl_put(info->add_set.index);
-			return -ENOENT;
+			return CHECK_FAIL(-ENOENT);
 		}
 	}
 	if (info->add_set.dim > IPSET_DIM_MAX ||
@@ -282,10 +302,10 @@ set_target_v1_checkentry(const struct xt_tgchk_param *par)
 			ip_set_nfnl_put(info->add_set.index);
 		if (info->del_set.index != IPSET_INVALID_ID)
 			ip_set_nfnl_put(info->del_set.index);
-		return -ERANGE;
+		return CHECK_FAIL(-ERANGE);
 	}
 
-	return 0;
+	return CHECK_OK;
 }
 
 static void
@@ -315,9 +335,9 @@ set_target_v2(struct sk_buff *skb, const struct xt_action_param *par)
 	    add_opt.timeout > UINT_MAX/MSEC_PER_SEC)
 		add_opt.timeout = UINT_MAX/MSEC_PER_SEC;
 	if (info->add_set.index != IPSET_INVALID_ID)
-		ip_set_add(info->add_set.index, skb, par, &add_opt);
+		ip_set_add(info->add_set.index, skb, CAST_TO_MATCH par, &add_opt);
 	if (info->del_set.index != IPSET_INVALID_ID)
-		ip_set_del(info->del_set.index, skb, par, &del_opt);
+		ip_set_del(info->del_set.index, skb, CAST_TO_MATCH par, &del_opt);
 
 	return XT_CONTINUE;
 }
diff --git a/netlink.patch b/netlink.patch
index e51d9ba..faa873b 100644
--- a/netlink.patch
+++ b/netlink.patch
@@ -44,16 +44,3 @@ index 373f1a9..8a3906a 100644
  #define NLA_PUT_STRING(skb, attrtype, value) \
  	NLA_PUT(skb, attrtype, strlen(value) + 1, value)
  
-diff --git a/net/netfilter/nfnetlink.c b/net/netfilter/nfnetlink.c
-index b4a4532..51dd302 100644
---- a/net/netfilter/nfnetlink.c
-+++ b/net/netfilter/nfnetlink.c
-@@ -35,7 +35,7 @@ MODULE_LICENSE("GPL");
- MODULE_AUTHOR("Harald Welte <laforge@netfilter.org>");
- MODULE_ALIAS_NET_PF_PROTO(PF_NETLINK, NETLINK_NETFILTER);
- 
--static char __initdata nfversion[] = "0.30";
-+static char __initdata nfversion[] = "0.30 with ipset netlink.patch";
- 
- static const struct nfnetlink_subsystem *subsys_table[NFNL_SUBSYS_COUNT];
- static DEFINE_MUTEX(nfnl_mutex);

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
