From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [iptables] misleading print
Date: Mon, 5 Dec 2011 16:44:14 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112051644001.14067@frira.zrqbmnf.qr>
References: <jbinrb$2l7$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jbinrb$2l7$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-12-05 16:26, U.Mutlu wrote:

> I have in my script these statements:
>  iptables -A INPUT  -i lo -j ACCEPT
>  iptables -A OUTPUT -o lo -j ACCEPT
>
> When doing "iptables -L -n" then the above gets shown as this:
>  ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>
> IMHO, this could easily be misinterpreted if one looks
> only at the iptables output, because the crucial info,
> ie. that it applies to the "lo" device only, is missing...
>
> Right?

That's why one should use iptables -S or iptables-save.
