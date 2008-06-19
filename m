From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: iphash vs iptreemap
Date: Thu, 19 Jun 2008 14:04:17 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806191356370.11904@blackhole.kfki.hu>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com>
 <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu> <000a01c8d1f0$a48d2990$eda77cb0$@com>
 <Pine.LNX.4.64.0806191144130.11904@blackhole.kfki.hu> <000f01c8d1f6$c98a1950$5c9e4bf0$@com>
 <Pine.LNX.4.64.0806191246100.11904@blackhole.kfki.hu> <001501c8d200$9da55430$d8effc90$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001501c8d200$9da55430$d8effc90$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org

On Thu, 19 Jun 2008, Nishit Shah wrote:

> > 	Also, what is significant of --gc parameter in iptreemap ?
> > 	Does it make difference in testing ? 
> 
> It governs how often garbage collector is run to release empty leaves 
> and branches. Of course it has an effect on the current memory usage.
> 
> Just a clarification here. 
> 
> What I understand is, If I don't have entries with --timeout values in
> iptreemap (as currently --timeout is not supported in iptreemap), do we
> really need --gc ? 

Yes, because it still does garbage collection which can accumulate by 
adding and deleting entries.

> Can't we do it on ADD/UPDATE/DELETE/FLUSH events on set ?

You mean garbage collection? Flushing does, the others not :-).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
