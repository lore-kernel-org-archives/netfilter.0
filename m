From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: How to check user-defined chains
Date: Mon, 28 Oct 2002 13:39:07 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210281338010.9645-100000@localhost.localdomain>
References: <3DBD5A83.7040900@pandora.be>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DBD5A83.7040900@pandora.be>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Mon, 28 Oct 2002, Bart wrote:

> 
> 
> Oleksandr Darchuk wrote:
> 
> >Hello.
> >
> >Are there any ways to know all user-defined chains for iptables (like 
> >/proc/net/ip_tables_names for tables)? 
> >I try to builded my ipfw script using many own chains, but it's hard to 
> >delete all of them 
> >
> to delete them all, just perform iptables -X

not quite.  this will delete only the u-d chains in the default
filter table.  you would still have to delete the chains in the
other two tables with:

  # iptables -t nat -X
  # iptables -t mangle -X

rday

p.s.  of course, if you're only building chains in the filter table
to begin with, then you're right.


