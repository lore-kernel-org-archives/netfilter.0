From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables newbie questions
Date: Fri, 16 Apr 2004 07:49:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082116163.27914.25.camel@localhost>
References: <407F9DA0.80008@bsdmon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407F9DA0.80008@bsdmon.com>
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
To: matthieu <matthieu@bsdmon.com>
Cc: netfilter@lists.netfilter.org

I have never looked at the netfilter/iptables code and I have not read
everything there is to read on the subject but I'll share how I
understand it.  If someone sees an error in what I write, please correct
it.

On Fri, 2004-04-16 at 04:47, matthieu wrote:
> hi
> i have three questions about iptables:
> 
> 1/
> 
> i read the packet-filtering howto (http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO.html)
> the first example uses the ip_conntrack module, which allows the state match rule, as in the following rules :
> 
> iptables -A block -m state --state NEW -j REJECT
> 
> on the other hand, my red hat 9 was automatically configured by lokkit with something that looks similar but without using ip_conntrack:
> 
> iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
> 
> what are the exact differences between these two ways of doing the same thing ? (Is it related to the way fragments are handled ?)
> 
> 2/
> 
> about fragments (see http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html)
I have never used lokkit so I do not know how it works.  It looks
suspiciously like a packet filter by virtue of the rule blocking
initiating SYN packets.  That would be unnecessary with connection
tracking.
However, I initially thought that one had to specify the -m state
--state NEW for a data flow to be entered into the conntrack table. 
Apparently, that is not true.  Whether or not one uses the NEW match, if
connection tracking is loaded, any allowed initiating packet makes an
entry in conntrack.
When it comes to using it as you are, to reject or drop, I believe the
parameters are a little more encompassing than the lokkit rule, e.g.,
udp packets or tcp probe packets that may use flags other than SYN for
the first packet.  From the man page:

Possible states are INVALID meaning that the packet is associated with
no known connection, ESTABLISHED meaning that the  packet is associated
with a connection which has seen packets in both directions, NEW meaning
that the packet has  started a  new  connection,  or  otherwise 
associated with a connection which has not seen packets in both
directions, and RELATED meaning that the packet is starting a new
connection, but is associated with an existing connection, such as an
FTP data transfer, or an ICMP error.

This leaves me with the question for DROP or REJECT rules if there is
any difference or advantage is using INVALID over NEW.
> 
> in the paragraph "specifying fragments", it says:
> "If you are doing connection tracking or NAT, then all fragments will
> get merged back together before they reach the packet filtering code,
> so you need never worry about fragments."
> 
> but 5 lines below, it also says that we can only filter the first
> fragment, because further fragments don't have their tcp header.
> 
> so, are fragments merged or not ? Does it mean that by default,
> fragments are not merged but that as soon as we use nat or
> ip_conntrack they are merged ? This is what i understand but i just
> want a confirmation..
> 
> 3/
I believe your understanding is correct.  If each fragment is examined
on its own, it contains insufficient information for filtering.  Thus
they make excellent penetration tools for packet filter firewalls. 
However, connection tracking allows us to associate them with the other
parts of the packet so we can make a valid decision about access.
> 
> i'm new to linux so this one may seem trivial, but let's ask it:
> how are netfilter routing and other kernel routing related ?
> i mean:
> there is a /sbin/route command that lists a routing table, and we can
> also modify this table.
> but there is also some routing in iptables, as far as i understand.
> also, browsing through some howtos i saw mentions of a iproute2
> command
I am not experienced in using any patches that provide routing or in
using the matches and targets that interact with iproute2.  iproute2 is
the very powerful successor to route.  It enables features such as
policy routing, routing on source and QoS and handles more than just
routing, e.g., ip addressing and layer 2 parameters.  If you are just
learning Linux routing, do spend the time to become acquainted with
iproute2.  The command is ip, not iproute2, e.g., ip route add
10.1.1.0/24 via 192.168.3.5.  The documentation is quite well hidden.  I
believe you will find it in RedHat under
/usr/share/doc/iproute-2.4.7/ip-cref.ps
> All of this is very confusing to me, so what is the architecture of
> all this ? i already read "The journey of a packet through the linux
> 2.4 network stack" by harald welte but it did not help clarifying the
> overall scheme
In a quick nutshell, the packets will traverse the PREROUTING (or OUTPUT
in the case of a locally generated packet) chains of the mangle and nat
tables before a routing decision is made.  A routing decision is then
made and the packet is sent to the filter table where it will hit the
INPUT, OUTPUT or FORWARD chains as appropriate.  It is then passed back
to the POSTROUTING chains of the nat and mangle tables.  There are some
more complete diagrams and explanations in the training section of
http://iscs.sourceforge.net

> 
> thanks in advance
> 
It's a great product.  Good luck - John
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


