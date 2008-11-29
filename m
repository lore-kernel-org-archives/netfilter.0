From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Sat, 29 Nov 2008 11:30:00 +0100
Message-ID: <493119A8.6060202@plouf.fr.eu.org>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>	 <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>	 <492F3057.8010007@plouf.fr.eu.org>	 <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>	 <492FD4BF.6030101@plouf.fr.eu.org> <98028b00811282006r3dff45a9v7d52ec67077c7109@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <98028b00811282006r3dff45a9v7d52ec67077c7109@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Zagato a =E9crit :
> Hi.. thanks for the answer... but i really sure that my old rules
> works fine on centos 4.2, when i upgrade to 5.2 psql -h localhost -p
> 5432 test have the same symptomatic, maybe a kernel module that i nee=
d
> to modoprobe ? what chage that my old rules doesn't work anymore... ?
>=20
> Centos 5.2 kernel: 2.6.18-92.el5

According to a quick search it seems that Centos 4.2 included a kernel=20
2.6.9. In kernels before 2.6.11, the DNAT target in the OUTPUT chain=20
used to change the source address to reflect the new output interface.=20
This is not true for newer 2.6 kernels due to a change in kernel 2.6.11=
=2E

 From <http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.11> :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   [PATCH] Remove do_extra_mangle: double NAT on LOCAL_OUT

   On NF_IP_LOCAL_OUT, when destination NAT changes the destination
   interface, we also change the source address, so the packet is the
   same as if it were generated to go that way in the first place.  Thi=
s
   is not strictly necessary, I believe.

   This patch rips that code out to see what breaks.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
(Well, you can see what breaks)
