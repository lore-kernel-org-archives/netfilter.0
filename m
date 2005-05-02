From: Jason Opperisano <opie@817west.com>
Subject: Re: snat
Date: Mon, 2 May 2005 12:14:53 -0400
Message-ID: <20050502161453.GA11544@bender.817west.com>
References: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
	<4276504A.7040103@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4276504A.7040103@riverviewtech.net>
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

On Mon, May 02, 2005 at 11:07:38AM -0500, Taylor, Grant wrote:
> Marco Berizzi wrote:
> >Hello everybody.
> >I would like to better understand the SNAT target.
> >Man states:
> >
> >"You can add several --to-source option. If you specify
> >more than one source address, either via an address range
> >or multiple --to-source options, a simple round-robin  (one
> >after another in cycle) takes place between these addresses.
> >
> >I would like to know if this round-robin cycle is per packet
> >or per socket.
> >
> >TIA
> 
> Don't hold me to this, but I think that the SAME target will implement some 
> SNATing across multiple IPs and ensure that any given connection and 
> possibly system will get the ""same source IP (hens the name) as it goes 
> out.  Can any one back me up on this?

SAME is a way to have a pool of addresses for SNAT, but keep either (a)
connections between the same src and dst IP SNAT-ed to the same SNAT IP
or (b) all connections from a single src IP always get the same SNAT IP
(regardless of dst IP).

for the sake of completeness, SAME also works for DNAT as well.

-j

--
"Peter: Oh, you people can kiss the fattest part of my ass."
        --Family Guy

