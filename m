From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Transparent proxy with IPv6 on Linux [REDIRECT target is gone]
Date: Mon, 4 Apr 2011 13:29:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104041329220.18491@obet.zrqbmnf.qr>
References: <4D995361.9030301@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D995361.9030301@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian G <unixman83@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-04-04 07:13, Brian G wrote:

> Hi, on Linux with netfilter: previously I could do "iptables -j REDIRECT" to
> create a IPv4 transparent proxy. However, this is unsupported on IPv6.
>
> How can I achieve this? iptables6 removed the REDIRECT target because it does
> not support Network Address Translation in IPv6.

(Nothing was removed, it was never there.)

