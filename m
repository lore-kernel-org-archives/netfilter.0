From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 02:48:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9696E5.4030803@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Monday 2010-09-20 01:04, Mr Dash Four wrote:

> When I list my connections with 'cat /proc/net/nf_conntrack' I get the SELinux
> context secmark as a number, like secmark=XXX.
>
> Is there a way I could map that number to the name of the actual context when I
> set it up originally with the --selctx option in iptables? If that is not
> possible do you plan to include such feature in the upcoming versions of
> netfilter?

Apart from SMACK, I don't think the kernel has knowledge about any names 
of sorts, especially since SELinux labels seem to be able to 
be longer than 8 chars.

So if anything, it would be done so in conntrack-tools which you should 
be using over /proc anyway.
