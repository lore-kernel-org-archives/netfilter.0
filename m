From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Xtables-addons 1.32/ipset-GENL 5.2
Date: Wed, 5 Jan 2011 10:22:47 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101050921130.23762@blackhole.kfki.hu>
References: <alpine.LNX.2.01.1101040456270.11091@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1101040456270.11091@obet.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>

Hi,

On Tue, 4 Jan 2011, Jan Engelhardt wrote:

> So a few people had been asking on whether ipset 5.x will be bundled 
> along with Xtables-addons. Naturally this is a difficult question 
> because ipset-5 wants a kernel patch. But yes, it is included as of Xt-a 
> 1.32 (just out).
> 
> It has been augmented to not require the patch anymore, by moving it 
> over from nfnetlink (booo) to genetlink which does not depend on static 
> numbers, though you will need at least Linux 2.6.35 for this GENL 
> variant in both compilation and at runtime.

I fully appreciate your effort, however with it you forked ipset 5.x and 
now the two branches cannot talk to each other.

I'm not convinced that ipset should be moved from nfnetlink to genetlink. 
It'd make life easier for the users at the beginning, however on the 
longer run it'd buy nothing and I believe ipset belongs to nfnetlink.

I considered the idea of adding support of both protocols, however it 
might make the acceptance for kernel inclusion harder. I'm not happy.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
