From: "Chen Ding" <ding@packetlink.com>
Subject: Failing to manipulate IP headers
Date: Fri, 20 Sep 2002 15:29:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003801c260e4$75e77bf0$6501a8c0@JCC>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0034_01C260BA.8CA878F0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0034_01C260BA.8CA878F0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0035_01C260BA.8CA878F0"


------=_NextPart_001_0035_01C260BA.8CA878F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

I am trying to develop a customized NAT app based on netfilter =
framework. I have:
    a. Created a module
    b. Initialized and registered with netfilter
    c. Got sk_buff from the core

Currently, the program is very simple: just changes the receiver IP =
address (pre-routing)
and sender IP address (post-routing), and then forward the packets.=20

Everything worked fine except that after the packets forwarded to the =
destination, the
reading program on the destination machine reported reading error (-1), =
and errno 11
(don't know the reason).=20

After changed the IP address, I did recalculated the checksum, as =
follows (copied
from ip_nat_core.c):

            saddr =3D <the address to be changed to>;
            iph->check =3D ip_nat_cheat_check(~iph->saddr, saddr, =
iph->check);
            iph->saddr =3D saddr;

I did rechecked the checksum and it appeared to be good.=20

Having searched answers from the Internet and digged the code without =
results, I hope
someone here can help me out. I guess I must have messed up the packets. =


For your information, I have attached the tiny source code at the end of =
this email.

Your help is most appreciated!!!


Chen Ding



------=_NextPart_001_0035_01C260BA.8CA878F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am trying to develop a customized NAT =
app based=20
on netfilter framework. I have:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; a. Created a =
module</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; b. Initialized and =
registered=20
with netfilter</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; c. Got sk_buff from =
the=20
core</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Currently, the program is very simple: =
just changes=20
the receiver IP address (pre-routing)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and sender IP address (post-routing), =
and then=20
forward the packets. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Everything worked fine except that =
after the=20
packets forwarded to the destination, the</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>reading program on the destination =
machine reported=20
reading error (-1), and errno 11</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(don't know the reason). </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After changed the IP address, I did =
recalculated=20
the checksum, as follows (copied</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>from ip_nat_core.c):</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; saddr=20
=3D &lt;the address to be changed=20
to&gt;;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
iph-&gt;check =3D ip_nat_cheat_check(~iph-&gt;saddr, saddr,=20
iph-&gt;check);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
iph-&gt;saddr =3D saddr;<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I did rechecked the checksum and it =
appeared to be=20
good. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Having searched answers from the =
Internet and=20
digged the code without results, I hope</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>someone here can help me out. I guess I =
must have=20
messed up the packets. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For your information, I have attached =
the tiny=20
source code at the end of this email.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Your help is most =
appreciated!!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chen Ding</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_001_0035_01C260BA.8CA878F0--

------=_NextPart_000_0034_01C260BA.8CA878F0
Content-Type: application/octet-stream;
	name="hello.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="hello.c"

/* hello.c=20
 * Copyright (C) 1998 by Ori Pomerantz
 *=20
 * "Hello, world" - the kernel module version.=20
 */

/* The necessary header files */

/* Standard in kernel modules */
#include <linux/config.h>
#include <linux/skbuff.h>
#include <linux/kmod.h>
#include <linux/vmalloc.h>
#include <linux/netdevice.h>
#include <linux/module.h>
#include <linux/tcp.h>
#include <linux/udp.h>
#include <linux/icmp.h>
#include <net/ip.h>
#include <asm/uaccess.h>
#include <asm/semaphore.h>
#include <asm/checksum.h>
#include <linux/proc_fs.h>


#include <linux/kernel.h>   /* We're doing kernel work */
#include <linux/module.h>   /* Specifically, a module */

#define ASSERT_READ_LOCK(x) MUST_BE_READ_LOCKED(&ip_nat_lock)
#define ASSERT_WRITE_LOCK(x) MUST_BE_WRITE_LOCKED(&ip_nat_lock)

#include <linux/netfilter_ipv4/ip_nat.h>
#include <linux/netfilter_ipv4/ip_nat_rule.h>
#include <linux/netfilter_ipv4/ip_nat_protocol.h>
#include <linux/netfilter_ipv4/ip_nat_core.h>
#include <linux/netfilter_ipv4/ip_nat_helper.h>
#include <linux/netfilter_ipv4/ip_tables.h>
#include <linux/netfilter_ipv4/ip_conntrack_core.h>
#include <linux/netfilter_ipv4/listhelp.h>

#include <linux/netfilter.h>

/* Deal with CONFIG_MODVERSIONS */
#if CONFIG_MODVERSIONS=3D=3D1
#define MODVERSIONS
#include <linux/modversions.h>
#endif       =20


u_int16_t
ip_nat_cheat_check(u_int32_t oldvalinv, u_int32_t newval, u_int16_t =
oldcheck)
{
    u_int32_t diffs[] =3D { oldvalinv, newval };
    return csum_fold(csum_partial((char *)diffs, sizeof(diffs),
                      oldcheck^0xFFFF));
}

static unsigned int addr192_168_1_17 =3D 0x1101a8c0;
static unsigned int addr192_168_1_81 =3D 0x5101a8c0;=20
static unsigned int addr10_10_10_1   =3D 0x010a0a0a;
static unsigned int addr10_10_10_3   =3D 0x030a0a0a;

static unsigned int
ip_nat_fn(unsigned int hooknum,
      struct sk_buff **pskb,
      const struct net_device *in,
      const struct net_device *out,
      int (*okfn)(struct sk_buff *))
{
	/*=20
	 * The pre-routing function
	 */

	unsigned int saddr;
	unsigned int daddr;
	struct iphdr *iph;
	struct udphdr *udphdr;

	iph =3D (*pskb)->nh.iph;
	udphdr =3D (struct udphdr*)((u_int32_t *)iph + iph->ihl);
=09
    if (iph->protocol =3D=3D 17)
    {
        /*
         * It is UDP
         */

		saddr =3D iph->saddr;
		daddr =3D iph->daddr;
		if (saddr =3D=3D addr192_168_1_17 &&=20
			daddr =3D=3D addr192_168_1_81)
		{
			/* Found the match. Change daddr to 10.10.10.3 */
			daddr =3D addr10_10_10_3;		/* 10.10.10.3 */
			iph->check =3D ip_nat_cheat_check(~iph->daddr, daddr, iph->check);
        	iph->daddr =3D daddr;

			(*pskb)->nfcache |=3D NFC_UNKNOWN;	/* not sure whether should do this =
*/
			(*pskb)->nfcache |=3D NFC_ALTERED;
			(*pskb)->nfcache |=3D NFC_IP_DST;
		}
    }

	return NF_ACCEPT;
}


static unsigned int
ip_nat_out(unsigned int hooknum,
       struct sk_buff **pskb,
       const struct net_device *in,
       const struct net_device *out,
       int (*okfn)(struct sk_buff *))
{
	/*
	 * The post-routing function
	 */
    unsigned int saddr;
    unsigned int daddr;

    struct iphdr *iph;
    struct udphdr *udphdr;

    iph =3D (*pskb)->nh.iph;
    udphdr =3D (struct udphdr*)((u_int32_t *)iph + iph->ihl);

    if (iph->protocol =3D=3D 17)
    {
        /*
         * It is UDP
         */
        saddr =3D iph->saddr;
        daddr =3D iph->daddr;

        if (saddr =3D=3D addr192_168_1_17 && daddr =3D=3D =
addr10_10_10_3)
        {
			/* Change the source address to 10.10.10.1 */=09
            saddr =3D addr10_10_10_1;     =20
            iph->check =3D ip_nat_cheat_check(~iph->saddr, saddr, =
iph->check);
            iph->saddr =3D saddr;

			(*pskb)->nfcache |=3D NFC_UNKNOWN;	/* again, not sure whether should =
do it */
			(*pskb)->nfcache |=3D NFC_ALTERED;
            (*pskb)->nfcache |=3D NFC_IP_SRC;
        }
    }

    return NF_ACCEPT;
}


static unsigned int
ip_nat_local_fn(unsigned int hooknum,
        struct sk_buff **pskb,
        const struct net_device *in,
        const struct net_device *out,
        int (*okfn)(struct sk_buff *))
{
	return NF_ACCEPT;
}

// =3D { { NULL, NULL }, ip_nat_fn, PF_INET, NF_IP_PRE_ROUTING, =
NF_IP_PRI_NAT_DST };

/* Before packet filtering, change destination */
static struct nf_hook_ops ip_nat_in_ops
=3D { { NULL, NULL }, ip_nat_fn, PF_INET, NF_IP_PRE_ROUTING, =
NF_IP_PRI_NAT_DST-1};
/* After packet filtering, change source */
static struct nf_hook_ops ip_nat_out_ops
=3D { { NULL, NULL }, ip_nat_out, PF_INET, NF_IP_POST_ROUTING, =
NF_IP_PRI_NAT_SRC-1};
/* Before packet filtering, change destination */
static struct nf_hook_ops ip_nat_local_out_ops
=3D { { NULL, NULL }, ip_nat_local_fn, PF_INET, NF_IP_LOCAL_OUT, =
NF_IP_PRI_NAT_DST-1 };


/* Initialize the module */
int init_module()
{

  /* If we return a non zero value, it means that=20
   * init_module failed and the kernel module=20
   * can't be loaded */

    int ret =3D 0;

  	printk("Hello, world - this is the little netfilter module\n");

    ret =3D nf_register_hook(&ip_nat_in_ops);
    if (ret < 0)=20
	{
        printk("ip_nat_init: can't register in hook.\n");

		// MUST_BE_READ_WRITE_UNLOCKED(&ip_nat_lock);
		return ret;
    }

    ret =3D nf_register_hook(&ip_nat_out_ops);
    if (ret < 0)=20
	{
        printk("ip_nat_init: can't register out hook.\n");
		return ret;
    }

    ret =3D nf_register_hook(&ip_nat_local_out_ops);
    if (ret < 0)=20
	{
        printk("ip_nat_init: can't register local out hook.\n");
		return ret;
    }

    return ret;


  return 0;
}


/* Cleanup - undid whatever init_module did */
void cleanup_module()
{
  	printk("Short is the life of a kernel module\n");

	nf_unregister_hook(&ip_nat_in_ops);
	nf_unregister_hook(&ip_nat_out_ops);
	nf_unregister_hook(&ip_nat_local_out_ops);
}


------=_NextPart_000_0034_01C260BA.8CA878F0
Content-Type: application/octet-stream;
	name="Makefile"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Makefile"

# Makefile for a basic kernel module

CC=gcc
MODCFLAGS := -I/usr/src/linux/include -Wall -DMODULE -D__KERNEL__ -DLINUX

hello.o:	hello.c /usr/include/linux/version.h
		$(CC) $(MODCFLAGS) -c hello.c

#		echo insmod hello.o to turn it on
#		echo rmmod hello to turn if off
#		echo
#		echo X and kernel programming do not mix.
#		echo Do the insmod and rmmod from outside X.


------=_NextPart_000_0034_01C260BA.8CA878F0--


