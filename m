From: psihozefir <sorin.panca@gmail.com>
Subject: Re: restricting connections from a single connection to a single
	destination
Date: Fri, 26 Aug 2005 11:21:09 +0300
Message-ID: <fdb0cf3905082601211b085c1c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Grant Taylor wrote:

> P.S.  If you would like help trying to explain
> the VLAN concept let me know as I'm having to
> implement this at one of my clients now.  In fact I may just write a How-=
To
> on it and see about
> submitting it somewhere b/c I think it will be rather interesting
> (read "fun" to those of us who like > challenges) to do.

I have a small LAN with my neighbours and they have access to the
Internet through my router. I once needed to block pc to pc traffic
because the LAN is made of about 10 low cost ethernet switching hubs
on four level tree and they could not manage the connections between
machines. So I had a lot of unuseful traffic in the network. They
started to act like non-switching hubs. The maximum transfer speed
dropped to 2.5 Mbyte/s (that's unacceptable). [ They are 48 neighbours
connected to this LAN. ]

Solution:
Each switch has its own subnet and the router is virtually on all
subnets with the lowest address on that subnet. The router has aliases
for eth1 (10 aliases). Problem: the traffic between subnets goes
through the router. The router has one 100 Mbit/s connection to LAN.
Concurrent connections slow each other, if they are all betweeen
different subnets. The router is unnecesarily loaded.

I had to develop the solution fast, and I know nothing about vlans. I
googled for docs but none I've found was short and step-oriented. I
also looked for solutions that explaind in terms of "for this feature
to work these are the minimum requirements: a), b) and c)". This could
improve troubleshooting in case of something is not working. I just
verify the a), b) and c) conditions to be fulfilled.

I've found sites where the concept was explained, but it was too much
to read and experiment until I could be able to do something useful.
The network should be operational during the tests with short times of
inoperability.

Sorin...
P.S. If you can explain the VLAN concepts and write a How-to I would
very much appreciate your effort. Thank you.

