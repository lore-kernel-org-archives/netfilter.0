From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: prevent iptables LOG target from flooding dmesg
Date: Sun, 6 Jun 2010 13:31:16 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006061330590.12300@obet.zrqbmnf.qr>
References: <4C0AB6AD.104@asyr.hopto.org> <20100605220334.24df75e5@liberty.rlwhome.lan> <4C0B319B.1090300@asyr.hopto.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C0B319B.1090300@asyr.hopto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thanasis <thanasis@asyr.hopto.org>
Cc: Robby Workman <rw@rlworkman.net>, netfilter@vger.kernel.org


On Sunday 2010-06-06 07:26, Thanasis wrote:
>>
>>   2) Install ulogd and use -j ULOG instead of -j LOG.
>I have read about ulog but the kernel config help says for ULOG that it
>is deprecated:

Try -j NFLOG.
