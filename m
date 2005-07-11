From: Jason Opperisano <opie@817west.com>
Subject: Re: MAC SOURCE
Date: Mon, 11 Jul 2005 14:35:32 -0400
Message-ID: <20050711183532.GA17128@bender.817west.com>
References: <20050711150544.GA16345@bender.817west.com>
	<BAY5-F447A92ED4CA9D33340400BADC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY5-F447A92ED4CA9D33340400BADC0@phx.gbl>
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

On Mon, Jul 11, 2005 at 08:28:07PM +0500, azeem ahmad wrote:
> thanx a lot
> can u explain this rule set in some details

sure:

  # create a new user-defined chain called "check_mac" in the filter
  # table
  iptables -N check_mac

  # append a rule to the "check_mac" chain that returns packets from
  # $MAC1 to the calling chain (where we jumped from)
  iptables -A check_mac -m mac --mac-source $MAC1 -j RETURN

  # append a rule to the "check_mac" chain that returns packets from
  # $MAC2 to the calling chain (where we jumped from)
  iptables -A check_mac -m mac --mac-source $MAC2 -j RETURN

  # a commented-out rule the would log all other packets that are about
  # to get DROP-ed by the rule that comes afterwards
  # iptables -A check_mac -j LOG --log-prefix "INVALID MAC: "

  # drop any packet that makes it to this rule
  iptables -A check_mac -j DROP

  # jump to the check_mac chain from the INPUT chain.  packets that hit
  # the RETURN target in check_mac will come back to INPUT to traverse
  # the remaining rules in INPUT
  iptables -A INPUT -j check_mac

  # jump to the check_mac chain from the FORWARD chain.  packets that hit
  # the RETURN target in check_mac will come back to FORWARD to traverse
  # the remaining rules in FORWARD
  iptables -A FORWARD -j check_mac

-j

--
"Meg: Guess what I am.
 Stewie: Hmm, let me see. The end result of a drunken backseat grope-fest
 and a damaged prophylactic?"
        --Family Guy

