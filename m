From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Help with iptables script
Date: Wed, 15 Dec 2004 19:21:46 +0100
Message-ID: <20041215182131.A6E1C2F474@kshira.sterenborg.info>
References: <6.1.2.0.0.20041215090840.025e0ec0@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041215090840.025e0ec0@corpmail.courtesymortgage.com>
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

netfilter-bounces@lists.netfilter.org wrote:
...
>>> #Simple NAT setup
>>> 
>>> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
>>> $INET_IP 
> 
> This should be correct for my NAT setup on my private LAN correct?
> Think so, just want to double check.

It should do, however you could add the network of your LAN to the rule
so you'll be sure that only IP's from your LAN will be SNAT-ed :

$IPTABLES -t nat -A POSTROUTING -s $LAN_IP -o $INET_IFACE \
  -j SNAT --to-source $INET_IP

And further restrict the FORWARD chain (using -s in both chains should
be unnessecary ; look at it as a double guard :o) ):

$IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -s $IP_LAN \
  -j ACCEPT

(Right now you have "$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT".)

>>> # INPUT chain
>>> 
>>> $IPTABLES -A INPUT -p tcp -j bad_tcp_packets
>> Since you're not accepting any packets on the INPUT chain, you don't
>> need to filter bad packets unless you want to log them.  Are you sure
>> you don't want to accept RELATED,ESTABLISHED traffic on your INPUT
>> chain?
> 
> Hmm. Good point. Just to make sure I follow, even though I am not
> accepting any packets on the input chain, traffic from the private
> LAN still should traverse through the firewall and back correct?

No. LAN traffic routed to the internet (and vv) goes through the FORWARD
chain, not the INPUT or OUTPUT chain.
You'd accept RELATED,ESTABLISHED packets in your INPUT chain if you have
ACCEPT rules in the OUTPUT chain in which case the firewall itself is
able to send traffic : you have to accept the return packets.

> I will be pouring over my book and how-to's today.
> just a quick question. Is there a website, other than the netfiler
> website that has some sample table scripts? I'd like to see just a
> few examples of simple iptable scripts so I can further wrap my head
> around this.

I think you'll like Oskar Andreasson's IPTables Tutorial :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


