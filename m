From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ebtables ruleset isn't working, any ideas?
Date: Tue, 19 May 2009 21:46:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905192142470.9069@blackhole.kfki.hu>
References: <740443.89728.qm@web44813.mail.sp1.yahoo.com> <alpine.DEB.2.00.0905192100250.8786@blackhole.kfki.hu> <200905192116.59322.christoph.paasch@student.uclouvain.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200905192116.59322.christoph.paasch@student.uclouvain.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Paasch <christoph.paasch@student.uclouvain.be>
Cc: netfilter@vger.kernel.org, Miguel Ghobangieno <mikeeusa@yahoo.com>

On Tue, 19 May 2009, Christoph Paasch wrote:

> Hmmm... His rules won't match as the packets are dropped due to the default 
> policy of the chain.

The default policy will be used if no rule matches. The question is, do 
any of the rules match?
 
> Just add at the end of your rules a log target for all who passed the 
> "ACCEPT" rules.

There's no log target in ebtables. But there's a log "watcher" which is 
like an always true matching with logging as side effect. That should be 
added to the rules.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
