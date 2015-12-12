From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 17:34:55 -0200
Message-ID: <566c76e3.0303810a.334b3.fffffd08@mx.google.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
	<566BEF33.7090501@gmail.com>
	<alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
	<566C09F5.6080606@gmail.com>
	<alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
	<566C0E75.6080800@familie-kuntze.de>
	<20151212191019.GA10759@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=l3fGDLNVLPh07FdnpyMSHE7dcDqI1cV9bNmJZAtFRMc=;
        b=B2dt6dlBANVkpk2g09s65QzQrl9ROntya3sNS+xmm21EOUqRjfk1Wl9q5+ubTb+s4O
         wAs5uZVUFJit0/zokNW48vrx0xZ+nlHzitpmTbpsAK1hV/Dn+Jn5zDdmtfxg958W4dk0
         f+ErI1yIYp6sindDVssB8ksR05k1hAR1ITBy5O3DsBol8HnjRlJJklPUydVjn02FlGqx
         8tzRDMnVj20n/x3Mh7dJIsnxH++9kUUVs1EeOLKRDC89rIf2tHZa0f5BTsG9vrWlEnb0
         qKSxZcBmrlqyP14/N4dv5bYkofP2x0BXMv6TRR06zKsLShl+bZSr3ZZ9AFACiUb3zVtT
         mUkA==
In-Reply-To: <20151212191019.GA10759@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Noel Kuntze <noel@familie-kuntze.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sat, 12 Dec 2015 20:10:19 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> For the record, -m state is *not* deprecated.
> 
> This syntax is still supported and will always be.

	Thanks, but why it works on Linux 4.3.0 and it doesn't work on
Linux 4.3.1 and above? Any hints?

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
