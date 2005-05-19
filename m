From: Jason Opperisano <opie@817west.com>
Subject: Re: Prevent traceroutes
Date: Thu, 19 May 2005 19:23:14 -0400
Message-ID: <20050519232314.GA9369@bender.817west.com>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <fad9d484050519150730dbc53d@mail.gmail.com>
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

On Fri, May 20, 2005 at 12:07:11AM +0200, Kenneth Kalmer wrote:
> Guys
> 
> How can I prevent users from doing a traceroute through my box using
> iptables? Better still, how can I route a traceroute through a
> different network than the default one?

this is not 100% infallible; as anyone running the traceroute can change
the defaults, but you need to block both the UDP method of tracerouting
and the ICMP method of tracerouting:

  # standard UDP ports used by traceroute
  iptables -A INPUT -p udp --dport 33434:33523 -j DROP
  iptables -A FORWARD -p udp --dport 33434:33523 -j DROP

  # ICMP echo-req's w/ low TTL
  iptables -A INPUT -p icmp --icmp-type 8 -m ttl --ttl-lt 5 -j DROP
  iptables -A FORWARD -p icmp --icmp-type 8 -m ttl --ttl-lt 5 -j DROP

the choice of 5 as the min TTL to match on is purely arbitrary...you may
be able to choose a better value for your specific topology.

-j

--
"Brian: Congratulations, Peter. You're the Spalding Gray of crap."
        --Family Guy

