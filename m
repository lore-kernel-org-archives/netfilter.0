From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: mac match and FORWARD chain
Date: Mon, 23 Oct 2006 18:59:00 -0400
Message-ID: <20061023225900.GB2441@animx.eu.org>
References: <20061023162435.GA2441@animx.eu.org>
	<00f901c6f6da$45b04080$c84f949b@nasw.ds.army.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00f901c6f6da$45b04080$c84f949b@nasw.ds.army.mil>
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
To: "Michael P. Brininstool" <mikepb@hoplite.org>
Cc: netfilter@lists.netfilter.org

Michael P. Brininstool wrote:
>  I think you are doing this the hard way.  This is what I do and it works
> just fine
> (MAC's altered, I control eth[0134] via physical access security i.e. locked
> room):
> 
> ===============================================
> -A FORWARD -i eth2 -j macchk
> ...
> ===============================================
> -A macchk -m mac --mac-source 00:xx:xx:xx:8F:FD -j RETURN
> ...
> -A macchk -m mac --mac-source 00:xx:xx:xx:8C:B6 -j RETURN
> -A macchk -j logmac
> ===============================================
> -A logmac -j LOG --log-prefix "PACKET_FROM_MAC_DROPPED "
> -A logmac -j DROP
> ===============================================
> 
> Remove first line of FORWARD (shown above) to remove the restrictions.
> 
> I have a program generate macchk whenever the database of allowed machines
> changes.  It does this by removing the reference to macchk in the forward
> change, flushing the macchk chain, rebuilding it (with the logmac reference
> on the end, and it re-inserts the reference to macchk at beginning of
> FORWARD.

I tried something almost exactly the same, except it was in the filter
table.  it simply did not work and the MAC source that was actually tested
was that of the outgoing interface (verified when I added a rule testing the
mac of the outgoing interface).  I want it blocked at both incoming to the
local machine and being routed depending on what is used.  There is no
locked room per se.

In the filter table:
I first test the incoming interface in both FORWARD and INPUT, if it's eth1,
jump to the mac testing chain.  In that chain, if the mac is an allowed one,
jump to the ip testing chain, if that packet is allowed, accept.  the next
line of FORWARD and INPUT is a jump to DROP (testing for eth1 again).

That is exactly what I want.  Your example is more permissive than mine. 
Instead of using filter/INPUT and filter/FORWARD, either nat/PREROUTING or
mangle/PREROUTING with the same rules should handle what I want w/o testing
in both INPUT and FORWARD since at the PREROUTING stage, it has not
determined where the packet will be going.  I just do not know if
nat/PREROUTING is traversed every time a packet comes in, or if it only is
traversed on the initial packet of a connection (Probably doesn't matter
though)

