From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 21:31:47 -0200
Message-ID: <566cae67.86f60d0a.f3ad2.2638@mx.google.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
	<566BEF33.7090501@gmail.com>
	<alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
	<566C09F5.6080606@gmail.com>
	<alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
	<566C0E75.6080800@familie-kuntze.de>
	<566c4622.936d810a.ece67.ffffdfc9@mx.google.com>
	<20151212232044.GE12854@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=cDecOYRMGre5Z3Da0WhTf2slwEp56Egg5ZDkJ2fAH2o=;
        b=N94Qn/bgU3WBN3SEuOylLZuJjUtumEC3MC43JQLFTgm6xDjuc7PGZDKHa3nrDyfKbr
         okjTEb6pvXsIhj9sNKJG0ugYBjMquh+Y7pTQZVZ/wnqa3FTy7Qt5qJvcwqmyV5dOf9Cr
         TEdSnKmxG0XG5kuOBk0tCFDXAo5xF4tW6y5VKc6PJH4jQOMJtbiV9wYE6qXZUEZdFPiy
         CGY+mrip6Sr0CvGDQqyROKizQzSDYpUiPI1/xleAYhuUyx+mEshnZxFQti/VWH83F3nz
         GAoiExqj3fldVCiTNfMzUGbu1R0YhjiMzLNawVAYUgE80umxUhI2eBDKwnwO0MijJ6vE
         z2TA==
In-Reply-To: <20151212232044.GE12854@breakpoint.cc>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: Noel Kuntze <noel@familie-kuntze.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sun, 13 Dec 2015 00:20:44 +0100
Florian Westphal <fw@strlen.de> wrote:

> > 	Is there something missing?  
> 
> Yes: nf_conntrack_ipv4

	Thanks. This solved the problem.

	Any reason this module is necessary for kernel 4.3.1 and not
for 4.3.0? Maybe when the user compiles the state module, this option
should be marked automatically to prevent this, since state depends now
on nf_conntrack_ipv4 module.

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
