From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Latest iptables & latest xtables-addons
Date: Sun, 17 Apr 2011 20:37:13 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104172032350.4911@blackhole.kfki.hu>
References: <BANLkTine5QOi2JPVGiJnPAfLPgDK1Fs8gQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTine5QOi2JPVGiJnPAfLPgDK1Fs8gQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 17 Apr 2011, Pandu Poluan wrote:

> AFAIK installing the latest xtables-addons also installed ipset 4.5.
> 
> So, how do I install the latest xtables-addons yet also install ipset 6.3?

xtables-addons from git contains ipset 6.3.
 
> And, somewhat related, can I install ipset 6.3 on Gentoo-hardened?

I can see no reason why you couldn't install it. If the kernel source is 
available, you can refer to it and that should be enough.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
