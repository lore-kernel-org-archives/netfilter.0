From: Jason Opperisano <opie@817west.com>
Subject: Re: Port is open but I am unable to connect
Date: Wed, 08 Sep 2004 07:35:04 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094643303.1903.3.camel@wolfpack.ljm.dom>
References: <413E0B9E.8010708@list.idg.dk>
	<1094588398.1890.54.camel@wolfpack.ljm.dom>
	<413EA8E9.3090700@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413EA8E9.3090700@list.idg.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-08 at 02:38, Jacob Friis Larsen wrote:
> > i would content that while you believe your source IP is 1.2.3.4 in this
> > scenario--it; in fact, is not.
> 
> I know.
> 1.2.3.4 is just for the example :)
> 
> > try:
> > 
> >   iptables -A INPUT -j LOG --log-prefix "FW DROP INPUT: "
> > 
> > and see what the logs have to say about it.
> 
> This will log all incoming packets?

setting the above as you last rule, in combination with setting the
POLICY of the INPUT chain to DROP, will log all packets dropped by the
INPUT chain.  similarly:

  iptables -A OUTPUT -j LOG --log-prefix "FW DROP OUTPUT: "

will log all packets dropped by the OUTPUT chain; which in your case,
should show you what Aleksandar already pointed out--you don't allow
ESTABLISHED packets out through the OUTPUT chain.

-j

-- 
Jason Opperisano <opie@817west.com>


