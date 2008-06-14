From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: patch-o-matic and recent kernel/iptables
Date: Sat, 14 Jun 2008 12:47:59 -0300
Message-ID: <4853E82F.8080807@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>


    Hello Guys,

    I've download latest iptables (1.4.1) and latest kernel (2.6.25.6).=
=20
I've download also latest available patch-o-matic-ng snapshot, dated=20
20080521.

    Unfortunelly i cannot apply POM patches over this iptables/kernel=20
combination. Always i got is:

[root@f8 patch-o-matic-ng-20080521]# export=20
KERNEL_DIR=3D/usr/src/linux-2.6.25.6
[root@f8 patch-o-matic-ng-20080521]# export=20
IPTABLES_DIR=3D/usr/src/iptables-1.4.1
[root@f8 patch-o-matic-ng-20080521]# ./runme
Your iptables version  is unknown for patch-o-matic at ./runme line 333
[root@f8 patch-o-matic-ng-20080521]#


    Question ..... is there any place where i can grab most recent POM=20
or that project is really frozen ? is there anyway of applying POM=20
patches over this kernel/iptables combination ?

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





