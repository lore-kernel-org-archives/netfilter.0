From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Filtering out spoofed network addresses
Date: Tue, 1 Jul 2003 15:49:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030701194925.GA353@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0306301039060.23945-100000@hay.haya.qc.ca> <20030630153033.GA29474@cannon.eng.us.uu.net> <1057087972.721.34.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1057087972.721.34.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: "James R. Hay" <jrhay@HayA.QC.CA>, Netfilter <netfilter@lists.netfilter.org>

On Tue, Jul 01, 2003 at 09:32:53PM +0200, Martin Josefsson wrote:

> > > Hi folks,
> > 
> > Hi James,
> > 
> > Indeed, you cannot do this with netfilter. Netfilter does not provide you
> > with the "don't care bits" as cisco calls it.
> 
> What's wrong with:
> 
> -s 0.0.0.0/0.0.255.255

Yes. Just tried it and it worked. Excellent! So the mask is just an arbitrary
mask. Thanks for pointing that out :-) I have to go and redo lots of rules
that I made under a false assumption...

Ramin

> ?
> 
> -- 
> /Martin

