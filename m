From: Nix <nix@esperi.org.uk>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 09 Apr 2006 17:53:54 +0100
Message-ID: <87hd52g065.fsf@hades.wkstn.nix>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>
	<20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net>
	<20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>
	<20060409144534.GN29797@vianova.fi> <87psjqg2nt.fsf@hades.wkstn.nix>
	<4439385B.6010908@trash.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750815AbWDIQyD@vger.kernel.org>
In-Reply-To: <4439385B.6010908@trash.net> (Patrick McHardy's message of "Sun, 09 Apr 2006 18:37:47 +0200")
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: vherva@vianova.fi, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org, davem@davemloft.net

On Sun, 09 Apr 2006, Patrick McHardy murmured woefully:
> Nix wrote:
>>>Thanks for the help, and sorry for the noise. I hope not too many people hit
>>>the same glitch while upgrading...
>> 
>> 
>> I cetainly did. A simple `make oldconfig' ends up zapping pretty much
>> all the old iptables CONFIG_ options, so you end up with not much of
>> iptables or netfilter left.
> 
> But it does show you all the new options. Admittedly, it would
> have been better to automatically select the new options when
> needed, but probably not worth changing it now, it has been
> like this for two releases I think.

Oh, yes, it did, and I thought they were userspace-matching related and
left them off. The real problem is that oldconfig doesn't mention when
options you *had* enabled disappear.

>> I must admit not quite understanding why the xtables stuff is needed:
>> I thought that was needed for userspace connection tracking, which
>> while it sounds cool isn't something I'm using yet.
> 
> Its a unification of the matches and targets that are address family
> independant.

Ah, hence the ipv6-matching stuff turning up in 2.6.16. I see.

-- 
`On a scale of 1-10, X's "brokenness rating" is 1.1, but that's only
 because bringing Windows into the picture rescaled "brokenness" by
 a factor of 10.' --- Peter da Silva
