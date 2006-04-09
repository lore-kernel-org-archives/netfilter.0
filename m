From: Ville Herva <vherva@vianova.fi>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 9 Apr 2006 20:10:28 +0300
Message-ID: <20060409171028.GC15954@vianova.fi>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org> <20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net> <20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi> <20060409144534.GN29797@vianova.fi> <87psjqg2nt.fsf@hades.wkstn.nix> <4439385B.6010908@trash.net> <87hd52g065.fsf@hades.wkstn.nix>
Reply-To: vherva@vianova.fi
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750797AbWDIRKf@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87hd52g065.fsf@hades.wkstn.nix>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nix <nix@esperi.org.uk>
Cc: Patrick McHardy <kaber@trash.net>, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

On Sun, Apr 09, 2006 at 05:53:54PM +0100, you [Nix] wrote:
> On Sun, 09 Apr 2006, Patrick McHardy murmured woefully:
> >> I cetainly did. A simple `make oldconfig' ends up zapping pretty much
> >> all the old iptables CONFIG_ options, so you end up with not much of
> >> iptables or netfilter left.
> > 
> > But it does show you all the new options. Admittedly, it would
> > have been better to automatically select the new options when
> > needed, but probably not worth changing it now, it has been
> > like this for two releases I think.
> 
> Oh, yes, it did, and I thought they were userspace-matching related and
> left them off. The real problem is that oldconfig doesn't mention when
> options you *had* enabled disappear.

Likewise for me.

Perhaps iptables could point to a document or a webpage (in case kernel is newer
than the userspace iptables, and has introduced new requirements) that lists
the kernel options that need to be enabled, instead of saying 

 failed iptables v1.3.5: can't initialize iptables table filter: iptables
 who? (do you need to insmod?)

Such verbosity might not be unixy, but during Old Unix times, thousands of people
weren't following -rc kernels...


-- v -- 

v@iki.fi
