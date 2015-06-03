From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP sequence checking
Date: Wed, 3 Jun 2015 21:00:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1506032057540.24366@blackhole.kfki.hu>
References: <556EFE9A.2020003@students.fhnw.ch> <alpine.DEB.2.10.1506031915590.23917@blackhole.kfki.hu> <556F3ED5.6000205@students.fhnw.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <556F3ED5.6000205@students.fhnw.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lukas Hubschmid (s)" <lukas.hubschmid@students.fhnw.ch>
Cc: netfilter@vger.kernel.org

On Wed, 3 Jun 2015, Lukas Hubschmid (s) wrote:

> I am not quite sure if I read the C-code correctly - so TCP sequence checking
> seems to be enabled by default, right? Or do I need to set some flag when
> adding a rule?

No, it's default enabled. You can (partiall) switch it off globally via a 
sysctl setting, not with some flag in a rule.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
