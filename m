From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables bridge filter question
Date: Thu, 18 Mar 2004 23:16:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403182316.47015.Antony@Soft-Solutions.co.uk>
References: <ILECICAFAJIIMPBBLMEAGELNCPAA.gerryw@objectivedomain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ILECICAFAJIIMPBBLMEAGELNCPAA.gerryw@objectivedomain.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 18 March 2004 11:09 pm, Gerry Weaver wrote:

> Hi,
>
> I understand what your suggesting. Perhaps I still didn't explain well
> enough. Here's an example:
>
> [NodeA 10.10.10.1]<==>[Firewall 10.10.10.2]<==>[Router 10.10.10.254]
>
> If the router is setup as the default gateway for NodeA then wouldn't it be
> sending packets with a source address on the 10.10.10.0 network through the
> external interface of the bridge.

No, I don't think so.

I assume three things here (please let me know if I'm wrong):

1. The router IS performing source nat on outbound packets (so that packets 
which end up on the Internet have a public routable source address rather 
than something within 10.10.10.0/24).

2. The router is NOT performing source nat on inbound packets coming from the 
Internet (so that packets arriving on your local network have the correct 
source address of the machine they came from, out in the Big Wide World).

3. You have no great interest in talking to your router from local network 
machines - they want to talk to the Rest Of The World, which is on the other 
side of the router.

Now, if all the above assumptions are true, then valid packets arriving at 
your network through the router from the Internet will have the source 
addresses of the machines they came from, not the internal address of the 
router.

If, for some rather obscure reason, your router is performing source nat on 
incoming packets, then yes, they will have 10.10.10.254 as their source 
address, but I really can't think why this would be the case.

Regards,

Antony.

-- 
One good tern deserves another.
                                                     Please reply to the list;
                                                           please don't CC me.


