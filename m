From: Ville Herva <vherva@vianova.fi>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 9 Apr 2006 17:45:35 +0300
Message-ID: <20060409144534.GN29797@vianova.fi>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org> <20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net> <20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>
Reply-To: vherva@vianova.fi
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750754AbWDIOpk@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060409144416.GO1686@vianova.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org, davem@davemloft.net

On Sun, Apr 09, 2006 at 05:44:16PM +0300, you [Ville Herva] wrote:
> I just realized 
> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
> should probably be set. I'm building a new kernel now...

Ok, that seems to do it.

Thanks for the help, and sorry for the noise. I hope not too many people hit
the same glitch while upgrading...


-- v -- 

v@iki.fi
