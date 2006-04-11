From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Tue, 11 Apr 2006 15:10:02 -0400
Message-ID: <443BFF0A.7050303@tmr.com>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>	<20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net>	<20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>	<20060409144534.GN29797@vianova.fi> <87psjqg2nt.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751121AbWDKVca@vger.kernel.org>
In-Reply-To: <87psjqg2nt.fsf@hades.wkstn.nix>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nix <nix@esperi.org.uk>
Cc: Patrick McHardy <kaber@trash.net>, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org, davem@davemloft.net

Nix wrote:
> On 9 Apr 2006, Ville Herva yowled:
>> On Sun, Apr 09, 2006 at 05:44:16PM +0300, you [Ville Herva] wrote:
>>> I just realized 
>>> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
>>> should probably be set. I'm building a new kernel now...
>> Ok, that seems to do it.
>>
>> Thanks for the help, and sorry for the noise. I hope not too many people hit
>> the same glitch while upgrading...
> 
> I cetainly did. A simple `make oldconfig' ends up zapping pretty much
> all the old iptables CONFIG_ options, so you end up with not much of
> iptables or netfilter left.
> 
> I must admit not quite understanding why the xtables stuff is needed:
> I thought that was needed for userspace connection tracking, which
> while it sounds cool isn't something I'm using yet.
> 
I think the root of the problem is that "make oldconfig" doesn't give 
any warning when options are removed. So there's no warning that 
iptables is gone, because the help for the new options doesn't tell you 
"replaces XXXX" even if you as for help.

Suggestion: how hard would it be to have some extra value like y/n/m 
which says print the help even though the option is gone? That would be 
a reasonable thing to do for a version or two after things go away, and 
certainly lower cost than having testers ask questions, rebuild kernels, 
or just go away mad.
