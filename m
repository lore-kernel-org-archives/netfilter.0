From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: Re: NAT, ICMP and MTU issues
Date: Mon, 22 Sep 2003 10:49:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064224183.6070.4.camel@angua.localnet>
References: <1063986116.28941.41.camel@angua.localnet>
	 <1063988356.5012.69.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063988356.5012.69.camel@elendil.intranet.cartel-securite.net>
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

On Fri, 2003-09-19 at 17:19, Cedric Blancher wrote:
> Just a 0.02e quick thought...
> You're facing a situation a bit like routing LANs through a PPPoE link.
> Solution is to clamp TCPMSS down to correct value when routing them.

Interesting idea.  I'm not sure these packets go through the FORWARD
table - the rules I have in would not allow them to.  However it gives
me something to try playing with - variations using another table
probably.

Cheers
	Nigel.
-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


