From: Jason Opperisano <opie@817west.com>
Subject: Re: Are these firewall rules impossible to understand?..........
Date: Fri, 11 Mar 2005 13:59:32 -0500
Message-ID: <1110567571.4767.44.camel@hubcap.ljm.dom>
References: <20050311171253.GA17683@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050311171253.GA17683@spawar.navy.mil>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2005-03-11 at 12:12, seberino@spawar.navy.mil wrote:
> I'm skeptical ANYONE really understands all of these.  The ones that really bug me are the ones that insist that all FIN, PSH and URG packets
> must have ACK set.  Who would have know that?
> 
> e.g. /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,FIN
> FIN -j DROP

because FIN's need to be ACKnowledged, which means they need to have an
acknowledgment number; therefore the ACK bit needs to be set.

i doubt there's a statement in RFC 793 that says "FIN packets must have
the ACK bit set" but reading page 39 should lead you to the conclusion
that a FIN with no ACK bit just doesn't make sense.

-j

--
"What's the point of going out, we're just going to end up back
 here anyway?"
	--The Simpsons


