From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 10:15:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916141505.GB16559@cannon.eng.us.uu.net>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew> <200309161256.15286.gdh@acentral.co.uk> <1063716386.31093.160.camel@raylinux.internal> <20030916131153.GA16559@cannon.eng.us.uu.net> <1063720447.31093.166.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1063720447.31093.166.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tue, Sep 16, 2003 at 03:54:08PM +0200, Ray Leach wrote:

> > > Yeah, connection tracking automagically implies state inspection.
> > 
> > OK. Thanks for the informative comments but can you lay out the steps to
> > prevent stateful inspection? For example, how to unload "ip_conntrack" and
> > to prevent it from being reloaded again?
> > 
> Personally, I would re-compile the kernel without connection tracking
> support.

OK. If you recompile without conntrack, can you do NAT? I'm just wondering?

Thanks again.

Ramin

