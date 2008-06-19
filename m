From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: iphash vs iptreemap
Date: Thu, 19 Jun 2008 11:56:52 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806191144130.11904@blackhole.kfki.hu>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com>
 <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu> <000a01c8d1f0$a48d2990$eda77cb0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000a01c8d1f0$a48d2990$eda77cb0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org

On Thu, 19 Jun 2008, Nishit Shah wrote:

> 		Is it a way to find memory usage by both of them ?
> 		How much difference in terms of memory do we have ?

Both could be figured out by testing only, which as far as I know hasn't 
been done by anyone.

This reminds me to add statistics parameters to the next version of ipset 
in order to get the required data easily...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
