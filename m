From: Wouter Vanwalleghem <wouter@belnet.be>
Subject: Re: Unable to stop tunnel from being "connection-tracked"
Date: 03 Oct 2003 22:02:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065211352.6597.5.camel@xerxes.sketchingroom.home>
References: <1065093009.24289.193.camel@wouter.fw.belnet.be>
	 <20031002135201.GA16283@cannon.eng.us.uu.net>
	 <1065123318.29721.12.camel@xerxes.sketchingroom.home>
	 <20031003194346.GB21954@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031003194346.GB21954@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-10-03 at 21:43, Ramin Dousti wrote:
> On Thu, Oct 02, 2003 at 09:35:18PM +0200, Wouter Vanwalleghem wrote:
> 
> > What I mean is, that if I let the connection disappear from the
> > connection tracking table, immediately afterwards, I no longer get any
> > replies on my ping6's to the tunnelbroker PoP IPv6 address. A tcpdump on
> > my external interface (ppp0) only shows my echo-requests and no packets
> > whatsoever coming from the tunnelbroker PoP. I would at least expect to
> > see some or other packet, e.g. an icmp error message, coming from the
> > tunnelbroker PoP.
> 
> As Harald mentioned earlier, you tcpdump should see everything. If it
> doesn't it might mean that the response is not being sent back or is not
> being delivered correctly, or, the requests didn't make it to the
> other end of the tunnel. Is there any possibility for you to validate
> the receipt of the ping packets at the other end?
> 
> Ramin

I had been suspecting that the problem is not so much with my firewall
(rules) but something fishy happening on the tunnelbroker machine. The
things you and Harald have been telling me seem to confirm my
suspicions.

I am currently in contact with the tunnelbroker maintainer and checking
wether my pings reach the end of the tunnel is one of the things on the
check-list. I will get back to you with the result.

Thanks for your trouble so far.
And that goes for Harald too, of course.

Wouter


