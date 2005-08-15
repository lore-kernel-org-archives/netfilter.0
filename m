From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 04:59:13 -0500
Message-ID: <200508150459.13276.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
	<4300612F.6070603@mnemon.de>
	<200508152145.10151.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152145.10151.michael@networkstuff.co.nz>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 2005-August-15 04:45, Michael Hallager wrote:
> I am in the middle of recompiling my kernel for IP Tables logging
> support.

In the OP you mentioned that this is Slackware. Whilst there are 
numerous good reasons why one might wish to compile a custom kernel, 
it's worthy of note that the Slackware stock kernels as configured 
"Just Work" perfectly with iptables.

The best Slackware advice I have is to start with Pat's config for the 
basis for your new kernel. Second best: just use his kernel and 
modules. Slackware-current has 2.4.31, and those packages will work 
seamlessly in any 2.4.x-capable Slackware release (that's 8.0 and 
later. And don't forget the alsa-driver package.)

I generally only compile custom kernels for high-end machines, like 
those with RAM >= 1GB, or SMP.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

