From: Les Mikesell <les@futuresource.com>
Subject: Re: network/iptables start order
Date: Mon, 10 Jan 2005 12:45:07 -0600
Message-ID: <1105382707.6691.94.camel@moola.futuresource.com>
References: <BAY101-F3520280EA804079C9229A4DF970@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F3520280EA804079C9229A4DF970@phx.gbl>
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
To: "Curby ." <kirbysdl@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2005-01-10 at 12:19, Curby . wrote:
> In what order should i have /etc/init.d/network and my iptables setup script 
> (henceforth called "iptables") start?

I don't have an answer, but a slight variation of the question:  I've
noticed that if a GRE tunnel from another machine (in this case a
Cisco router) passes through a linux NAT gateway as the interfaces
start up it is impossible to get rid of the NAT effect from the
ip_conntrack entry even when another interface/route comes up
subsequently that is really the correct route for these packets
and it doesn't need NAT.  That is, when the new route is available
the packets are sent there, but they don't work because they continue
to be source-nat'ed  with the default gateway's address and the
conntrack entry never goes away.  Is there a generic way to prevent
this problem, and if not, where would be the best place to insert
a REJECT route to prevent these packets from going out the default
route until the correct interface/route is available (I know the
destination address).

-- 
  Les Mikesell
   les@futuresource.com



