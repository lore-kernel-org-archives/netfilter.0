From: William Stearns <wstearns@pobox.com>
Subject: RE: logging with iptables
Date: Sun, 14 Dec 2003 11:57:35 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312141156080.2784-100000@sparrow>
References: <37701240971DD31193970000F6CCB9F704CB7EFF@duke.datcon.co.uk>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <37701240971DD31193970000F6CCB9F704CB7EFF@duke.datcon.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Piers Finlayson <pdf@dataconnection.com>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, ML-netfilter <netfilter@lists.netfilter.org>

Good day, Piers,

On Sun, 14 Dec 2003, Piers Finlayson wrote:

> Bill - thanks a lot.  That's exactly what I was after.

	All the credit goes to Harald - I'm just the messenger.  :-)
	Cheers,
	- Bill

> On Sat, 13 Dec 2003, Antony Stone wrote:
> 
> > On Saturday 13 December 2003 9:45 am, Piers Finlayson wrote:
> > 
> > > Is it possible to log a packet's entire contents with iptables,
> > > rather than just useful stuff from the packet header?
> > 
> > No.  Netfilter has a single fixed logging format which shows onlt the
> > packet header information, nothing from the body itself.
> > 
> > > I can run tcpdump/tethereal etc to log the packets I'm interested
> > > in, but figure it would be much neater if I can just use iptables to
> > > do it.
> > 
> > You might want to have a look at http://gnumonks.org/projects/ulogd to
> > see if it will help with what you want, but I suspect tcpdump etc will
> > remain your best bet.
> 
> 	It will help. http://www.stearns.org/doc/iptables-ulog.current.html


---------------------------------------------------------------------------
        "I plan to live forever.  So far, so good."
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


