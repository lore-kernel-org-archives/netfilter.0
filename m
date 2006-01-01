From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: "condition" patch for kernel 2.6
Date: Sun, 01 Jan 2006 23:10:06 +0100
Message-ID: <43B8533E.6050901@arcoscom.com>
References: <3115d56e05092604391bef627d@mail.gmail.com>
	<200509261500.55328@nienna>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509261500.55328@nienna>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: KOVACS Krisztian <hidden@balabit.hu>
Cc: netfilter@lists.netfilter.org

Don't need any patch for iptables?

Thanks

KOVACS Krisztian escribi=F3:

>   Hi,
>=20
> On Monday 26 September 2005 13.39, afshin lamei wrote:
>=20
>>dear all,
>>1- I want to use the "condition" patch in kernel 2.6.x, I remember
>>that it was available only for kernel 2.4.x. Is it available now for
>>2.6?
>=20
>=20
>   Yes, I've attached it. Unofficial, not supported, etc. I've used it=20
> with 2.6.11.
>=20
>=20
>=20
> ------------------------------------------------------------------------
>=20
> Index: linux-2.6.11-ipsec/net/ipv4/netfilter/ipt_condition.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6.11-ipsec/net/ipv4/netfilter/ipt_condition.c	2005-03-03 15:1=
7:53.826807876 +0100
> @@ -0,0 +1,259 @@
> +/*-------------------------------------------*\
> +|          Netfilter Condition Module         |
> +|                                             |
> +|  Description: This module allows firewall   |
> +|    rules to match using condition variables |
> +|    stored in /proc files.                   |
> +|                                             |
> +|  Author: Stephane Ouellette     2002-10-22  |
> +|          <ouellettes@videotron.ca>          |
> +|                                             |
> +|  History:                                   |
> +|    2003-02-10  Second version with improved |
> +|                locking and simplified code. |
> +|                                             |
> +|  This software is distributed under the     |
> +|  terms of the GNU GPL.                      |
> +\*-------------------------------------------*/
> +
> +#include<linux/module.h>
> +#include<linux/proc_fs.h>
> +#include<linux/spinlock.h>
> +#include<linux/string.h>
> +#include<asm/atomic.h>
> +#include<linux/netfilter_ipv4/ip_tables.h>
> +#include<linux/netfilter_ipv4/ipt_condition.h>
> +
> +
> +#ifndef CONFIG_PROC_FS
> +#error  "Proc file system support is required for this module"
> +#endif
> +
> +
> +MODULE_AUTHOR("Stephane Ouellette <ouellettes@videotron.ca>");
> +MODULE_DESCRIPTION("Allows rules to match against condition variables");
> +MODULE_LICENSE("GPL");
> +
> +
> +struct condition_variable {
> +	struct condition_variable *next;
> +	struct proc_dir_entry *status_proc;
> +	atomic_t refcount;
> +        int enabled;   /* TRUE =3D=3D 1, FALSE =3D=3D 0 */
> +};
> +
> +
> +static rwlock_t list_lock;
> +static struct condition_variable *head =3D NULL;
> +static struct proc_dir_entry *proc_net_condition =3D NULL;
> +
> +
> +static int
> +ipt_condition_read_info(char *buffer, char **start, off_t offset,
> +			int length, int *eof, void *data)
> +{
> +	struct condition_variable *var =3D
> +	    (struct condition_variable *) data;
> +
> +	if (offset =3D=3D 0) {
> +		*start =3D buffer;
> +		buffer[0] =3D (var->enabled) ? '1' : '0';
> +		buffer[1] =3D '\n';
> +		return 2;
> +	}
> +
> +	*eof =3D 1;
> +	return 0;
> +}
> +
> +
> +static int
> +ipt_condition_write_info(struct file *file, const char *buffer,
> +			 unsigned long length, void *data)
> +{
> +	struct condition_variable *var =3D
> +	    (struct condition_variable *) data;
> +
> +	if (length) {
> +	        /* Match only on the first character */
> +		switch (buffer[0]) {
> +		case '0':
> +			var->enabled =3D 0;
> +			break;
> +		case '1':
> +			var->enabled =3D 1;
> +		}
> +	}
> +
> +	return (int) length;
> +}
> +
> +
> +static int
> +match(const struct sk_buff *skb,
> +      const struct net_device *in,
> +      const struct net_device *out,
> +      const void *matchinfo,
> +      int offset,
> +      int *hotdrop)
> +{
> +	const struct condition_info *info =3D
> +	    (const struct condition_info *) matchinfo;
> +	struct condition_variable *var;
> +	int condition_status =3D 0;
> +
> +	read_lock(&list_lock);
> +
> +	for (var =3D head; var; var =3D var->next) {
> +		if (strcmp(info->name, var->status_proc->name) =3D=3D 0) {
> +			condition_status =3D var->enabled;
> +			break;
> +		}
> +	}
> +
> +	read_unlock(&list_lock);
> +
> +	return condition_status ^ info->invert;
> +}
> +
> +
> +
> +static int
> +checkentry(const char *tablename, const struct ipt_ip *ip,
> +	   void *matchinfo, unsigned int matchsize, unsigned int hook_mask)
> +{
> +	struct condition_info *info =3D (struct condition_info *) matchinfo;
> +	struct condition_variable *var, *newvar;
> +
> +	if (matchsize !=3D IPT_ALIGN(sizeof(struct condition_info)))
> +		return 0;
> +
> +	/* The first step is to check if the condition variable already exists.=
 */
> +	/* Here, a read lock is sufficient because we won't change the list */
> +	read_lock(&list_lock);
> +
> +	for (var =3D head; var; var =3D var->next) {
> +		if (strcmp(info->name, var->status_proc->name) =3D=3D 0) {
> +			atomic_inc(&var->refcount);
> +			read_unlock(&list_lock);
> +			return 1;
> +		}
> +	}
> +
> +	read_unlock(&list_lock);
> +
> +	/* At this point, we need to allocate a new condition variable */
> +	newvar =3D kmalloc(sizeof(struct condition_variable), GFP_KERNEL);
> +
> +	if (!newvar)
> +		return -ENOMEM;
> +
> +	/* Create the condition variable's proc file entry */
> +	newvar->status_proc =3D create_proc_entry(info->name, 0644, proc_net_co=
ndition);
> +
> +	if (!newvar->status_proc) {
> +	  /*
> +	   * There are two possibilities:
> +	   *  1- Another condition variable with the same name has been created=
, which is valid.
> +	   *  2- There was a memory allocation error.
> +	   */
> +		kfree(newvar);
> +		read_lock(&list_lock);
> +
> +		for (var =3D head; var; var =3D var->next) {
> +			if (strcmp(info->name, var->status_proc->name) =3D=3D 0) {
> +				atomic_inc(&var->refcount);
> +				read_unlock(&list_lock);
> +				return 1;
> +			}
> +		}
> +
> +		read_unlock(&list_lock);
> +		return -ENOMEM;
> +	}
> +
> +	atomic_set(&newvar->refcount, 1);
> +	newvar->enabled =3D 0;
> +	newvar->status_proc->owner =3D THIS_MODULE;
> +	newvar->status_proc->data =3D newvar;
> +	wmb();
> +	newvar->status_proc->read_proc =3D ipt_condition_read_info;
> +	newvar->status_proc->write_proc =3D ipt_condition_write_info;
> +
> +	write_lock(&list_lock);
> +
> +	newvar->next =3D head;
> +	head =3D newvar;
> +
> +	write_unlock(&list_lock);
> +
> +	return 1;
> +}
> +
> +
> +static void
> +destroy(void *matchinfo, unsigned int matchsize)
> +{
> +	struct condition_info *info =3D (struct condition_info *) matchinfo;
> +	struct condition_variable *var, *prev =3D NULL;
> +
> +	if (matchsize !=3D IPT_ALIGN(sizeof(struct condition_info)))
> +		return;
> +
> +	write_lock(&list_lock);
> +
> +	for (var =3D head; var && strcmp(info->name, var->status_proc->name);
> +	     prev =3D var, var =3D var->next);
> +
> +	if (var && atomic_dec_and_test(&var->refcount)) {
> +		if (prev)
> +			prev->next =3D var->next;
> +		else
> +			head =3D var->next;
> +
> +		write_unlock(&list_lock);
> +		remove_proc_entry(var->status_proc->name, proc_net_condition);
> +		kfree(var);
> +	} else
> +		write_unlock(&list_lock);
> +}
> +
> +
> +static struct ipt_match condition_match =3D {
> +	.name =3D "condition",
> +	.match =3D &match,
> +	.checkentry =3D &checkentry,
> +	.destroy =3D &destroy,
> +	.me =3D THIS_MODULE
> +};
> +
> +
> +static int __init
> +init(void)
> +{
> +	int errorcode;
> +
> +	rwlock_init(&list_lock);
> +	proc_net_condition =3D proc_mkdir("ipt_condition", proc_net);
> +
> +	if (proc_net_condition) {
> +	        errorcode =3D ipt_register_match(&condition_match);
> +
> +		if (errorcode)
> +			remove_proc_entry("ipt_condition", proc_net);
> +	} else
> +		errorcode =3D -EACCES;
> +
> +	return errorcode;
> +}
> +
> +
> +static void __exit
> +fini(void)
> +{
> +	ipt_unregister_match(&condition_match);
> +	remove_proc_entry("ipt_condition", proc_net);
> +}
> +
> +module_init(init);
> +module_exit(fini);
> Index: linux-2.6.11-ipsec/net/ipv4/netfilter/Makefile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.11-ipsec.orig/net/ipv4/netfilter/Makefile	2005-03-03 15:17:=
50.724537092 +0100
> +++ linux-2.6.11-ipsec/net/ipv4/netfilter/Makefile	2005-03-03 15:17:53.82=
6807876 +0100
> @@ -60,6 +60,7 @@
>  obj-$(CONFIG_IP_NF_MATCH_PHYSDEV) +=3D ipt_physdev.o
>  obj-$(CONFIG_IP_NF_MATCH_COMMENT) +=3D ipt_comment.o
>  obj-$(CONFIG_IP_NF_MATCH_U32) +=3D ipt_u32.o
> +obj-$(CONFIG_IP_NF_MATCH_CONDITION) +=3D ipt_condition.o
> =20
>  # targets
>  obj-$(CONFIG_IP_NF_TARGET_REJECT) +=3D ipt_REJECT.o
> Index: linux-2.6.11-ipsec/include/linux/netfilter_ipv4/ipt_condition.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6.11-ipsec/include/linux/netfilter_ipv4/ipt_condition.h	2005-=
03-03 15:17:53.827807641 +0100
> @@ -0,0 +1,11 @@
> +#ifndef __IPT_CONDITION_MATCH__
> +#define __IPT_CONDITION_MATCH__
> +
> +#define CONDITION_NAME_LEN  32
> +
> +struct condition_info {
> +	char name[CONDITION_NAME_LEN];
> +	int  invert;
> +};
> +
> +#endif
> Index: linux-2.6.11-ipsec/net/ipv4/netfilter/Kconfig
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.11-ipsec.orig/net/ipv4/netfilter/Kconfig	2005-03-03 15:17:5=
0.725536857 +0100
> +++ linux-2.6.11-ipsec/net/ipv4/netfilter/Kconfig	2005-03-03 15:17:53.828=
807406 +0100
> @@ -388,6 +388,16 @@
>  =09
>  	  Details and examples are in the kernel module source.=09
> =20
> +config IP_NF_MATCH_CONDITION
> +	tristate  'condition match support'
> +	depends on IP_NF_IPTABLES
> +	help
> +	  This option allows you to match firewall rules against condition
> +	  variables stored in the /proc/net/ipt_condition directory.
> +
> +	  If you want to compile it as a module, say M here and read
> +	  Documentation/modules.txt.  If unsure, say `N'.
> +
>  # `filter', generic and specific targets
>  config IP_NF_FILTER
>  	tristate "Packet filtering"

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

