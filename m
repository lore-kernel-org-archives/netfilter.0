From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: source-mac filtering
Date: Mon, 12 Jan 2004 10:52:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040112155202.GA8023@cannon.eng.us.uu.net>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com> <20040111163756.GA6168@cannon.eng.us.uu.net> <1073847935.13069.16.camel@carve.personal.localdomain> <200401120110.08378.Alistair Tonner <>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401120110.08378.Alistair Tonner <>
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
To: netfilter-admin@lists.netfilter.org
Cc: "Tarek W." <mailinglists1@hotpop.com>, netfilter@lists.netfilter.org

On Mon, Jan 12, 2004 at 01:10:08AM -0500, netfilter-admin@lists.netfilter.org wrote:

> 	I'll accept that .. but I have a question ... is ARP routing not 
> 	related?? 
> 	Are ARP queries not ethernet broadcasts on a similar level to 
> 	DHCP broadcasts??

I don't understand the question.

ARP as in do_arp() is being called by IP stack itself. DHCP broadcasts
are application invoked calls.

Now, can you rephrase the question again?

Ramin

> 
> 	(okay .. thats mighty off topic ..but perhaps its something we can 
> 	consider network related)
> 
> 	Alistair

