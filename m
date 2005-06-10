From: Jason Opperisano <opie@817west.com>
Subject: Re: Routing and DNAT redux
Date: Fri, 10 Jun 2005 13:55:54 -0400
Message-ID: <20050610175554.GA6127@bender.817west.com>
References: <200506081754.50537.jsimmons@goblin.punk.net>
	<f68a41605060909226f26a9ba@mail.gmail.com>
	<200506091000.21220.jsimmons@goblin.punk.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200506091000.21220.jsimmons@goblin.punk.net>
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

On Thu, Jun 09, 2005 at 10:00:21AM -0700, Jeff Simmons wrote:
> The actual challenge is to have two external interfaces, IF_1 and IF_2, each 
> with their own address and both DNATed to an internal server. Packets coming 
> into IF_1 should have their replies routed out IF_1 while packets coming in 
> on IF_2 should have their replies routed out IF_2.
> 
> The ONLY place this information (which interface a particular packet stream 
> came in on) is available is in the NAT state table. Pre NAT, all routing has 
> to go on is the source server destination remote.  Post NAT routing now sees 
> source IF_ (1 or 2) destination remote, and the packet can now be properly 
> routed out the correct interface.
> 
> Which is why it's important whether NAT takes place pre or post routing on the 
> reply packets from a DNATed destination.

the way i attack this problem (ensuring a DNAT-ed connection gets routed
back out the same link it came in on) is with CONNMARK:

  iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
  iptables -t mangle -A PREROUTING -i $EXT_IF_A -d $PUB_IP_A \
    -m mark --mark 0 -j MARK --set-mark 1
  iptables -t mangle -A PREROUTING -i $EXT_IF_B -d $PUB_IP_B \
    -m mark --mark 0 -j MARK --set-mark 2
  iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

  iptables -t nat -A PREROUTING -i $EXT_IF_A -d $PUB_IP_A \
    -j DNAT --to-destination $PRIV_SRV
  iptables -t nat -A PREROUTING -i $EXT_IF_B -d $PUB_IP_B \
    -j DNAT --to-destination $PRIV_SRV

  ip route add default via $ISP_A_GW dev $EXT_IF_A table ISPA
  ip route add default via $ISP_B_GW dev $EXT_IF_B table ISPB

  ip rule add fwmark 1 table ISPA
  ip rule add fwmark 2 table ISPB

this isn't 100% step-by-step, but should give you the foundation.
i have posted truly step-by-step examples of this in the past--search
the archives.

hope this gets you on the right track.

-j

--
"Lois: I'm sorry that Stewie ruined your books. Here, I brought
 you some of Peter's. 
 Brian: "Mr. T" by Mr. T. "T and Me" by George Poppard. "For The Last
 Time, I'm Not Mr. T" by Ving Rhames."
        --Family Guy

