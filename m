From: Nix <nix@esperi.org.uk>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 09 Apr 2006 17:00:06 +0100
Message-ID: <87psjqg2nt.fsf@hades.wkstn.nix>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>
	<20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net>
	<20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>
	<20060409144534.GN29797@vianova.fi>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750805AbWDIQAd@vger.kernel.org>
In-Reply-To: <20060409144534.GN29797@vianova.fi> (Ville Herva's message of "9 Apr 2006 15:47:23 +0100")
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vherva@vianova.fi
Cc: Patrick McHardy <kaber@trash.net>, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org, davem@davemloft.net

On 9 Apr 2006, Ville Herva yowled:
> On Sun, Apr 09, 2006 at 05:44:16PM +0300, you [Ville Herva] wrote:
>> I just realized 
>> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
>> should probably be set. I'm building a new kernel now...
> 
> Ok, that seems to do it.
> 
> Thanks for the help, and sorry for the noise. I hope not too many people hit
> the same glitch while upgrading...

I cetainly did. A simple `make oldconfig' ends up zapping pretty much
all the old iptables CONFIG_ options, so you end up with not much of
iptables or netfilter left.

I must admit not quite understanding why the xtables stuff is needed:
I thought that was needed for userspace connection tracking, which
while it sounds cool isn't something I'm using yet.

-- 
`On a scale of 1-10, X's "brokenness rating" is 1.1, but that's only
 because bringing Windows into the picture rescaled "brokenness" by
 a factor of 10.' --- Peter da Silva
