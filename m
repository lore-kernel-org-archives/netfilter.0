From: William Stearns <wstearns@pobox.com>
Subject: Re: logging with iptables
Date: Sat, 13 Dec 2003 11:38:01 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312131134280.2784-100000@sparrow>
References: <200312130958.24160.Antony@Soft-Solutions.co.uk>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312130958.24160.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Piers Finlayson <pdf@dataconnection.com>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good day, Piers,

On Sat, 13 Dec 2003, Antony Stone wrote:

> On Saturday 13 December 2003 9:45 am, Piers Finlayson wrote:
> 
> > Is it possible to log a packet's entire contents with iptables, rather than
> > just useful stuff from the packet header?
> 
> No.   Netfilter has a single fixed logging format which shows onlt the packet 
> header information, nothing from the body itself.
> 
> > I can run tcpdump/tethereal etc to log the packets I'm interested in, but
> > figure it would be much neater if I can just use iptables to do it.
> 
> You might want to have a look at http://gnumonks.org/projects/ulogd to see if 
> it will help with what you want, but I suspect tcpdump etc will remain your 
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


