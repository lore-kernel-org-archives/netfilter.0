From: Rob Sterenborg <rob@sterenborg.info>
Subject: Re: Preventing port scanning
Date: Wed, 07 Apr 2004 21:42:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081366957.8571.6.camel@katala.sterenborg.info>
References: <20040407185754.596353C97@sterenborg.info>
	 <200404072009.18163.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404072009.18163.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-04-07 at 21:09, Antony Stone wrote:
> On Wednesday 07 April 2004 7:57 pm, Rob Sterenborg wrote:
> 
> > > Is it possible to prevent people from port scanning my
> > > firewall to see whats open?
> >
> > You mean : "iptables -P INPUT DROP" ?
> 
> I'd recommend "iptables -F INPUT" with that choice, sir :)

Of course, where was my mind when I wrote this...
<grin>It's quite effective, however.</grin>


Gr,
Rob



