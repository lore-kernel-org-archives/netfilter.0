From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Tue, 1 Jul 2003 10:34:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030701143420.GA32195@cannon.eng.us.uu.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630142908.GA29083@cannon.eng.us.uu.net> <3F00986E.4040306@adsl-209-204-165-151.sonic.net> <200307010200.00067.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200307010200.00067.Alistair@nerdnet.ca>
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
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: Michael <freeware@adsl-209-204-165-151.sonic.net>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Tue, Jul 01, 2003 at 02:00:00AM -0400, Alistair Tonner wrote:

> On June 30, 2003 04:07 pm, Michael wrote:
> 
> >
> > That's Squid looking up my domain. (Why twice? I don't know.) The OUTPUT
> > chain in the nat table is
> >
> > Chain OUTPUT (policy ACCEPT)
> >  target prot opt in out source     destination
> >  DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.5     multiport dports 80,443
> > to:192.168.0.8 DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.6     multiport
> > dports 80,443 to:192.168.0.9
> >
> >
> 
> 	Please read this page
> 	
> 	http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-3.html
> 
> 	Why are you DNATting in OUTPUT?

Good catch. I guess he's doing this because squid is bound to the public
IP's. However, this is not necessary and for older iptables versions there
was a problem with natting in the OUTPUT chain...

Ramin

> -- 
> 
> 	Alistair Tonner
> 	nerdnet.ca
> 	Senior Systems Analyst - RSS
> 	
>      Any sufficiently advanced technology will have the appearance of magic.
> 	Lets get magical!

