From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Xtables-addons 1.6
Date: Wed, 19 Nov 2008 07:32:23 -0800
Message-ID: <7259d7020811190732u571b90dh3d1f9938c70a1b27@mail.gmail.com>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>
	 <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>
	 <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=vp8JZekjQF1WI+Csg9+zhPenosGhoOOlgyPFYmidcgY=;
        b=Oh+cFsb2ANgaq6zSrwKs8cF7DYRa9aFv3rxblPcL6ynURWDgndrPWrTufS/EsR+ADx
         gHnsIauN7phskl8xfQt7ZjeKShO7rmm83WauHpyZDRxwl8oSFtj562WvH0iH0ViJejG9
         5qgZKIZ9lrKfuFDcxehWJfzfCJXbRdTuQ1eB8=
In-Reply-To: <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Not quite done, sorry.  Just a couple questions about what is actually
happening.

I changed

	-	build_ipset=m
	+	build_ipset=n

xtables-addons' install reports,

	make install | grep ipset
		Making install in extensions/ipset
		make[1]: Entering directory `/usr/local/src/xtables-addons/extensions/ipset'
		install -pm0755 ipset "/usr/local/sbin/";
		install -pm0755 libipset_iphash.so libipset_ipmap.so
libipset_ipporthash.so libipset_iptree.so libipset_iptreemap.so
libipset_macipmap.so libipset_nethash.so libipset_portmap.so
"/usr/local/libexec/xtables/";
		install -pm0644 ipset.8 "/usr/local/share/man/man8/";
		make[1]: Leaving directory `/usr/local/src/xtables-addons/extensions/ipset'

As expected, no ipset kernel modules are built,

	ls -al /lib/modules/`uname -r`/extra/ipset/
		/bin/ls: cannot access
/lib/modules/2.6.25.18-0.2-default/extra/ipset/: No such file or
directory

I may be confused about your comment,

	You only really need to be aware that `make install` may overwrite an
	existing ipset (specifically the binary and manpage).

Is that supposed to still true even if the "build_ipset=n" is set?

After the 'make install' I see,

	ls -al /usr/local/libexec/xtables/libipset_iptree.so \
	       /usr/local/lib/ipset/libipset_iptree.so

		(1)	-rwxr-xr-x 1 root root 15151 2008-11-16 10:01
/usr/local/lib/ipset/libipset_iptree.so
		(2)	-rwxr-xr-x 1 root root 23679 2008-11-19 07:10
/usr/local/libexec/xtables/libipset_iptree.so

where (1) is built/installed by the standalone ipset build, and (2) by
xtables-addons' build.

Should (2) still be installed?  Do other xtables-addons componenents,
perhaps, depend on its presence specifically there?  Or can/should it
be reomved so now to conflict with the already installed ipset's?

Also, there's a difference in binary size (23679 vs 15151) for the two
libraries.  What's the difference -- is it important?

I've learned just enough to be wary of multiple instances/versions of
libraries, so just want to be sure I'm not going to cause problems
with both these libraries.

Thanks.

--JC
