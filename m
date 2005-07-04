From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: help me
Date: Mon, 4 Jul 2005 08:45:27 -0500
Message-ID: <200507040845.27832.rob0@gmx.co.uk>
References: <20050704103908.15589.qmail@web53106.mail.yahoo.com>
	<42C913B3.8010202@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C913B3.8010202@web.de>
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

On Monday 04 July 2005 05:47, Christoph Georgi wrote:
> make the default policy of the incoming chain (input) drop, but allow
> established and related traffic, and allow all outgoing traffic by
> setting the default policy to allow for the output chain (although
> it's adviced to specify the outgoing traffic further..)

Why, and by whom, is that advised?

> umar draz wrote:
> > [snip]
> > how i can do it

All this is clearly described in the Packet Filtering HOWTO. Or you can 
use one of many ready-made scripts without bothering to learn how 
firewalls work.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

