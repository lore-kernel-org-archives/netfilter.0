From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Dual ISPs - controlled path for certain ports - ip route
	2	balancing for others
Date: Thu, 23 Sep 2004 09:18:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409230918.41588.Alistair@nerdnet.ca>
References: <200409221315.05822.Alistair@nerdnet.ca>
	<4152987C.90100@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4152987C.90100@fastwebnet.it>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 23, 2004 05:33 am, Primero wrote:
> Alistair Tonner wrote:
> >	 I'm wondering if
> >	there are rules I can use (consider that the webserver/mailserver and FTP
> >	server are sadly on the firewall at the moment) to force the servers to
> > reply via the DSL or internal lan only, even if the default route points
> > at the cable link? (this would be a quick and dirty solution for me) --
> > the cablelink will have to shortly support a VPN tunnel back to work.
>
> i was using Iproute2 like u until a day i decided to "man iptables" ....
>
> i've found in EXTENSIONS TARGET section:
>
> ....
> ROUTE
>
>        --continue
>               Behave like a non-terminating target and continue
> traversing the rules.  Not valid in combination with `--iif'
> ....
>
> this way u can use a normal matching syntax of iptables and change the
> routing decision about the "interesting traffic".
> I hope it works since i had no time yet to try it out ... let us know :)
>
	
	*thwacks* self in head -- yes .. I've noted this in the past myself.. .but it 
had just wandered off into space ... thanks ... I've just recompiled the 
kernel ... the reason it wandered was that ROUTE is NOT in most default 
kernel configs, its in patch-o-matic.  I'm running gentoo which does NOT have 
any consistent method of pulling in patch-o-matic.  POM on gentoo takes some 
more work than normal, but I've got patched in and up and runnng.  

	Further question to the list.  Consider that I'm using iproute2 to share the 
connection to two different ISP's, and I want specific traffic from my 
internal network to only go out one interface.  Where in mangle would I put 
these rules?

	For the moment I'm trying this by putting them in PREROUTING since I'd want 
the oif to OVERRIDE routing decisions -- I have my SNAT rules in place based 
on output interface, but perhaps my logic is wrong ...   Has anyone done this 
yet or am I headed for experimental territory??

	*grins*


	Alistair Tonner	
	Rogers Shared Operations, 
	Senior Operational Analyst, 
	(soon to be junior HP/UX os support)

