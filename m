From: Jason Opperisano <opie@817west.com>
Subject: Re: Resend: MASQUERADE: Route sent us somewhere else.
Date: Tue, 5 Apr 2005 10:50:28 -0400
Message-ID: <20050405145028.GA2620@bender.817west.com>
References: <200504051035.j35AZn2H025714@osprey.tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200504051035.j35AZn2H025714@osprey.tkevans.com>
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

On Tue, Apr 05, 2005 at 06:35:49AM -0400, Tim Evans wrote:
> Thanks for your reply.
> 
> >the error message you refer to in your subject is normally encountered
> >when using MASQUERADE in conjunction with policy routing, which normally
> >implies multiple ISP connections.
> 
> Just one connection.
> 
> >i cannot find information referencing any of the above in the details of
> >your post; which could be a possible explanation for the silence.
> 
> Might it be some sort of conflict between my immediate ISP (Comcast) assigning a 
> my firewall a domain name via DHCP and my using my "real" domain name on the 
> inside?  Again, however, this problem didn't happen with RHEL 3.

the error message implies a routing problem--the domain name of the
router is not a factor in the routing decision normally.

the gist of that error message is this:  the output interface for this
packet according to the routing table is different from the interface we
are doing a lookup on for the MASQ IP.  i cannot fathom how you could
get this message with a standard inside/outside interfaces, single
default gateway, firewall machine.

without seeing some rules[1], some routing tables[2], and some addressing
info[3], i'm pretty sure no one is going to be able to divine what the
problem is.

the reason you're seeing this after an upgrade is because this bug reared
it's head somewhere around 2.4.23 and later kernels (someone else probably
has a better memory than me).

-j

[1] iptables -t mangle -vnxL; iptables -t nat -vnxL; iptables -vnxL
[2] ip ro sh
[3] ip -4 -o addr sh

--
"Peter, you're bribing your daughter with a car? 
 Ah, c'mon, Lois, isn't 'bribe' just another word for 'love?'"
	--Family Guy

