From: Jason Opperisano <opie@817west.com>
Subject: Re: Ip Forwarding
Date: Thu, 28 Oct 2004 14:26:03 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041028182603.GA5067@bender.817west.com>
References: <20041028172521.3B3CB672@mail.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041028172521.3B3CB672@mail.817west.com>
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

On Thu, Oct 28, 2004 at 12:23:50PM -0500, Joe Wright wrote:
> Hi, I'm new to iptables and am trying to set up a firewall for my hosting
> company. We have a block of 128 public ips starting at 207.145.24.128 with a
> mask of 255.255.255.192. I have a redhat 9 box set up with 2 nics. My goal
> is to have it between the router and my network.

is your current configuration that "my network" is 207.145.24.128/26 and
all hosts point to the inside interface of the router as their default
gateway?  and now you want to wedge a firewall between "my network" and
the router?

> It should allow connections
> to port 80 for all ips behind it

  iptables -A FORWARD -i $outsideIF -o $insideIF -p tcp --syn \
    --dport 80 -j ACCEPT

  (assumes you are using connection tracking)

> and I would also like to specify certain
> ports for certain ips for dns, ftp, remote desktop, etc.

mport/multiport is useful for this (i prefer mport, but most distros
ship with multiport):

  iptables -A FORWARD -i $outsideIF -o $insideIF -p tcp --syn \
    -d $server001 -m multiport --dports 21,3389 -j ACCEPT

> I've found tons of
> info on using iptables with nat but not much on just blocking ports for ips
> passing through it. I'm also not quite sure of how to configure the second
> nic that connects to my internal network. Any help would be greatly
> appreciated.

if my description of your scenario above was correct, you have a couple
of options:

(a) get an additional /30 public IP space to use between the outside of
the firewall and the inside of your router

(b) subnet your existing /26 and steal a /30 out of it from the beginning
or end of the range for the network between the firewall and router

(c) use an RFC 1918 network for the network between the firewall and
router

the "best" solution is A, but will cost some extra $$$.  C can cause
problems if certain situations.  B is a nice compromise, basically it
would involve:

  router:
	inside interface:  207.145.24.129/30
	static route:      207.145.24.128/26 via 207.145.24.130

  firewall:
	outside interface:  207.145.24.130/30
	inside interface:   207.145.24.190/26
	default gateway:    207.145.24.129

default gateway of hosts on the 207.145.24.128/26 network:
207.145.24.190

or some variant of the above, depending on how much readdressing you do
or do not want to do.

-j

-- 
Jason Opperisano <opie@817west.com>

