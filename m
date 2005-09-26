From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: "condition" patch for kernel 2.6
Date: Mon, 26 Sep 2005 15:00:55 +0200
Message-ID: <200509261500.55328@nienna>
References: <3115d56e05092604391bef627d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_HE/NDQ94fvWvIKa"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e05092604391bef627d@mail.gmail.com>
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
To: netfilter@lists.netfilter.org, afshin lamei <afshinlamei@gmail.com>

--Boundary-00=_HE/NDQ94fvWvIKa
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


  Hi,

On Monday 26 September 2005 13.39, afshin lamei wrote:
> dear all,
> 1- I want to use the "condition" patch in kernel 2.6.x, I remember
> that it was available only for kernel 2.4.x. Is it available now for
> 2.6?

  Yes, I've attached it. Unofficial, not supported, etc. I've used it 
with 2.6.11.

-- 
 Regards,
  Krisztian Kovacs

--Boundary-00=_HE/NDQ94fvWvIKa
Content-Type: text/x-diff; charset="iso-8859-1"; name="ipt_condition.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ipt_condition.patch"

Index: linux-2.6.11-ipsec/net/ipv4/netfilter/ipt_condition.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6.11-ipsec/net/ipv4/netfilter/ipt_condition.c	2005-03-03 15:17:53.826807876 +0100
@@ -0,0 +1,259 @@
+/*-------------------------------------------*\
+|          Netfilter Condition Module         |
+|                                             |
+|  Description: This module allows firewall   |
+|    rules to match using condition variables |
+|    stored in /proc files.                   |
+|                                             |
+|  Author: Stephane Ouellette     2002-10-22  |
+|          <ouellettes@videotron.ca>          |
+|                                             |
+|  History:                                   |
+|    2003-02-10  Second version with improved |
+|                locking and simplified code. |
+|                                             |
+|  This software is distributed under the     |
+|  terms of the GNU GPL.                      |
+\*-------------------------------------------*/
+
+#include<linux/module.h>
+#include<linux/proc_fs.h>
+#include<linux/spinlock.h>
+#include<linux/string.h>
+#include<asm/atomic.h>
+#include<linux/netfilter_ipv4/ip_tables.h>
+#include<linux/netfilter_ipv4/ipt_condition.h>
+
+
+#ifndef CONFIG_PROC_FS
+#error  "Proc file system support is required for this module"
+#endif
+
+
+MODULE_AUTHOR("Stephane Ouellette <ouellettes@videotron.ca>");
+MODULE_DESCRIPTION("Allows rules to match against condition variables");
+MODULE_LICENSE("GPL");
+
+
+struct condition_variable {
+	struct condition_variable *next;
+	struct proc_dir_entry *status_proc;
+	atomic_t refcount;
+        int enabled;   /* TRUE == 1, FALSE == 0 */
+};
+
+
+static rwlock_t list_lock;
+static struct condition_variable *head = NULL;
+static struct proc_dir_entry *proc_net_condition = NULL;
+
+
+static int
+ipt_condition_read_info(char *buffer, char **start, off_t offset,
+			int length, int *eof, void *data)
+{
+	struct condition_variable *var =
+	    (struct condition_variable *) data;
+
+	if (offset == 0) {
+		*start = buffer;
+		buffer[0] = (var->enabled) ? '1' : '0';
+		buffer[1] = '\n';
+		return 2;
+	}
+
+	*eof = 1;
+	return 0;
+}
+
+
+static int
+ipt_condition_write_info(struct file *file, const char *buffer,
+			 unsigned long length, void *data)
+{
+	struct condition_variable *var =
+	    (struct condition_variable *) data;
+
+	if (length) {
+	        /* Match only on the first character */
+		switch (buffer[0]) {
+		case '0':
+			var->enabled = 0;
+			break;
+		case '1':
+			var->enabled = 1;
+		}
+	}
+
+	return (int) length;
+}
+
+
+static int
+match(const struct sk_buff *skb,
+      const struct net_device *in,
+      const struct net_device *out,
+      const void *matchinfo,
+      int offset,
+      int *hotdrop)
+{
+	const struct condition_info *info =
+	    (const struct condition_info *) matchinfo;
+	struct condition_variable *var;
+	int condition_status = 0;
+
+	read_lock(&list_lock);
+
+	for (var = head; var; var = var->next) {
+		if (strcmp(info->name, var->status_proc->name) == 0) {
+			condition_status = var->enabled;
+			break;
+		}
+	}
+
+	read_unlock(&list_lock);
+
+	return condition_status ^ info->invert;
+}
+
+
+
+static int
+checkentry(const char *tablename, const struct ipt_ip *ip,
+	   void *matchinfo, unsigned int matchsize, unsigned int hook_mask)
+{
+	struct condition_info *info = (struct condition_info *) matchinfo;
+	struct condition_variable *var, *newvar;
+
+	if (matchsize != IPT_ALIGN(sizeof(struct condition_info)))
+		return 0;
+
+	/* The first step is to check if the condition variable already exists. */
+	/* Here, a read lock is sufficient because we won't change the list */
+	read_lock(&list_lock);
+
+	for (var = head; var; var = var->next) {
+		if (strcmp(info->name, var->status_proc->name) == 0) {
+			atomic_inc(&var->refcount);
+			read_unlock(&list_lock);
+			return 1;
+		}
+	}
+
+	read_unlock(&list_lock);
+
+	/* At this point, we need to allocate a new condition variable */
+	newvar = kmalloc(sizeof(struct condition_variable), GFP_KERNEL);
+
+	if (!newvar)
+		return -ENOMEM;
+
+	/* Create the condition variable's proc file entry */
+	newvar->status_proc = create_proc_entry(info->name, 0644, proc_net_condition);
+
+	if (!newvar->status_proc) {
+	  /*
+	   * There are two possibilities:
+	   *  1- Another condition variable with the same name has been created, which is valid.
+	   *  2- There was a memory allocation error.
+	   */
+		kfree(newvar);
+		read_lock(&list_lock);
+
+		for (var = head; var; var = var->next) {
+			if (strcmp(info->name, var->status_proc->name) == 0) {
+				atomic_inc(&var->refcount);
+				read_unlock(&list_lock);
+				return 1;
+			}
+		}
+
+		read_unlock(&list_lock);
+		return -ENOMEM;
+	}
+
+	atomic_set(&newvar->refcount, 1);
+	newvar->enabled = 0;
+	newvar->status_proc->owner = THIS_MODULE;
+	newvar->status_proc->data = newvar;
+	wmb();
+	newvar->status_proc->read_proc = ipt_condition_read_info;
+	newvar->status_proc->write_proc = ipt_condition_write_info;
+
+	write_lock(&list_lock);
+
+	newvar->next = head;
+	head = newvar;
+
+	write_unlock(&list_lock);
+
+	return 1;
+}
+
+
+static void
+destroy(void *matchinfo, unsigned int matchsize)
+{
+	struct condition_info *info = (struct condition_info *) matchinfo;
+	struct condition_variable *var, *prev = NULL;
+
+	if (matchsize != IPT_ALIGN(sizeof(struct condition_info)))
+		return;
+
+	write_lock(&list_lock);
+
+	for (var = head; var && strcmp(info->name, var->status_proc->name);
+	     prev = var, var = var->next);
+
+	if (var && atomic_dec_and_test(&var->refcount)) {
+		if (prev)
+			prev->next = var->next;
+		else
+			head = var->next;
+
+		write_unlock(&list_lock);
+		remove_proc_entry(var->status_proc->name, proc_net_condition);
+		kfree(var);
+	} else
+		write_unlock(&list_lock);
+}
+
+
+static struct ipt_match condition_match = {
+	.name = "condition",
+	.match = &match,
+	.checkentry = &checkentry,
+	.destroy = &destroy,
+	.me = THIS_MODULE
+};
+
+
+static int __init
+init(void)
+{
+	int errorcode;
+
+	rwlock_init(&list_lock);
+	proc_net_condition = proc_mkdir("ipt_condition", proc_net);
+
+	if (proc_net_condition) {
+	        errorcode = ipt_register_match(&condition_match);
+
+		if (errorcode)
+			remove_proc_entry("ipt_condition", proc_net);
+	} else
+		errorcode = -EACCES;
+
+	return errorcode;
+}
+
+
+static void __exit
+fini(void)
+{
+	ipt_unregister_match(&condition_match);
+	remove_proc_entry("ipt_condition", proc_net);
+}
+
+module_init(init);
+module_exit(fini);
Index: linux-2.6.11-ipsec/net/ipv4/netfilter/Makefile
===================================================================
--- linux-2.6.11-ipsec.orig/net/ipv4/netfilter/Makefile	2005-03-03 15:17:50.724537092 +0100
+++ linux-2.6.11-ipsec/net/ipv4/netfilter/Makefile	2005-03-03 15:17:53.826807876 +0100
@@ -60,6 +60,7 @@
 obj-$(CONFIG_IP_NF_MATCH_PHYSDEV) += ipt_physdev.o
 obj-$(CONFIG_IP_NF_MATCH_COMMENT) += ipt_comment.o
 obj-$(CONFIG_IP_NF_MATCH_U32) += ipt_u32.o
