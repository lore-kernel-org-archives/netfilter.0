From: seberino@spawar.navy.mil
Subject: Re: IDS better than hardcore iptables rules?
Date: Sun, 6 Feb 2005 13:29:18 -0800
Message-ID: <20050206212918.GA828@spawar.navy.mil>
References: <1107695009.20774.1.camel@nostromo.bgsecm.com>
	<Pine.LNX.4.05.10502061533170.352-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.05.10502061533170.352-100000@darkstar.sysinfo.com>
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
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: Jose Maria Lopez <jkerouac@bgsec.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

> Can't these kind of packets get handled by an INVALID match, with one
> rule per appropriate chain?

But having a FIN segment without the ACK set is
*unusual* but not INVALID.  The answer to your question
depends on what is considered INVALID.

I'm still not sure where to learn this level of detail
to understand what flag combos are invalid or unusual.

Chris

