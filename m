From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: No internet connection
Date: Thu, 9 Sep 2004 17:02:42 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909160242.GO8419@metastasis.org.uk>
References: <20040909140459.92337.qmail@web50209.mail.yahoo.com>
	<1094739351.2044.35.camel@wolfpack.ljm.dom>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094739351.2044.35.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Sep 09, 2004 at 10:15:51AM -0400, Jason Opperisano wrote:
> On Thu, 2004-09-09 at 10:04, Giancarlo Boaron wrote:
> > Hello.
> > I'm testing a new iptables script on my server box but
> > after some minuts that this script is running, the
> > clients in my LAN have no access to Internet.
> > I'm using SQUID for proxing and caching.

<snip>

> i've been batting about zero with my stabs in the dark here
> recently--but here goes...

Heh, nice way of putting it.

> is it possible that you get your external IP via DHCP; and that you're
> blocking the DHCP packets between your firewall and the ISP's DHCP
> server.  so you get an IP, start up your firewall, and at the first
> semaphore period, and either the DHCP server or client decides the
> other is no longer there, and your IP gets released?

Isn't "some minutes" a rather short time for a DHCP lease to expire
though?

That said, I'm not even going to swing for this one until we get some
more information.

-- 
mors omnia vincit

