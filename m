From: Patrick McHardy <kaber@trash.net>
Subject: Re: ipt_MARK/xt_MARK usage problem
Date: Tue, 22 Aug 2006 08:29:27 +0200
Message-ID: <44EAA447.1080004@trash.net>
References: <Pine.LNX.4.61.0608220815560.24532@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750870AbWHVG3a@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0608220815560.24532@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netfilter@lists.netfilter.org

Jan Engelhardt wrote:
> kernel 2.6.17 ships with xt_MARK, but iptables 1.3.5 still uses ipt_MARK. 
> In essence, I cannot use `iptables -j MARK` giving me 
> 
> # iptables -A INPUT -j MARK --set-mark 1
> iptables: Unknown error 4294967295
> 
> I have seen this before and the problem behind this strange error (-1) is 
> that the .targetsize/.matchsize variables in the kernel modules do not 
> match their userspace parts.

No, its a bug in the iptables userspace version you're using, which
makes it report any error as "Unknown error 4294967295". The
error itself is that you're using MARK in the filter table.

> However, this time it seems to be something different:
> 
> # iptables -t mangle -A INPUT -j MARK --set-mark 1
> 
> Works without problems. Am I missing something?
> How do I get MARK back to work in -t filter -- possibly without hacking in 
> xt_MARK.c?

You won't, its not supposed to work in the filter table.
