From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward is not forwarding
Date: Fri, 6 Sep 2002 10:45:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209060945.g869jav01774@vulcan.rissington.net>
References: <EF33C96B91C212479FA2B0B0A96868F80102C887@sydxch02.veritas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EF33C96B91C212479FA2B0B0A96868F80102C887@sydxch02.veritas.com>
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
To: netfilter@lists.netfilter.org

On Friday 06 September 2002 7:22 am, Abraham Kim wrote:

> Dear Stewart, Chris, Steve, and many others...
>
> Thanks for giving me help on this.
>
> I changed "0" to "1" in the ip_forward and
> those 2 machines can talk to each other now. (Wow!)
>
> Everything's perfect, except (this except is always a pain...)
> telnet from Linux to Solaris takes too long to be established
> (it looks hung after the Escape character... message)
>
> It almost takes 1 minutes to give login prompt!
> rlogin is the same (get the command prompt after 1 min!)
> (did not test ssh yet...)
>
> From Solaris to Linux or Solaris to Solaris is not a problem.

Your Solaris box is running tcpwrappers, and is trying to do an IDENT lookup 
to the Linux box, and either your firewall is blocking it or the Linux box 
isn't running an IDENT daemon and therefore doesn't respond.

The Linux box either isn't running tcpwrappers, so the lookup doesn't happen, 
or else it is, and the firewall is allowing the request, and the Solaris box 
is running an IDENT daemon, and replies.

Probably your quickest and easiest solution to this is to get the firewall to 
REJECT the IDENT packets (TCP port 113) from the Solaris box so that it 
doesn't have to wait for a timeout.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