+obj-$(CONFIG_IP_NF_MATCH_CONDITION) += ipt_condition.o
 
 # targets
 obj-$(CONFIG_IP_NF_TARGET_REJECT) += ipt_REJECT.o
Index: linux-2.6.11-ipsec/include/linux/netfilter_ipv4/ipt_condition.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6.11-ipsec/include/linux/netfilter_ipv4/ipt_condition.h	2005-03-03 15:17:53.827807641 +0100
@@ -0,0 +1,11 @@
+#ifndef __IPT_CONDITION_MATCH__
+#define __IPT_CONDITION_MATCH__
+
+#define CONDITION_NAME_LEN  32
+
+struct condition_info {
+	char name[CONDITION_NAME_LEN];
+	int  invert;
+};
+
+#endif
Index: linux-2.6.11-ipsec/net/ipv4/netfilter/Kconfig
===================================================================
--- linux-2.6.11-ipsec.orig/net/ipv4/netfilter/Kconfig	2005-03-03 15:17:50.725536857 +0100
+++ linux-2.6.11-ipsec/net/ipv4/netfilter/Kconfig	2005-03-03 15:17:53.828807406 +0100
@@ -388,6 +388,16 @@
 	
 	  Details and examples are in the kernel module source.	
 
+config IP_NF_MATCH_CONDITION
+	tristate  'condition match support'
+	depends on IP_NF_IPTABLES
+	help
+	  This option allows you to match firewall rules against condition
+	  variables stored in the /proc/net/ipt_condition directory.
+
+	  If you want to compile it as a module, say M here and read
+	  Documentation/modules.txt.  If unsure, say `N'.
+
 # `filter', generic and specific targets
 config IP_NF_FILTER
 	tristate "Packet filtering"

--Boundary-00=_HE/NDQ94fvWvIKa--

