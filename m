From: Jason Opperisano <opie@817west.com>
Subject: Re: Dropping network "noise"
Date: Wed, 16 Feb 2005 08:28:31 -0500
Message-ID: <1108560511.4832.18.camel@hubcap.ljm.dom>
References: <200502130928.41225.e-boogie@yandex.ru>
	<20050215161520.GA19496@bender.817west.com>
	<200502161034.50448.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502161034.50448.e-boogie@yandex.ru>
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

On Wed, 2005-02-16 at 02:34, Mikhail Zotov wrote:
> >   -m pkttype --pkt-type broadcast -j DROP
> >   -m pkttype --pkt-type multicast -j DROP
> > 
> > -j
> 
> Great.  Thanks a lot for the idea.  These rules call another question:
> Are broadcast/multicast messages used in Linux/UNIX or other than
> windoops networks?  If so, will not these rules break anything?
> I haven't seen such rules in any iptables guides/scripts available in
> the Internet.

i usually put rules like this at the end of chains; before the log rule,
as part of a "no_log" chain, to keep the noise out of the logs.  so if
you needed to allow certain broadcast or multicast traffic, you would do
it before these rules.  on a dedicated firewall machine, the only thing
i can think of would be if the machine is a DHCP server or client (or
both)--though the broadcast part of that conversation *should* be at the
BPF level and not require firewall rules.

-j

--
"Lisa, Vampires are make-believe, like elves, gremlins, and eskimos."
	--The Simpsons


