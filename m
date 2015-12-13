From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 22:05:17 -0200
Message-ID: <566cb640.46dc0d0a.5c3cc.287a@mx.google.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
	<566BEF33.7090501@gmail.com>
	<alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
	<566C09F5.6080606@gmail.com>
	<alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
	<566C0E75.6080800@familie-kuntze.de>
	<566c4622.936d810a.ece67.ffffdfc9@mx.google.com>
	<20151212232044.GE12854@breakpoint.cc>
	<566cae67.86f60d0a.f3ad2.2638@mx.google.com>
	<alpine.LSU.2.20.1512130032300.32038@nerf40.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:to:cc:subject:in-reply-to:references
         :organization:mime-version:content-type:content-transfer-encoding;
        bh=14Rtmjh2zFKvXbwaTt/jS6bQ9H3wKC2FrL0cSCaC5Tc=;
        b=zls3fSmMH3ejoeVXtSJMOoPpwJAILbvRq8NjX6InzJBMTsLwiDQvc9QUPoq1hT/Pfk
         J2l0B9nSlYEJK8eooCYC/5Nz9jRMeqLvqB/pPrVb/WXvqCHHoSUjugryxV9cY2wFZSxs
         Ub84LR+L7R9+DTlSPA7UZXzyb1Ao7JUM14Lu6fBJPo+Y1R7VuZ4+O3WG8zribAAu44id
         ot7XQH6hkAe4I37zphy4nwyKqSqv116CUJKwlUoFvIY1LXPVBaNAL34PKMg8ZCYg7Pot
         D6fpNQ0s9WplNm6BfNf8xgeg5PDegZ6OvP24OMhe1RxhU+8UvIf/gADAc0QHchPozvdQ
         4FMw==
In-Reply-To: <alpine.LSU.2.20.1512130032300.32038@nerf40.vanv.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Florian Westphal <fw@strlen.de>, Noel Kuntze <noel@familie-kuntze.de>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sun, 13 Dec 2015 00:34:02 +0100 (CET)
Jan Engelhardt <jengelh@inai.de> wrote:

> git log --oneline v4.3..v4.3.1 net/netfilter/ | wc -l
> 0
> 
> Now, that makes me wonder if 4.3.1 is the culprit, or whether your
> surrounding system is. Like, someone once inserted the module into
> the running system without adding it to /etc/modprobe.d, and now a
> recent reboot exposed the issue.

	I don't think so. I maintain my own Linux setup (like Linux
from scratch). Everything was fine until 4.3.1. Nothing else was
changed.

	Anyway, don't you think nf_conntrack_ipv4 should be
auto-selected when "state" module is selected?

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL
