From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: External IP addresses on internal network
Date: Thu, 28 Aug 2003 14:17:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030828181717.GA3993@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au> <3F4C0519.8000109@Loudoun-Fairfax.com> <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu> <3F4CFD8C.5020404@Loudoun-Fairfax.com> <20030828145632.GC3447@cannon.eng.us.uu.net> <3F4E2844.2050108@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F4E2844.2050108@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Thu, Aug 28, 2003 at 12:05:24PM -0400, Jeffrey Laramie wrote:
> 
> >
> >Could it be that the client machine dials up to AOL, receives that IP
> >address and later it needs to resolve a name and vecause of the DNS
> >settings on the client machine it tries the query 192.168.0.24 with
> >its source 172.144.233.136?
> >
> Thanks for the suggestion. That was my first thought since one of the LAN
> clients is a notebook with dialup ability, but with a DSL connection through
> the LAN it's not used now. I did check it though to see if it still had an
> AOL IP assigned to it or an AOL server listed for DNS. It didn't, and the log
> timestamp indicates that these packets are occuring when a different client
> (with no dialup) is checking AOL mail.
> 

What about this theory (although I don't know anything about the AOL stuff)
that the client connects to AOL. AOL sets up a tunnel with this client
and assigns 172.144.233.136 to it. Then due to the static DNS settings
on the client, a DNS query is made to your named on the firewall, instead
of using AOL's DNS server?

Ramin

