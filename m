From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: connection tracking query
Date: 07 Apr 2003 11:25:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049707513.704.154.camel@staring.direct2internet.com>
References: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: netfilter@lists.netfilter.org

Hi Dhiraj,

Since I wrote it.. I may as well answer it as well;). 

What I (think) I actually wrote, is this. At the PREROUTING chain all of
the actual state changes and state calculations are done. This
"material" can then be used to match packets based on their states, but
the actual states have already been calculated properly before the
PREROUTING chain already.

The actual work surrounding the connection tracking, is hence done
before the PREROUTING chain, so that we have the ability to do stateful
matching.

Hmmm.. I hope you understand what I am saying, this explanation got more
complex than the actual process is=).

As for your second question, yes, the packet _must_ go through the
filter table again. The only tables skipped, if the packet is considered
not NEW, is the nat and mangle table. 

//Oskar Andreasson

On Mon, 2003-04-07 at 11:02, dhiraj.2.bhuyan@bt.com wrote:
> 1. I was reading the Iptables tutorial by Oskar Andreasson
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html.
> It says that connection tracking in done in the PREROUTING chain or OUTPUT
> chain (for locally generated packets). If connection tracking is done only
> at these two chains, what happens to the packets that don't belong to an
> already established connection? I understand that it will have to go through
> the filter rules - before the state table is updated for a NEW/RELATED
> connection. If that is the case, "conntrack" must be taking place at other
> chains too (where the filter is applied). The following document
> http://www.knowplace.org/netfilter/syntax.html does infact say that
> "conntrack" is happening not only in the PREROUTING and the OUTPUT chain,
> but also in INPUT and POSTROUTING chain. What I find strange with this is
> that for a packet that goes through the "FORWARD" chain, "conntrack" is done
> twice on the same packet - first in the "PREROUTING" chain and second in the
> "POSTROUTING" chain. Does anyone have any explanation for this?
> 
> 
> 2. If a packet is found to belong to an already ESTABLISHED connection, does
> it still have to go through the filter rules again?
> 
> 
> Thanks,
> dhiraj
> 
> 


