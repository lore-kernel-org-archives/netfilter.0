From: "Augusto Salazar" <augusto@proscend.com>
Subject: Vlan modifications
Date: Wed, 28 Sep 2011 09:28:30 +0800
Message-ID: <00b301cc7d7d$ee60d850$cb2288f0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Greetings,

I am working on a kernel module that uses netfilter to catch packets, m=
odify
its vlan tag or remove it or even add one, all depending on the user in=
put.



I am able to catch the packets like this:

netfilter_ops.hook=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
main_hook;
netfilter_ops.pf=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
PF_INET;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=20
netfilter_ops.hooknum=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=
=A0=A0=A0  =3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0
NF_IP_PRE_ROUTING;
netfilter_ops.priority =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0
NF_IP_PRI_FIRST;
err =3D nf_register_hook(&netfilter_ops);

It is working fine.

The issue I have is the following:

The vlan headers on other parts of the kernel are managed the data fiel=
d of
the skb, for example:

static inline int thesis_vlan_get_tag(struct sk_buff *skb)
{
=A0=A0=A0 struct vlan_ethhdr *veth =3D (struct vlan_ethhdr *)skb->data;
=A0=A0=A0 unsigned short tag;
=A0=A0=A0=20
=A0=A0=A0=A0if (veth->h_vlan_proto !=3D __constant_htons(ETH_P_8021Q)) =
{
=A0=A0=A0=A0=A0=A0=A0 printk("\n thesis_vlan_get_tag no Vlan\n");
=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
=A0=A0=A0 }
=A0=A0=A0=20
=A0=A0=A0=A0tag =3D ntohs(veth->h_vlan_TCI);
=A0=A0=A0=20
=A0=A0=A0=A0printk("\n thesis_vlan_get_tag VID2 %d\n",tag);
=A0=A0=A0=20
=A0=A0=A0=A0return 0;
}

But, on the skb that I get that info is actually on the raw of the mac,=
 so
to print the vlan I have to do this:

static inline int thesis_vlan_get_tag2(struct sk_buff *skb)
{
=A0=A0=A0 struct vlan_ethhdr *veth =3D (struct vlan_ethhdr *)skb->mac.r=
aw;
=A0=A0=A0 unsigned short tag;
=A0=A0=A0=20
=A0=A0=A0=A0if (veth->h_vlan_proto !=3D __constant_htons(ETH_P_8021Q)) =
{
=A0=A0=A0=A0=A0=A0=A0 printk("\n thesis_vlan_get_tag2 no Vlan\n");
=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
=A0=A0=A0 }
=A0=A0=A0=20
=A0=A0=A0=A0tag =3D ntohs(veth->h_vlan_TCI) & VLAN_VID_MASK;
=A0=A0=A0=20
=A0=A0=A0=A0printk("\n thesis_vlan_get_tag VID2 %d\n",tag);
=A0=A0=A0=20
=A0=A0=A0=A0return 0;
}

Can someone explain me why? I would like to reuse some of the kernel
functions but they all use the data field.

I use linux-2.6.20 on a MIPS CPU.

Any help would be amazing.


Best Regards,
Augusto Salazar
Software Engineer
Proscend Communications Inc.



--=20
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

