From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: REDIRCT vs. DNAT...
Date: Fri, 22 Apr 2005 17:30:43 -0500
Message-ID: <42697B13.9030001@riverviewtech.net>
References: <426976D9.2010009@riverviewtech.net>
	<20050422222456.GA5890@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050422222456.GA5890@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> REDIRECT is a special case of DNAT, where the dst IP is rewritten to the
> IP address of the interface the packet is received on (optionally
> re-writing the dst port as well).

So is there really any functional difference if you are wanting to redirect the traffic to the interface that it did come in?  In other words do you know of any kernel differences (number of cycles to execute?) in REDIRECT vs. DNAT?

> i used DNAT in my response, as it wasn't clear from the OP what local IP
> the translated packets needed to be sent to.

*nod*  I had to read the post more than one time too.



Grant. . . .

