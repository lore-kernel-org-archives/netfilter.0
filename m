From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [solved] Re: Iptables / KAME IPSec problem: source port information lost
Date: Sun, 14 Mar 2004 09:13:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403140913.12430.Antony@Soft-Solutions.co.uk>
References: <404DB826.3000709@blinkenlichten.de> <200403132235.54603.Antony@Soft-Solutions.co.uk> <4053AD8A.8070607@blinkenlichten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4053AD8A.8070607@blinkenlichten.de>
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

On Sunday 14 March 2004 12:55 am, Carsten Maass wrote:

> Antony Stone wrote:
> > On Saturday 13 March 2004 10:16 pm, Carsten Maass wrote:
> > >
> > > $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
> > > $INET_IP
> > >
> > > It seems to do some kind of NATing to all traffic leaving the gateway.
> >
> > Er, why shouldn't it do this?   The rule says "for any packet leaving
> > $INET_IFACE, change the Source Address so that it is $INET_IP".
>
> Not all traffic should be SNATed, only traffic leaving via $INET_IFACE.
> Traffic leaving via $LAN_IFACE should not be altered, which the above
> rule nevertheless did.

Oh, sorry - when you said "leaving the gateway", I kind of assumed you meant 
"going to the outside world" - my mistake.

> > So the new rule will not SNAT anything which already has a source address
> > other than 192.168.3.0/24 (such as, for example, $INET_IP).   It seems to
> > me that this is probably necessary because of the way your IPsec packets
> > are now going twice through the same interface (in the old 2.4 FreeS/WAN
> > implementation, they would go once through eth0, and once through ipsec0,
> > but I believe this is no longer the case?)
>
> Yes, they are going twice through $INET_IFACE, but the alteration occurs
> when leaving through $LAN_IFACE, which should not be matched as
> SNAT-target by the original rule. And in fact occurs no full SNAT but a
> change of the source port.

I wonder if this is a problem the reverse-nat code is having, trying to keep 
track of packets which are going through the same interface twice?   When a 
packet gets natted, netfilter keeps a record of the original IP+port and the 
substituted IP+port, so that when a reply packet comes back the reverse 
operation can be automagically applied.   The code does not change the port 
number unless something is already bound to that port on the natting machine, 
in which case the port number will be changed.

I wonder if the first time the packet goes through, the IP is changed but not 
the port number, however the second time, there's already an entry in the nat 
table, so the port number does get changed, and then when the response is 
seen, the code incorrectly applies the reverse nat to the IP+port 
combination?

Just a theory, but maybe it'll point somebody in a helpful direction when 
investigating this further?   (Maybe even me, when I get round to dealing 
with 2.6 and inbuilt IPsec....)

> Maybe at least we both agree that the above behavior is not *intended*
> by the applied rule? :)

Yes :)

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


