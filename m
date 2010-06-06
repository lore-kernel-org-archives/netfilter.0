From: Thanasis <thanasis@asyr.hopto.org>
Subject: Re: prevent iptables LOG target from flooding dmesg
Date: Sun, 06 Jun 2010 08:26:51 +0300
Message-ID: <4C0B319B.1090300@asyr.hopto.org>
References: <4C0AB6AD.104@asyr.hopto.org> <20100605220334.24df75e5@liberty.rlwhome.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100605220334.24df75e5@liberty.rlwhome.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Robby Workman <rw@rlworkman.net>
Cc: netfilter@vger.kernel.org

on 06/06/2010 06:03 AM Robby Workman wrote the following:
> On Sat, 05 Jun 2010 23:42:21 +0300
> Thanasis <thanasis@asyr.hopto.org> wrote:
>
>> ...
>> and dmesg is flooded by DROP log messages etc.
>> ...
>
>
>   1) Do you really *care* about most of what you're logging?
>  1a) If so, why?
Yes and no, because it's a recent install, and I would like to watch
closer, at least for a while ...
>
>   2) Install ulogd and use -j ULOG instead of -j LOG.
I have read about ulog but the kernel config help says for ULOG that it
is deprecated:

"CONFIG_IP_NF_TARGET_ULOG:
This option enables the old IPv4-only "ipt_ULOG" implementation =E2=94=82
=E2=94=82 which has been obsoleted by the new "nfnetlink_log" code (see=
 =E2=94=82
=E2=94=82 CONFIG_NETFILTER_NETLINK_LOG). "

That is why I was asking about CONFIG_NETFILTER_NETLINK_LOG in the fist
place...

