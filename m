From: Jason Opperisano <opie@817west.com>
Subject: Re: bad tcp packets
Date: Tue, 23 Nov 2004 08:49:46 -0500
Message-ID: <1101217785.12981.10.camel@hubcap.ljm.dom>
References: <web-23112413@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-23112413@infinito.it>
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

On Tue, 2004-11-23 at 07:18, hamals@infinito.it wrote:
> Hello to everyone
> 
> I'm reading "Iptables Tutorial 1.1.19" by Oskar 
> Andreasoon, and I cant understand these bad packets rules
> 
> 
> $IPTABLES -N bad_tcp_packets
> #
> #
> # bad_tcp_packets chain
> #
> $IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK 
> SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset

SYN-ACK packets are step 2 in the TCP Three Way Handshake, and are
always replies to SYN packets (which are step 1).  as a reminder, the
TCP Three Way Handshake is:

client	server
---------------
SYN   ->
     <- SYN-ACK
ACK   ->

also as a reminder, "-m state --state NEW" packets are packets that do
not match an entry in conntrack.

if your are tracking the state of your connections:

"-p tcp -m state --state NEW" packets should only ever be SYN packets
(as they come first)

the above rule sends a TCP RST to any SYN-ACK packet that is NEW; i.e, a
response to a connection request that we never saw.

> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state 
> --state NEW -j LOG \
> --log-prefix "New not syn:"
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state 
> --state NEW -j DROP

this drops and logs NEW packets that are anything besides a SYN packet.

-j

--
"I've figured out an alternative to giving up my beer. Basically,
 we become a family of traveling acrobats!"
	--The Simpsons


