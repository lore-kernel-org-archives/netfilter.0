From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 17:42:20 -0200
Message-ID: <566c789f.08d50d0a.6b448.ffff923d@mx.google.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
	<566BEF33.7090501@gmail.com>
	<alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
	<566C09F5.6080606@gmail.com>
	<alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
	<566C0E75.6080800@familie-kuntze.de>
	<566c4622.936d810a.ece67.ffffdfc9@mx.google.com>
	<20151212193237.GB10759@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=NdQe/DSW9PivY8C/RKHGRvB7MqWA6nfpkzxQtQB+hs8=;
        b=OfBGo3O9slCxfvABfwx3o290ahAWVMHWaVDF73jOnVDb+YU/MLqRyYMScNrih/D/jB
         Kkvozzz/XoBUIT8GzjVijC3iQw5swYa6i03lpIkOx3MqgfFaOxaS7kSf316/TNMx8HX0
         lHIBLg2Km9Q+JFkNE+LoCTrmli1k1JmvYW9eQHIio5s65maLNpa926qBbjZpErfCRfAg
         7JPVkGope/BK3RhZ8Ge4JCl3NcAz1OZZFRBp08Vh5hI2TnKfQGKmuc3q/8ObHOwNif19
         wqm/+abFMNKSPwYI9GYDW+6L83EQGv9Px6CuUUPVD0p7gfPZvKALcunlhw3NpXs5HK+u
         OCNg==
In-Reply-To: <20151212193237.GB10759@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Noel Kuntze <noel@familie-kuntze.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sat, 12 Dec 2015 20:32:37 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> There is some problem with the revision infrastructure.
> 
> iptables is asking for a match revision that is not available in the
> kernel. So the negotiation between userspace and kernel to use a given
> version of this match is failing for some reason.
> 
> Could you apply this patch and tell me what it shows when you run this
> command and the one using -m state?
> 
> BTW, any particularly on your setup that is worth mention?
> 
> Thanks.

	Pablo, here's the result with your patch applied:

compatible_match_revision name=conntrack revision=3
compatible_match_revision name=conntrack revision=3
compatible_match_revision name=conntrack revision=3
iptables: Protocol wrong type for socket.

	If you need more info, just ask.

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
