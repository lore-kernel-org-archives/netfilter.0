From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] get rid of __MOD_INC_USE_COUNT/__MOD_DEC_USE_COUNT
Date: Fri, 21 Mar 2003 16:49:09 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030321164909.A10752@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@transmeta.com
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

As the netfilter folks don't seem to have any interest in 2.5 currently
I decided to fix their last uses of those old module interfaces myself.
The implementation (get a reference first and release it again when
not actually needed) might be slightly suboptimial but the netfilter
team should just fix it if/when they get any interest in Linux 2.5/2.6.

Also fix the MOD_INC_USE_COUNT/MOD_DEC_USE_COUNT to give more accurate
deprecation warnings.


--- 1.52/include/linux/module.h	Fri Feb 21 22:50:41 2003
+++ edited/include/linux/module.h	Fri Mar 21 12:30:33 2003
@@ -69,8 +69,6 @@
   __attribute__ ((unused, alias(__stringify(name))))
 
 #define THIS_MODULE (&__this_module)
-#define MOD_INC_USE_COUNT _MOD_INC_USE_COUNT(THIS_MODULE)
-#define MOD_DEC_USE_COUNT __MOD_DEC_USE_COUNT(THIS_MODULE)
 
 /*
  * The following license idents are currently accepted as indicating free
@@ -107,8 +105,6 @@
 #define MODULE_ALIAS(alias)
 #define MODULE_GENERIC_TABLE(gtype,name)
 #define THIS_MODULE ((struct module *)0)
-#define MOD_INC_USE_COUNT	do { } while (0)
-#define MOD_DEC_USE_COUNT	do { } while (0)
 #define MODULE_LICENSE(license)
 #endif
 
@@ -418,20 +414,6 @@
 #define symbol_request(x) try_then_request_module(symbol_get(x), "symbol:" #x)
 
 /* BELOW HERE ALL THESE ARE OBSOLETE AND WILL VANISH */
-static inline void __deprecated __MOD_INC_USE_COUNT(struct module *module)
-{
-	__unsafe(module);
-	/*
-	 * Yes, we ignore the retval here, that's why it's deprecated.
-	 */
-	try_module_get(module);
-}
-
-static inline void __deprecated __MOD_DEC_USE_COUNT(struct module *module)
-{
-	module_put(module);
-}
-
 #define SET_MODULE_OWNER(dev) ((dev)->owner = THIS_MODULE)
 
 struct obsolete_modparm {
@@ -445,14 +427,7 @@
 struct obsolete_modparm __parm_##var __attribute__((section("__obsparm"))) = \
 { __stringify(var), type };
 
-#else
-#define MODULE_PARM(var,type)
-#endif
-
-/* People do this inside their init routines, when the module isn't
-   "live" yet.  They should no longer be doing that, but
-   meanwhile... */
-static inline void __deprecated _MOD_INC_USE_COUNT(struct module *module)
+static inline void __deprecated MOD_INC_USE_COUNT(struct module *module)
 {
 	__unsafe(module);
 
@@ -460,9 +435,23 @@
 	local_inc(&module->ref[get_cpu()].count);
 	put_cpu();
 #else
-	try_module_get(module);
+	(void)try_module_get(module);
 #endif
 }
+
+static inline void __deprecated MOD_DEC_USE_COUNT(struct module *module)
+{
+	module_put(module);
+}
+
+#define MOD_INC_USE_COUNT	MOD_INC_USE_COUNT(THIS_MODULE)
+#define MOD_DEC_USE_COUNT	MOD_DEC_USE_COUNT(THIS_MODULE)
+#else
+#define MODULE_PARM(var,type)
+#define MOD_INC_USE_COUNT	do { } while (0)
+#define MOD_DEC_USE_COUNT	do { } while (0)
+#endif
+
 #define __MODULE_STRING(x) __stringify(x)
 
 /*
===== net/ipv4/netfilter/arp_tables.c 1.4 vs edited =====
--- 1.4/net/ipv4/netfilter/arp_tables.c	Thu Mar 20 03:42:26 2003
+++ edited/net/ipv4/netfilter/arp_tables.c	Fri Mar 21 12:25:13 2003
@@ -912,19 +912,25 @@
 		goto free_newinfo_counters_untrans_unlock;
 	}
 
+	/* Get a reference in advance, we're not allowed fail later */
+	if (!try_module_get(t->me)) {
+		ret = -EBUSY;
+		goto free_newinfo_counters_untrans_unlock;
+	}
+
 	oldinfo = replace_table(t, tmp.num_counters, newinfo, &ret);
 	if (!oldinfo)
-		goto free_newinfo_counters_untrans_unlock;
+		goto put_module;
 
 	/* Update module usage count based on number of rules */
 	duprintf("do_replace: oldnum=%u, initnum=%u, newnum=%u\n",
 		oldinfo->number, oldinfo->initial_entries, newinfo->number);
-	if (t->me && (oldinfo->number <= oldinfo->initial_entries) &&
- 	    (newinfo->number > oldinfo->initial_entries))
-		__MOD_INC_USE_COUNT(t->me);
-	else if (t->me && (oldinfo->number > oldinfo->initial_entries) &&
-	 	 (newinfo->number <= oldinfo->initial_entries))
-		__MOD_DEC_USE_COUNT(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) || 
+	    (newinfo->number <= oldinfo->initial_entries)) 
+		module_put(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) &&
+	    (newinfo->number <= oldinfo->initial_entries))
+		module_put(t->me);
 
 	/* Get the old counters. */
 	get_counters(oldinfo, counters);
