From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: VLANs and DNAT
Date: Fri, 25 Jul 2003 09:40:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030725134033.GC29983@cannon.eng.us.uu.net>
References: <3F206E52.2090307@suse.net.au> <Pine.LNX.4.44.0307251115230.1760-100000@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0307251115230.1760-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: Damien Mason <kinetic@suse.net.au>, netfilter@lists.netfilter.org

On Fri, Jul 25, 2003 at 11:17:57AM +0100, Chris Wilson wrote:

> > But I cannot specify an interface -i eth1.2 in the prerouting, because 
> > it occurs pre-routing?
> 
> I don't see why you can't do this. We do it and it works. You might get a
> warning about "strange characters in interface name" if you have an old
> iptables version, but it should still work.

This is a typo. What he meant was "-o"...

> >     How can I forward traffic to a host on a vlan when the vlans don't 
> > use unique addressing schemes?.. I was thinking I may have to -j 
> > REDIRECT the traffic to another chain, and forward it from there?
> 
> I don't think the REDIRECT target would help you here.

Absolutely. REDIRECT has nothing to do with "REDIRECT the traffic to
another chain".

Ramin

> 
> Cheers, Chris.

