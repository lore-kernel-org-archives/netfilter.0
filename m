From: Jason Opperisano <opie@817west.com>
Subject: Re: 2 NICs on same subnet
Date: Fri, 05 Nov 2004 09:12:16 -0500
Message-ID: <1099663936.3229.7.camel@hubcap.ljm.dom>
References: <20041105123843.GB11016@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041105123843.GB11016@zion.homelinux.com>
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

On Fri, 2004-11-05 at 07:38, Sven Schuster wrote:
> Hi everybody,
> 
> I have a problem which I'm quite sure can be resolved easily,

wrong.

>  but
> at the moment I'm lacking the "how" :-)
> I have a machine (RH ES 3) with two Intel e1000 cards attached to
> a gigabit switch, each interface is assigned an IP address on the
> same subnet (say 1.2.3.4 on eth0 and 1.2.3.5 on eth1).

no. no. no. no.

> What's happening is that if a connection to either of these addresses
> is made, it's always received via the same interface (eth1 most of the
> time), and the replies go out via this interface, too. But what I'd
> like is that packets to 1.2.3.4 come in via eth0 and packets to 1.2.3.5
> come in via eth1 and that replies from 1.2.3.4 leave via eth0, from
> 1.2.3.5 via eth1.
> I've already tried to resolve this issue with arptables, doing
> 
> arptables -N eth0
> arptables -A eth0 -d 1.2.3.4 -j ACCEPT
> arptables -A eth0 -j DROP
> arptables -N eth1
> arptables -A eth1 -d 1.2.3.5 -j ACCEPT
> arptables -A eth1 -j DROP
> arptables -A IN -i eth0 -j eth0
> arptables -A IN -i eth1 -j eth1
> 
> and additionally limiting traffic in the same way by iptables, but
> that doesn't work unfortunately.
> Has anybody done this?? Is a solution to this problem known??

yeah--don't assign two interface on the same box IP's in the same
subnet.

that being said--i've seen this done successfully *once*.  the
"solution" was that every host in the network had to run OSPF.  it was
the only way to get packets to go in and out the same interface for each
IP.

saying "it _has to be_ this way, not my decision" is a cop out.  it will
result in answers like:

well, it can't be done, so too bad.
-or-
if it's not your decision, the it shouldn't be your problem.

-j 

--
"When I grow up, I'm going to Bovine University!"
	--The Simpsons


