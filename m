From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 12:47:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <642302.28729.qm@web111719.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-04-29 12:45, Mahmood Naderan wrote:

>Hi,
>I have setup a diskless cluster where there is a head node (server) an=
d a computing node (client).=20
>While settingup, I installed an image of linux using debootstrap. Ther=
e is no problem with that and=20
>the node can boot and I can login to that.
>=C2=A0
>The problem is when I want to open a port in the client using iptables=
, I get some errors and have no
>idea about them.
>=C2=A0
>root@client:/home/mahmood# iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dp=
ort 4949=C2=A0 -j ACCEPT
>
>FATAL: Could not load /lib/modules/2.6.32-24-server/modules.dep: No su=
ch file or directory
>iptables v1.4.4: can't initialize iptables table `filter': iptables wh=
o? (do you need to insmod?)
>Perhaps iptables or your kernel needs to be upgraded.
>
>Any suggestion is welcomed.

Make sure you kernel is configured with these enabled, and don't forget=
=20
to actually provide the modules, if not already built-in, because it=20
does have the looks of a crippled installation, judging from the missin=
g=20
modules.dep.
