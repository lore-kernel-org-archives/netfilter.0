From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connect to localhost bound port from outside?
Date: Wed, 31 Jan 2007 12:31:11 -0600
Message-ID: <45C0E06F.3080405@riverviewtech.net>
References: <eppgne$mc1$1@sea.gmane.org>
	<45C06BE7.2080208@plouf.fr.eu.org>	<45C0B772.2090201@riverviewtech.net>
	<45C0BDDE.2030905@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C0BDDE.2030905@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Pascal Hambourg wrote:
> Yes. This is not a reverse path issue, as rp_filter=1 checks only the 
> source address, not the destination address.

Ah.

> AFAIK, it is hard coded. I guess the reason is that RFC 3330 reserves 
> 127.0.0./8 for the loopback and prohibits its use on any network outside 
> the host. Unfortunately, the routing code does not know that the packet 
> was DNATed and has an original non-loopback destination address.

*nod*

> I do not see how a dummy interface might be useful here. Can you please 
> clarify ?

(See below)

>> I have often considered using lo for local only but using dummy as a 
>> spur network to bind services to and then route traffic in to the spur 
>> network.  Thoughts / Opinions?
> 
> A dummy interface is a black hole, a kind of "/dev/null" interface, 
> traffic you route to it is lost. This is very different from a loopback 
> interface, whose traffic you route to it loops back and is received by 
> the local host. It is fine to use a dummy interface if you want to add 
> an extra address to the host and bind services to it, but I guess you 
> could do the same with the loopback interface.

I beg to differ.  Loop back is ONLY for the local host.  However, Dummy 
is not only for local host.  Dummy is *usually* used for local host 
only, however this is not an kernel enforced limitation.  Dummy network 
is akin to a network card that does not talk to any thing else.  I.e. if 
I put a loop back plug in an ethernet card so that it sees its self UP 
and UP (Cisco terms).  Then I can configure any computer to access the 
dummy network VIA the computer that dummy is on.

To verify this, I just brought my dummy net up with a 192.0.2.254 IP 
address.  I then went to my Windows VM session and added a route to the 
192.0.2.x/24 network via my Linux host.  My Windows VM was able to ping 
the 192.0.2.254 IP address on the dummy network.

With this in mind, if the dummy network is used to bind services to, it 
would be possible to DNAT traffic destined to the local system in to the 
dummy network with out being stopped the way that loop back does.

Now, what I'm not sure about is if it would be possible to not use lo 
but use dummy in place of it.  I.e. lo is down and down with dummy up 
and up with 127.0.0.1 on it.  In this case I don't know if you could 
DNAT traffic in to 127.0.0.1 from external or not.  And as I write this, 
I think that this may be more of a problem with routing than interface. 
  If it is the routing code that says the only thing that can speak to 
127.x.y.z/24 is 127.x.y.z/24 then this will do no good.

One thing that I do see as an advantage of using dummy in this way is 
that it would be possible to bind services to the dummy IP which would 
cause traffic destined for public services to pass through the 
filter:FORWARD table / chain.  So, you could possibly have a different 
management IP / interface (pair) than public service IP / interface 
(pair) on the system.  You could also have all management access pass 
through the filter:INPUT and public service pass through filter:FORWARD. 
  Or, if you are worried about the overhead of forwarding traffic to get 
to your public services, you could reverse things and put public on the 
main IP / interface and management on the dummy IP / interface.  Thus 
segregating which traffic is filtered where.

I don't know if there is an benefit / harm in doing things either way, 
it's just an idea that I had.

One use that I do see for such a dummy network would be in a lab type 
environment where some sort of routing protocol is running on each 
system, students could create / destroy networks on dummy as they wanted 
to (so long as they did not conflict) with a benefit of each system in 
the lab being able to route to each and every dummy network for testing 
/ learning type of exercises.



Grant. . . .

