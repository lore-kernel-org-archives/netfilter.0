From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset-2.4.1 released
Date: Wed, 22 Oct 2008 16:20:08 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810221613280.26472@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-dev@blackhole.kfki.hu

Hi,

The fresh release of ipset includes a few userspace fixes and a kernel 
part correction:

- userspace changes:
  - macipmap type reported misleading deprecated separator tokens and 
    printed the old one at listing set elements; the warning contained 
    misprinting as well (bugs reported by Krzysztof Oledzki)
  - Warn only once about deprecated separator tokens in restore mode. 
- kernel part changes:
  - Zero-valued element are not acceptable by hash type of sets because we 
    cannot make a difference between a zero-valued element and not-set 
    element. Enforce it, as manpage says. (fixes bugzilla id 543)

As usual, you can download source from the webpage or svn:

	http://ipset.netfilter.org/
	svn co https://svn.netfilter.org/netfilter/trunk/ipset

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
