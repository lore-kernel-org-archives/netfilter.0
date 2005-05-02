From: "Ken Hilliard" <ken@acotec.com>
Subject: RE: snat
Date: Mon, 2 May 2005 09:52:14 +0700
Message-ID: <000001c54ec1$f5e5cd20$5f01a8c0@compaq>
References: <20050502161453.GA11544@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050502161453.GA11544@bender.817west.com>
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
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

Hey, I'm pretty new to iptables. Where can I get a list of all these
iptables targets. For example, I never heard of (or read about) the SAME
target.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Monday, May 02, 2005 11:15 PM
To: netfilter@lists.netfilter.org
Subject: Re: snat

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
> Don't hold me to this, but I think that the SAME target will implement
some 
> SNATing across multiple IPs and ensure that any given connection and 
> possibly system will get the ""same source IP (hens the name) as it
goes 
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




