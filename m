From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Xtables-addons 1.6
Date: Thu, 20 Nov 2008 21:23:28 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0811202103120.21606@fbirervta.pbzchgretzou.qr>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>  <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>  <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
 <7259d7020811190732u571b90dh3d1f9938c70a1b27@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811190732u571b90dh3d1f9938c70a1b27@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-11-19 16:32, JC Janos wrote:

>Not quite done, sorry.  Just a couple questions about what is actually
>happening.
>
>I changed
>
>	-	build_ipset=m
>	+	build_ipset=n
>
>xtables-addons' install reports,
>
>	make install | grep ipset
>		Making install in extensions/ipset
>		make[1]: Entering directory `/usr/local/src/xtables-addons/extensions/ipset'
>		install -pm0755 ipset "/usr/local/sbin/";
>		install -pm0755 libipset_iphash.so libipset_ipmap.so

This is now fixed in the latest git snapshot as of v1.6-3-g85e3c24.

>I may be confused about your comment,
>
>	You only really need to be aware that `make install` may overwrite an
>	existing ipset (specifically the binary and manpage).
>
>Is that supposed to still true even if the "build_ipset=n" is set?

It was meant to say "as long as make install does not overwrite
the other ipset, you can ignore it" ;-)

>		(1)	-rwxr-xr-x 1 root root 15151 2008-11-16 10:01
>/usr/local/lib/ipset/libipset_iptree.so
>		(2)	-rwxr-xr-x 1 root root 23679 2008-11-19 07:10
>/usr/local/libexec/xtables/libipset_iptree.so
>
>Also, there's a difference in binary size (23679 vs 15151) for the two
>libraries.  What's the difference -- is it important?

The second was built using gcc as linker frontend, which adds the
common runtime to the .so. This is what ipset 2.4.4 is doing too.
