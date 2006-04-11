From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Tue, 11 Apr 2006 13:27:36 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0604111326540.928@yvahk01.tjqt.qr>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>
 <20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net>
 <20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>
 <20060409144534.GN29797@vianova.fi> <87psjqg2nt.fsf@hades.wkstn.nix>
 <4439350E.4060306@tomt.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750754AbWDKL2F@vger.kernel.org>
In-Reply-To: <4439350E.4060306@tomt.net>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Tomt <andre@tomt.net>
Cc: Nix <nix@esperi.org.uk>, linux-kernel@vger.kernel.org, vherva@vianova.fi, Patrick McHardy <kaber@trash.net>, netfilter@lists.netfilter.org, davem@davemloft.net

>
> Beeing bitten by such issues in the past, I always diff the old and the new
> config and look for anything suspicious going down.
>

My way:
  gzip -cd /proc/config.gz >.config
  make

The configurator will stop at any new config option, which includes 
xtables. :)


Jan Engelhardt
-- 
