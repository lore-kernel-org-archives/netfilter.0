From: Raido Kurel <raido@elin.ttu.ee>
Subject: dnat problem in transparent firewall
Date: Wed, 4 Aug 2004 10:10:32 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408041010.32442.raido@elin.ttu.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Sorry, about not beeing in the thread. I just subscribed and can see message 
just in archive...

> > Needs:
> > To change destination IP of some packets coming from Internet. ie to
> > change destination IP from aaa.aaa.aaa.12 to aaa.aaa.aaa.13
...
> > iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest
> > aaa.aaa.aaa.13
>
> Do you have a FORWARD rule allowing packets through to aaa.aaa.aaa.13 after 
> they've been NATted?

Yes.
Also packets from Internet to aaa.aaa.aaa.13 reach destination.
I am more worried about fact, that 
-t nat -A PREROUTING -j DNAT ...
and then 
-t nat -A PREROUTING -j LOG ...
does not log anything. Without the first rule logging works. 
I thought, that -j DNAT should pass packet for next nat PREROUTING rule for 
logging. According to http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png 
packet should next go to ebtables filter table input or forward chains, but 
nothing reaches there in case of the iptables -t nat -A PREROUTING -j DNAT 
rule.

Raido



