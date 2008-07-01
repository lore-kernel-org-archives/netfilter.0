From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: POM Xtables???
Date: Tue, 1 Jul 2008 11:43:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807011135120.30394@blackhole.kfki.hu>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com> 
 <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr> 
 <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
 <486907EA.60105@trash.net> <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
 <48694787.3080906@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48694787.3080906@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Jan Engelhardt <jengelh@medozas.de>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

On Mon, 30 Jun 2008, Patrick McHardy wrote:

> - LOGMARK - haven't seen it or can't remember

It adds the possibility to log the mark values of the packet/corresponding 
conntrack entry via syslog. 

The feature should simply be added to the LOG target, there's no real 
point to keep a separated target, as far as I see.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
