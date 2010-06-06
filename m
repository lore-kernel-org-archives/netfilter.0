From: Thanasis <thanasis@asyr.hopto.org>
Subject: Re: prevent iptables LOG target from flooding dmesg
Date: Sun, 06 Jun 2010 16:42:21 +0300
Message-ID: <4C0BA5BD.3070301@asyr.hopto.org>
References: <4C0AB6AD.104@asyr.hopto.org> <20100605220334.24df75e5@liberty.rlwhome.lan> <4C0B319B.1090300@asyr.hopto.org> <alpine.LSU.2.01.1006061330590.12300@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006061330590.12300@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Robby Workman <rw@rlworkman.net>, netfilter@vger.kernel.org

on 06/06/2010 02:31 PM Jan Engelhardt wrote the following:
>
> On Sunday 2010-06-06 07:26, Thanasis wrote:
>>>
>>>   2) Install ulogd and use -j ULOG instead of -j LOG.
>> I have read about ulog but the kernel config help says for ULOG that it
>> is deprecated:
>
> Try -j NFLOG.
>
>
I installed ulogd2, as suggested in
http://www.netfilter.org/projects/libnetfilter_log/
... but I cannot start it.

(# ulogd -V
ulogd Version 2.0.0beta
Copyright (C) 2000-2005 Harald Welte <laforge@netfilter.org>)

Here is what /var/log/ulogd.log says:

Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `NFLOG'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `ULOG'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `NFCT'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `IFINDEX'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `IP2STR'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `IP2BIN'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `PRINTPKT'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `HWHDR'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `PRINTFLOW'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `MARK'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `LOGEMU'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `SYSLOG'
Sun Jun  6 16:36:02 2010 <5> ulogd.c:372 registering plugin `BASE'
Sun Jun  6 16:36:02 2010 <8> ulogd.c:1173 not even a single working
plugin stack

