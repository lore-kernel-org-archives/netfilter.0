From: Jeff Jensen <jjensen@unyalli.com>
Subject: Re: Help with ftp helper please
Date: Sun, 25 Apr 2010 06:00:26 -0600
Message-ID: <p2gb376a78e1004250500z443e032fj47df79cb918f2bd7@mail.gmail.com>
References: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com>
	 <4BD3E5F3.4070907@chello.at>
	 <alpine.LSU.2.01.1004251108170.5896@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004251108170.5896@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

Interesting, unless I'm blind the original conversation does not
mention this. I've seen -m state and now -m helper. Where did this -m
conntrack come from?

>
> That's why one should always have -m conntrack --ctstate ESTABLISHED(,RELATED)
> in INPUT, FORWARD, and OUTPUT. It really trims down all these rules.
>
