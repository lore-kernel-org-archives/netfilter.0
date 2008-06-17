From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: patch-o-matic and recent kernel/iptables
Date: Tue, 17 Jun 2008 10:50:55 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806171048060.8037@blackhole.kfki.hu>
References: <4853E82F.8080807@solutti.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4853E82F.8080807@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

On Sat, 14 Jun 2008, Leonardo Rodrigues Magalh?es wrote:

>    I've download latest iptables (1.4.1) and latest kernel (2.6.25.6). I've
> download also latest available patch-o-matic-ng snapshot, dated 20080521.
> 
>    Unfortunelly i cannot apply POM patches over this iptables/kernel
> combination. Always i got is:
> 
> [root@f8 patch-o-matic-ng-20080521]# export KERNEL_DIR=/usr/src/linux-2.6.25.6
> [root@f8 patch-o-matic-ng-20080521]# export
> IPTABLES_DIR=/usr/src/iptables-1.4.1
> [root@f8 patch-o-matic-ng-20080521]# ./runme
> Your iptables version  is unknown for patch-o-matic at ./runme line 333
> [root@f8 patch-o-matic-ng-20080521]#

I have fixed patch-o-matic-ng in git. So either check out it from git or 
wait for the next daily snapshot and give it a try. The fixed version 
should work fine with iptables-1.4.1.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
