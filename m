From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Round Robin Load Balancing
Date: Mon, 11 Aug 2003 03:25:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811072554.GA10531@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192E1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0192E1@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Javier Govea <jgovea@magma.ca>, netfilter@lists.netfilter.org

On Mon, Aug 11, 2003 at 08:30:20AM +1000, George Vieira wrote:

> Hate to burst your bubble

Hey, don't worry...

> but isn't the ROUTE module being used a _little_ too late.

No, not really. At least not according to:

http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE

> I mean, it's suppose to reroute to a new device but your using it in POSTROUTING which means it's to late to reroute it (basically leaving the interface and out to the internet)...
> 

That is the traditional routing, but this module _forces_ the packet to go
wherever you want... With that regard it doesn't matter if the routing
desision has already been made or not...

Ramin

> >From memory, the ROUTE module is supposed to be used in PREROUTING on the internal interface so that it doesn't hit the routing table yet and the rule modifies which interface to go out on..
> 


