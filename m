From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: simple question about state vs conntrack modules
Date: Thu, 22 Oct 2009 21:17:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910222115350.5982@blackhole.kfki.hu>
References: <4ADF844A.3090106@solutti.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADF844A.3090106@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

On Wed, 21 Oct 2009, Leonardo Rodrigues wrote:

>    recently i have read a nice documentation with some hints for making good
> rulesets .... and one caught my attention
> 
> http://jengelh.medozas.de/documents/Perfect_Ruleset.pdf
> 
> Towards the perfect ruleset
> Jan Engelhardt
> August 2009
> 
> 5 Modern extensions
> De-facto obsolete extensions:
> * -m state: replaced by -m conntrack
> 
>    i must confess i dont recall reading about state module being obsoleted by
> conntrack one ..... is that true ??? I know conntrack has more options ....
> but that it obsoleted state, that i dont remember ....

Technically the conntrack match supersedes - and so obsoletes - the state 
match. But practically the state match is not obsoleted in any way.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
