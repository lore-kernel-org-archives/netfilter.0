From: Yermo Lamers <yml@dtlink.com>
Subject: Using iptables on a single NIC to map old IP addresses onto new.
Date: Fri, 20 Jan 2006 14:02:00 -0500
Message-ID: <43D133A8.4010801@dtlink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

On Fri, 20 Jan 2006, Yermo Lamers wrote:

 >> That was my first thought. I bound a.a.a.2 and b.b.b.2 to the same > 
box.
 >> I obviously have two pipes. If I set the default route on the box to the
 >> a.a.a.1 router I can ping a.a.a.2 from the outside but not b.b.b.2. If I
 >> switch to the b.b.b.1 router the opposite happens.

 >> I would have expected packets to come down either pipe and go out
 >> whichever one happens to be the default gateway.
 >
 >It could be that both your ISPs are using source address spoofing
 >filters (as they should, of course). That is, the router a.a.a.1
 >will only accept traffic with source address a.a.a.2 and the rest
 >(including ping replies from b.b.b.2) get dropped.

Yea, that's what I think is going on. I was checking the iproute2 site 
to see if I could come up with something fancy but the kernel on this 
box doesn't have the advanced routing enabled.

So the question is can I set up a box on the network, bind IP addresses 
to it and then forward those connections onto another box for both TCP 
and UDP akin to the way rinetd works?

i.e.

a.a.a.1 port 80 gets forwarded to b.b.b.1 80
a.a.a.2 port 80 gets forwarded to b.b.b.2 80

So I'm fowarding packets despite the fact that I'm not using a "router" 
per se. I want to forward packets for connections to the local box like 
rinetd does.

Can that be done using iptables or is there another approach to this 
problem? (Like rewriting the from address depending on which pipe the 
packet came from)

-- Yermo

Sorry about breaking the replies. I'm using the archive to reply to 
these and the link isn't keeping the thread info for some reason.


-- 
---------------------------------------------------------------------
DTLink Software                                 http://www.dtlink.com
              Internet Business Systems and Software
---------------------------------------------------------------------

