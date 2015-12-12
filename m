From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 17:35:58 -0200
Message-ID: <566c7722.c17b810a.f320.0045@mx.google.com>
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
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=HN3YQFmdXHct6amJSgW3HWw/6C86cuqf5sL143aG2oo=;
        b=rpbu+i+S/tIoXGXXVVxNpVOUHFz16wWMtC+cGFMcxPtHb7dMk7rj/73ESywVqgGapF
         CF4m1dZWZIccej5iheko7IrWZX1myMxVETN2OiWTw5eTFyLPlX++3rPFmqPCTPRr451d
         zOz5AtRqGdpQu9mJpvv/geYc4uvjhV+BbK0Ob1C+lsTBAvip0DBqRpilqraMIIQkDQtV
         aNI15jtb7f1U7U8TFZInW2Qm4MRlfgLwRSG+lf4cdn0WyThVIySpzYlg4SKFFXqHazw4
         wKzHe8USlQBLFAIqVDIS/8tUgphHAGTLevOpdCKU6WQ6+4ZWzcfzk0cvshJKzFpj7LVz
         XKpg==
In-Reply-To: <20151212193237.GB10759@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
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
	
	Nothing special here. I'll try the patch and reply back. Just a
minute.

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
