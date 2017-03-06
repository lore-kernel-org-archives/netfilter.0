From: Kangkook Jee <aixer77@gmail.com>
Subject: Netfilter interface change in kernel 4.4.0
Date: Mon, 6 Mar 2017 09:27:16 -0500
Message-ID: <D199BD67-28F1-4D79-A4A8-36A59213434E@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3269\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=zlVnAbJantdrcM5rz/lUBGhNt1aNP9pzCd90qVor5zA=;
        b=SMUFlvl5nsTcUh+tOESjaemMcQ7I243VGWPX/LEavGL5sGU20M+UtTIJHG+JWaSqn0
         s6N1vtoe2ehoMsQaXnwVgsfvL7AteuUwQWtcEHbhnLxY07TBt46M2qWEA9YOKOI6N+iX
         /HOSqWePAujM/fKzGVRsLoBttftl3VSsDa0MpYiz/NMTbINrNWkTmczJeeNQU2acP0B6
         GNkDCTYbCxwD45Vxl9A2ti3wIQw5XJ2OXc3P1sqJM5B80GtFKktQA9l3WWXekJG0Es5A
         Ax7NS0ydCu91HMQJzoX+iOsMNBSFcquVrE67aDZy+eVtPedTGyi7cNtJoxdCESRO1diF
         c1aw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I am trying to update kernel module that used to run for kernel version =
< 4.4.0.
I found out that struct nf_hook_ops and the signature for function type =
nf_hookfn have changed for kernels higher than version 4.4.0.=20
However, I couldn't find any documentation that explains the change.=20

To be precise for kernel 4.1.0 =
(http://lxr.free-electrons.com/source/include/linux/netfilter.h?v=3D4.1),=20=


77 typedef unsigned int nf_hookfn(const struct nf_hook_ops *ops,
78                                struct sk_buff *skb,
79                                const struct nf_hook_state *state);
80=20
81 struct nf_hook_ops {
82         struct list_head list;
83=20
84         /* User fills in from here down. */
85         nf_hookfn       *hook;
86         struct module   *owner;
87         void            *priv;
88         u_int8_t        pf;
89         unsigned int    hooknum;
90         /* Hooks are ordered in ascending priority. */
91         int             priority;
92 };


for kernel 4.4.0 =
(http://lxr.free-electrons.com/source/include/linux/netfilter.h?v=3D4.4),=20=


 83 typedef unsigned int nf_hookfn(void *priv,
 84                                struct sk_buff *skb,
 85                                const struct nf_hook_state *state);
 86=20
 87 struct nf_hook_ops {
 88         struct list_head        list;
 89=20
 90         /* User fills in from here down. */
 91         nf_hookfn               *hook;
 92         struct net_device       *dev;
 93         void                    *priv;
 94         u_int8_t                pf;
 95         unsigned int            hooknum;
 96         /* Hooks are ordered in ascending priority. */
 97         int                     priority;
 98 };

As you can see, the first parameter of nf_hookfn() is changed=20
    from=20
      const struct nf_hook_ops *ops=20
    to=20
      void *priv=20

and struct nf_hook_ops no longer has the member for=20

struct module   *owner;

and instead has the member of

struct net_device       *dev;


If anyone can tell me how to cope with this changes, it will be very =
helpful.=20

Thanks!

Regards, Kangkook

