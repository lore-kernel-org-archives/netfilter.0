From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT Not working
Date: Mon, 12 Jul 2004 17:33:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121733.55059.Antony@Soft-Solutions.co.uk>
References: <04fe01c46822$af0ae4c0$1a07a8c0@civic2k> <200407121659.51187.Antony@Soft-Solutions.co.uk> <059201c4682b$21f95f90$1a07a8c0@civic2k>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <059201c4682b$21f95f90$1a07a8c0@civic2k>
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

On Monday 12 July 2004 5:13 pm, Nicolas Ross wrote:

> On Monday 12 July 2004 4:59 pm, Antony Stone wrote:
>
> > Yup, it's listening on TCP port 5003 alright :)
> >
> > Does the mac have a default route to send reply packets back to the
> > remote client through the firewall?
>
> Between the time I wrote my message, and now, I finally got my hand on it.
>
> The probleme was that the default route on that host was not the RH
> firewall, but another box wich connects with a vpn to another network at
> another location, so the route back to the source host doesn't pass trough
> the firewall, thus the problem...

Here's one of my sigs, especially for you :)

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


