From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Forcing source port with NAT
Date: Tue, 24 Jun 2003 11:37:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624153708.GD32226@cannon.eng.us.uu.net>
References: <20030623195459.GA28900@jdwhite.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030623195459.GA28900@jdwhite.org>
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

On Mon, Jun 23, 2003 at 02:54:59PM -0500, Jason White wrote:

> Greetings,
>   I have an application, Zephyr Messaging Service, which uses a client
> application that sends out UDP packets on port 2104.  The Zephyr server
> will refuse packets from the client if the source address is not 2104.
> I want to run this application behind a NAT on one given machine.  I
> need a way to ensure that packets from this one machine with a source
> address of 2104 go through the NAT that they emerge on port 2104 of the
> external ip address.  To diagram a packet:
> 
> [Intenal machine-10.0.0.2:2104] --> [NAT internal: 10.0.0.1] -->
>   [NAT external: 200.200.200.200: 2104] --> ///internet/// ...
> 
> Basically, I need to ensure that anything coming in on 200.200.200.200:2104
> goes to 10.0.0.2:2104 and anything going out from 10.0.0.2:2104 goes out
> 200.200.200.200:2104.
> 
> I know how to map the external to internal, but internal to external
> isn't immediately obvious

For incoming:

iptables -t nat -A PREROUTING -i <ext-int> -p udp \
         --dport 2104 --sport 2104 \
         -s <external-Zephyr> -d 200.200.200.200  \
         -j DNAT 10.0.0.2:2104

For outgoing:

iptables -t nat -A POSTROUTING -o <ext-int> -p udp \
         --dport 2104 --sport 2104 \
         -s 10.0.0.2 -d <external-Zephyr>  \
         -j SNAT 200.200.200.200:2104

There is one small (or maybe not very small) point to note: Since this
setup has a symertic sport-dport for both incoming and outgoing initiations,
if the timeout of this conntrack has not been expired for a given conntrack,
the other direction of the packet flow (within the timeout window) would be
folded into the existing conntrack, which should be harmless, IMHO.

Ramin

