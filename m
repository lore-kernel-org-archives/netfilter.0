From: Piers Finlayson <pdf@dataconnection.com>
Subject: RE: logging with iptables
Date: Sun, 14 Dec 2003 16:28:50 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37701240971DD31193970000F6CCB9F704CB7EFF@duke.datcon.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'William Stearns' <wstearns@pobox.com>, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: ML-netfilter <netfilter@lists.netfilter.org>

Bill - thanks a lot.  That's exactly what I was after.

-----Original Message-----
From: William Stearns [mailto:wstearns@pobox.com]
Sent: 13 December 2003 16:38
To: Antony Stone; Piers Finlayson
Cc: ML-netfilter; William Stearns
Subject: Re: logging with iptables


Good day, Piers,

On Sat, 13 Dec 2003, Antony Stone wrote:

> On Saturday 13 December 2003 9:45 am, Piers Finlayson wrote:
> 
> > Is it possible to log a packet's entire contents with iptables, rather
than
> > just useful stuff from the packet header?
> 
> No.   Netfilter has a single fixed logging format which shows onlt the
packet 
> header information, nothing from the body itself.
> 
> > I can run tcpdump/tethereal etc to log the packets I'm interested in,
but
> > figure it would be much neater if I can just use iptables to do it.
> 
> You might want to have a look at http://gnumonks.org/projects/ulogd to see
if 
> it will help with what you want, but I suspect tcpdump etc will remain
your 
> best bet.

	It will help. http://www.stearns.org/doc/iptables-ulog.current.html
	Cheers,
	- Bill

---------------------------------------------------------------------------
	The thing that I suspect matters most is that Telsa is more 
important to me than sitting in front of a computer reading email. 
	- Alan Cox
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------

