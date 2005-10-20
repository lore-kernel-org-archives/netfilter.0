From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: match n packets every m
Date: Thu, 20 Oct 2005 18:48:23 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510201837400.27782@filer.marasystems.com>
References: <4357B648.90700@mbigroup.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4357B648.90700@mbigroup.it>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Roberto Ferrari <rferrari@mbigroup.it>
Cc: netfilter@lists.netfilter.org

On Thu, 20 Oct 2005, Roberto Ferrari wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi all,
> I'm trying to find a way to match _n_ ip packets every _m_
> I've tryied with the nth extension, but I've not been able to obtain
> this thing.
> I've seen that I could insert a rule with "--packet x" for m times, if
> I've specifyied "--every m", but I'd like to follow some other way, more
> flexible.
> Could someone kindly let me know if there is a smart way to do it?
> Thank you a lot,


The simplest and most sane would probably be to extend nth with what you 
want.

If not you will need the nth match repeated many times (n times) like you 
describe, with different --packet but same "--every m --counter X", 
finally followed by a "-m nth --every m --counter X" to match all the 
other..

Regards
Henrik

