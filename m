From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables -t raw [conditions] -j TRACE is not logging
Date: Thu, 5 Jun 2008 18:02:27 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806051802060.29055@fbirervta.pbzchgretzou.qr>
References: <9a7fd99c0805192232o2399fd48rb462a131da9fd2f6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9a7fd99c0805192232o2399fd48rb462a131da9fd2f6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Rakhmatoullin <jazzoslav@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-05-20 07:32, Jaroslav Rakhmatoullin wrote:
>
>Problem description
>iptables TRACE target never gives any output through ipt_LOG and syslog-ng

Will it become visible on a tty (tty1-6) when you execute...?
	klogconsole -l8 -r0

