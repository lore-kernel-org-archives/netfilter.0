From: Drew Einhorn <drew.einhorn@starband.net>
Subject: Re: vpn between networks with private ip network segment conflicts
Date: 27 May 2003 11:34:53 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054056892.1837.85.camel@lo>
References: <1054051400.1836.56.camel@lo>
	 <1054053025.13730.95.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054053025.13730.95.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Oooo ... I was afraid that was going to be the answer.

I'll wait a bit and see if someone has a better idea before starting
in on renumbering a network.

On Tue, 2003-05-27 at 10:30, Ray Leach wrote:
> On Tue, 2003-05-27 at 18:03, Drew Einhorn wrote:
> > My LAN uses network segments 192.168.0.0/24, 192.168.1.0/24, etc.
> > So does the remote network I need to vpn to (probably using some flavor
> > of pptp).
> > 
> > Is there an odd nat variant that will solve this problem.
> > Probably need to do some kind of dns transformation on each side.
> > 
> > Is there any easy solution.  Perhaps it would be easier (but not easy)
> > to get the network segments renumbered on one end or the other.
> 
> Oooo ... I would go with the second option. Get one end renumbered.
-- 
Drew Einhorn <drew.einhorn@starband.net>