@@ -938,6 +944,8 @@
 	up(&arpt_mutex);
 	return 0;
 
+ put_module:
+	module_put(t->me);
  free_newinfo_counters_untrans_unlock:
 	up(&arpt_mutex);
  free_newinfo_counters_untrans:
===== net/ipv4/netfilter/ip_tables.c 1.12 vs edited =====
--- 1.12/net/ipv4/netfilter/ip_tables.c	Thu Mar 20 03:42:26 2003
+++ edited/net/ipv4/netfilter/ip_tables.c	Fri Mar 21 12:26:12 2003
@@ -1106,19 +1106,26 @@
 		goto free_newinfo_counters_untrans_unlock;
 	}
 
+	/* Get a reference in advance, we're not allowed fail later */
+	if (!try_module_get(t->me)) {
+		ret = -EBUSY;
+		goto free_newinfo_counters_untrans_unlock;
+	}
+
+
 	oldinfo = replace_table(t, tmp.num_counters, newinfo, &ret);
 	if (!oldinfo)
-		goto free_newinfo_counters_untrans_unlock;
+		goto put_module;
 
 	/* Update module usage count based on number of rules */
 	duprintf("do_replace: oldnum=%u, initnum=%u, newnum=%u\n",
 		oldinfo->number, oldinfo->initial_entries, newinfo->number);
-	if (t->me && (oldinfo->number <= oldinfo->initial_entries) &&
- 	    (newinfo->number > oldinfo->initial_entries))
-		__MOD_INC_USE_COUNT(t->me);
-	else if (t->me && (oldinfo->number > oldinfo->initial_entries) &&
-	 	 (newinfo->number <= oldinfo->initial_entries))
-		__MOD_DEC_USE_COUNT(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) || 
+	    (newinfo->number <= oldinfo->initial_entries)) 
+		module_put(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) &&
+	    (newinfo->number <= oldinfo->initial_entries))
+		module_put(t->me);
 
 	/* Get the old counters. */
 	get_counters(oldinfo, counters);
@@ -1132,6 +1139,8 @@
 	up(&ipt_mutex);
 	return 0;
 
+ put_module:
+	module_put(t->me);
  free_newinfo_counters_untrans_unlock:
 	up(&ipt_mutex);
  free_newinfo_counters_untrans:
===== net/ipv6/netfilter/ip6_tables.c 1.15 vs edited =====
--- 1.15/net/ipv6/netfilter/ip6_tables.c	Thu Mar 20 03:43:40 2003
+++ edited/net/ipv6/netfilter/ip6_tables.c	Fri Mar 21 14:06:26 2003
@@ -1178,19 +1178,25 @@
 		goto free_newinfo_counters_untrans_unlock;
 	}
 
+	/* Get a reference in advance, we're not allowed fail later */
+	if (!try_module_get(t->me)) {
+		ret = -EBUSY;
+		goto free_newinfo_counters_untrans_unlock;
+	}
+
 	oldinfo = replace_table(t, tmp.num_counters, newinfo, &ret);
 	if (!oldinfo)
-		goto free_newinfo_counters_untrans_unlock;
+		goto put_module;
 
 	/* Update module usage count based on number of rules */
 	duprintf("do_replace: oldnum=%u, initnum=%u, newnum=%u\n",
 		oldinfo->number, oldinfo->initial_entries, newinfo->number);
-	if (t->me && (oldinfo->number <= oldinfo->initial_entries) &&
- 	    (newinfo->number > oldinfo->initial_entries))
-		__MOD_INC_USE_COUNT(t->me);
-	else if (t->me && (oldinfo->number > oldinfo->initial_entries) &&
-	 	 (newinfo->number <= oldinfo->initial_entries))
-		__MOD_DEC_USE_COUNT(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) || 
+	    (newinfo->number <= oldinfo->initial_entries)) 
+		module_put(t->me);
+	if ((oldinfo->number > oldinfo->initial_entries) &&
+	    (newinfo->number <= oldinfo->initial_entries))
+		module_put(t->me);
 
 	/* Get the old counters. */
 	get_counters(oldinfo, counters);
@@ -1204,6 +1210,8 @@
 	up(&ip6t_mutex);
 	return 0;
 
+ put_module:
+	module_put(t->me);
  free_newinfo_counters_untrans_unlock:
 	up(&ip6t_mutex);
  free_newinfo_counters_untrans:
