From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Unable to stop tunnel from being "connection-tracked"
Date: Fri, 3 Oct 2003 15:43:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003194346.GB21954@cannon.eng.us.uu.net>
References: <1065093009.24289.193.camel@wouter.fw.belnet.be> <20031002135201.GA16283@cannon.eng.us.uu.net> <1065123318.29721.12.camel@xerxes.sketchingroom.home>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065123318.29721.12.camel@xerxes.sketchingroom.home>
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
To: Wouter Vanwalleghem <wouter@belnet.be>
Cc: netfilter@lists.netfilter.org

On Thu, Oct 02, 2003 at 09:35:18PM +0200, Wouter Vanwalleghem wrote:

> What I mean is, that if I let the connection disappear from the
> connection tracking table, immediately afterwards, I no longer get any
> replies on my ping6's to the tunnelbroker PoP IPv6 address. A tcpdump on
> my external interface (ppp0) only shows my echo-requests and no packets
> whatsoever coming from the tunnelbroker PoP. I would at least expect to
> see some or other packet, e.g. an icmp error message, coming from the
> tunnelbroker PoP.

As Harald mentioned earlier, you tcpdump should see everything. If it
doesn't it might mean that the response is not being sent back or is not
being delivered correctly, or, the requests didn't make it to the
other end of the tunnel. Is there any possibility for you to validate
the receipt of the ping packets at the other end?

Ramin

