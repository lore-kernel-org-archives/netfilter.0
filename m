From: Dean Anderson <dean@av8.com>
Subject: Re: Unable to block ICMP
Date: Sun, 15 Apr 2007 16:29:31 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0704151606090.16569-100000@citation2.av8.net>
References: <46225C81.6070503@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46225C81.6070503@gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ronald <ronald645@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 15 Apr 2007, Ronald wrote:

> Well, what I actually wanted (which I probably explained wrong) is that 
> my ports that are not in use (closed) are being invisible (no ICMP 
> echo). That better?

ICMP echo is not a per-port operation.  I don't know what the site you
quote means by 'closed'.  Also, blocking all ICMP is never a really good
idea: (recently updated)

http://www.av8.net/ICMPTypes.txt

I agree with the other posters': that you should block TCP and UDP
connections to all ports by default, and open only those that you trust
are exposable to the world, or better, just to whomever you have to
expose them to.

I suggest searching for instructions on how to do linux firewalls, and
following them, rather than trying to roll your own rules by trial and
error.

		--Dean

-- 
Av8 Internet   Prepared to pay a premium for better service?
www.av8.net         faster, more reliable, better service
617 344 9000   



