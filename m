From: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Subject: Kernel Module Chaning destination mac address
Date: Sat, 31 Mar 2012 17:52:02 +0530
Message-ID: <CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=/Yy9j+2khVnuv+3YsH3fWWRiTKRQ9rwgAHQruVpp3Kk=;
        b=QK5Gi78fULDyGtJWQv70kYcnV/HTthn8/hNDIp96ZRtM8W+SmWT/KSeci/o3aJalvM
         j0+AAby3OWfWaTsRPKer4HgXzdmlgem8zjQKWQXvRFaJ2IeF4Z4AsIGcWqgP62vUrfBN
         LSYUksmaqJvLWWPOwYkggkF/3N8pxQT44L4DM=
In-Reply-To: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello there!
I am working on a project to create a kernel module which directs all
outgoing traffic from my machine to different computer in my LAN. So I
am starting with just trying to send the traffic to just one computer.
I am using the=A0NF_BR_LOCAL_OUT hook. Along with the=A0NFPROTO_IPV4
family. But every time i run the module, my machine hangs. And I need
to reboot. =A0Please see what is the problem.

Here is the code:

#include <generated/autoconf.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/skbuff.h>
#include <linux/types.h>
#include <linux/netfilter_ipv4.h>
#include <linux/netfilter_bridge.h>
#include <linux/socket.h>
#include <linux/netfilter.h>

struct nf_hook_ops hook_ex;

unsigned int function_hook( unsigned int hook, struct sk_buff **pskb, c=
onst
struct net_device *in,
=A0=A0 =A0const struct net_device *out, int (*okfn)(struct sk_buff *))
{

char a[] =3D { 0x00, 0x24, 0x21, 0x03, 0xd4, 0x31};
printk("changing IP dst address in %s\n", __FUNCTION__);
if (skb_shared(*pskb) || skb_cloned(*pskb)) {
struct sk_buff *nskb;
=A0printk("in if if (skb_shared(*pskb) || skb_cloned(*pskb)) \n");

nskb =3D skb_copy(*pskb, GFP_ATOMIC);
if (!nskb)
return NF_DROP;
if ((*pskb)->sk)
skb_set_owner_w(nskb, (*pskb)->sk);
kfree_skb(*pskb);
*pskb =3D nskb;
}
memcpy(eth_hdr(*pskb)->h_dest, a, ETH_ALEN);

return NF_ACCEPT;
}

static int __init init(void)
{
=A0 =A0// hook
=A0 =A0hook_ex.list.next =3D NULL;
=A0 =A0hook_ex.list.prev =3D NULL;
=A0 =A0hook_ex.hook =3D function_hook;
=A0 =A0// =A0hook_ex.list.flush =3D NULL;
=A0 =A0hook_ex.pf=A0=3D NFPROTO_IPV4;
=A0 =A0hook_ex.hooknum =3D NF_BR_LOCAL_OUT;
printk(KERN_INFO "[CCD] Successfully inserted module into kernel.\n");
=A0 =A0return nf_register_hook(&hook_ex);
}

static void __exit fini(void)
{
=A0 =A0nf_unregister_hook(&hook_ex);
printk(KERN_INFO "[CCD] Successfully unloaded module.\n");
}

module_init(init);
module_exit(fini);


Regards,
Digvijay

PS: I am noob at kernel programming
