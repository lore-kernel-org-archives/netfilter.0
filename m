From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: Re: NAT, ICMP and MTU issues
Date: Mon, 22 Sep 2003 12:07:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064228854.6070.16.camel@angua.localnet>
References: <1063986116.28941.41.camel@angua.localnet>
	 <1063988356.5012.69.camel@elendil.intranet.cartel-securite.net>
	 <1064224183.6070.4.camel@angua.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064224183.6070.4.camel@angua.localnet>
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
To: netfilter@lists.netfilter.org

On Mon, 2003-09-22 at 10:49, Nigel Metheringham wrote:
> On Fri, 2003-09-19 at 17:19, Cedric Blancher wrote:
> > Just a 0.02e quick thought...
> > You're facing a situation a bit like routing LANs through a PPPoE link.
> > Solution is to clamp TCPMSS down to correct value when routing them.
> 
> Interesting idea.  I'm not sure these packets go through the FORWARD
> table - the rules I have in would not allow them to.  However it gives
> me something to try playing with - variations using another table
> probably.

OK, I was talking utter rubbish...

The connection does indeed go through the FORWARD table and there is
indeed a set of rules to allow it to do so, written by myself, so my
mind has finally gone :-/

Putting a mangle table rule in to clamp MSS does appear to have fixed
the problem - just need to redo the whole test from scratch to ensure I
haven't something else in the chain thats affecting it.

	Nigel.
-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


