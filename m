From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 2.4 released
Date: Tue, 21 Oct 2008 10:49:09 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810211047160.24618@blackhole.kfki.hu>
References: <Pine.LNX.4.64.0810201254190.23040@blackhole.kfki.hu>
 <ff71fbf20810202119x2256c914mc8843f767668066f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ff71fbf20810202119x2256c914mc8843f767668066f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vimal <j.vimal@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 21 Oct 2008, Vimal wrote:

> This looks really nice. Is it trivial to use it as a library for
> existing (user-mode) projects?

I'm afraid, it's not easy at all. But you can call the ipset tool anytime, 
it's lightweith (not counting fork/exec in your project).

Best regards,
Jozsef 
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
