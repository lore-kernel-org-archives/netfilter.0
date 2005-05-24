From: Jason Opperisano <opie@817west.com>
Subject: Re: Help needed with Connection tracking!!!
Date: Tue, 24 May 2005 17:32:37 -0400
Message-ID: <20050524213237.GA14107@bender.817west.com>
References: <4293543d.58d9493d.63ba.000cSMTPIN_ADDED@mx.gmail.com>
	<9927912d0505240927492673cb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d0505240927492673cb@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Tue, May 24, 2005 at 08:27:42PM +0400, Visham Ramsurrun wrote:
> Hi to all,
> 
> I badly need some help with this one..
> 
> I wanted to know what happens when a stateful firewall receives a SYN
> packet from client A and the next packet received by the firewall is
> not the SYN/ACK packet from server B but rather the first data packet
> for the same connection from server B.

it should be marked as INVALID.

> Let's assume that the SYN/ACK,
> the ACK and the first data request packet arrived  to their respective
> destinations through some other route. Is the connection considered as
> ESTABLISHED at that point on the firewall, which has seen traffic in
> both directions?

ESTABLISHED does not mean "i have seen traffic in both directions." it
means "i have seen packets in the proper directions that transition from
the NONE to ESTABLISHED state."  the states according to
ip_conntrack_proto_tcp.c:

   NONE:        initial state
   SYN_SENT:    SYN-only packet seen 
   SYN_RECV:    SYN-ACK packet seen
   ESTABLISHED: ACK packet seen

> If the answer to the above is no, would the connection be considered
> as ESTABLISHED if the default behaviour of ip_conntrack was used?

what on earth do you mean by this statement?

> Any input will be very much appreciated..

pretend you're on a 2.2 linux kernel with ipchains and write stateless
rules.  ip_conntrack is there to protect you.  those that are bothered by
its protection deserve neither its protection, nor its convenience.

-j

--
"Stewie: It rubs the lotion on its skin or else it gets the hose again."
        --Family Guy

