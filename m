From: Lars Brinkhoff <lars.spam@nocrew.org>
Subject: Re: Translating between local and global IP address
Date: 22 Jan 2003 17:45:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <853cnlb0bf.fsf@junk.nocrew.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Sender: lars.spam@junk.nocrew.org
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> >                     internet
> >                        |
> >                       eth0
> >                   GATEWAY (Linux)
> >                       eth1
> >                        |
> >                  COMPUTER (Windows)
> > 
> > COMPUTER has a local IP address ($IN), but I'd like to mangle
> > packets going through GATEWAY so COMPUTER appears to have another
> > IP address ($OUT) on the internet.

Let me add to this that the internet IP of the gateway is not $OUT,
and connections initiated from a machine on the internet (to $OUT)
should reach COMPUTER.

> You should probably do this :
> 
> # Close your gateway.
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> 
> # Accept forwarding and related.
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -s $IN -j ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -s $IN -j SNAT --to-source $OUT

Thank you.

> And maybe you need a helper for your network game. You didn't mention
> "the name of the game".

The game is Age of Mythology.

> I don't know what you are trying to achieve with "ifconfig eth0:1
> $OUT" ?

I want packets originating from internet to $OUT to be accepted by the
gateway and redirected to $IN.  Without the ifconfig, the gateway
appears to accept only packets to itself.

> When SNAT-ing, the packets will appear to be coming from eth0 on the
> gateway with IP address $OUT which is your internet IP address. $OUT
> must be your internet IP address otherwise the reply packet will not
> be sent back to you.

I want the gateway to have an IP address of its own, distinct from
$OUT.

