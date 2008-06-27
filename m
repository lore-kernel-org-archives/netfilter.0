From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Xtables compilation problem
Date: Fri, 27 Jun 2008 12:08:48 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806271208010.12725@fbirervta.pbzchgretzou.qr>
References: <145d4e1a0806270216m58e7801bh3a01be5e24382cc7@mail.gmail.com> <145d4e1a0806270241p403dcd40l1f77b121fb8e7a42@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0806270241p403dcd40l1f77b121fb8e7a42@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Javier_G=C3=A1lvez_Guerrero?= <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-06-27 11:16, Javier G=C3=A1lvez Guerrero wrote:
>
>I want=C2=A0 to use iptables to double output packets from a network
>interface, so I would like to use the TEE target (or the ROUTE one wit=
h
>the --tee option). I have tried to apply patch-o-matic in order to pat=
ch
>the kernel and use ROUTE but it doesn't work (it doesn't allow me to d=
o
>it). Some people pointed me to your site where I could find xtables an=
d I
>found that it included the TEE target, so I decided to try to make it
>run.

patch-o-matic is deprecated; ROUTE even more so (for routing decisions
one uses iproute2, for teeing, well, you use TEE).

>I have attached the output lines obtained from the configure and make
>commands.
>

(make-debian):

/home/dulceangustia/xtables-combined-1.5.4.1/xtables-addons-1.5.4.1/ext=
ensions/compat_xtables.h:26:3:
warning: #warning You need either CONFIG_NF_CONNTRACK or
CONFIG_IP_NF_CONNTRACK.

You need either enabled in your kernel, preferably CONFIG_NF_CONNTRACK=20
since you are on >=3D 2.6.18.



(make-ubuntu)
make[3]: se ingresa al directorio `/home/dulceangustia/xtables-combined=
-1.5.4.1/iptables-1.4.0.77/extensions'
  CC       initext4.o
initext4.c:72: error: expected identifier or ???(??? before ???-??? tok=
en
initext4.c:74: error: expected identifier or ???(??? before ???-??? tok=
en

I have no idea what's going on here. Please send me initext4.c and I'll=
 see.
You can try to compile iptables 1.4.1.1 (the most recent xtables-combin=
ed
tarball has an older one packaged) and see if 1.4.1.1 works better.
