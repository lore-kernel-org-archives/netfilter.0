From: Jason Opperisano <opie@817west.com>
Subject: Re: Cisco VPN Client + Cisco 800 + Firewall
Date: Wed, 27 Oct 2004 16:15:04 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041027201504.GA1315@bender.817west.com>
References: <1098385275.7ic0vxrrb5hc@mail.sapo.pt>
	<20041021192949.GA11650@bender.817west.com>
	<1098876234.mw0x4ye44eo@mail.sapo.pt>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1098876234.mw0x4ye44eo@mail.sapo.pt>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 27, 2004 at 12:23:54PM +0100, shore@sapo.pt wrote:
> 
> 
> Anyone ??
> 

not to over-simplify things, but where in your firewall rules do you
allow the VPN pool IP's (the 10.0.0.0/8) into your internal network?

also--while your script may be readable to you, it may be
incomprehensible to others--the preferred method of posting your rules
to this list is with the output of:

  iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

the other possible break in the chain is this:  does the cisco 800 have
a static route on it along the lines of:

  192.168.0.0/24 via 192.168.10.1

or are you relying on NAT to eliminate the need for routing?

you may also want to clue us in to what you testing methodology is (i.e.
what are you trying to connect to with the VPN client).

-j

-- 
Jason Opperisano <opie@817west.com>

