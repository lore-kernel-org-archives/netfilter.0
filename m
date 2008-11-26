From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Quickly checking number of rules/chains
Date: Wed, 26 Nov 2008 16:51:23 +0100
Message-ID: <1227714683.8883.13.camel@enterprise.ims-firmen.de>
References: <1227714230.8883.7.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1227714230.8883.7.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2008-11-26 at 16:43 +0100, Thomas Jacob wrote:
> I'm looking for something that can frequently check this without having
> to transfer the whole ruleset from the kernel and decode it, which
> can take up a considerable amount of resources if you have a
> really huge rulesets (XXXk rules), in order to determine whether
> any rules are loaded yet.

What about /sys/module/iptable_{raw,nat,filter,mangle}/refcnt, is this
always zero when no chains and rules exist, and always >0 in the other
case?


