From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Packet filtering and SNAT
Date: Mon, 6 Feb 2006 14:28:00 +0100 (CET)
Message-ID: <54160.193.173.147.3.1139232480.squirrel@webmail.sterenborg.info>
References: <Pine.LNX.4.44L0.0602021542310.5016-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44L0.0602021542310.5016-100000@iolanthe.rowland.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, February 2, 2006 21:52, Alan Stern wrote:
> Apologies if this question has been asked many times before.
>
> I want to set up SNAT on my firewall, and I want to block incoming
> packets that have destination addresses that actually exist on the
> LAN.  That is, I want to accept incoming packets only if they are
> part of an SNAT connection, not if they are addressed directly to
> one of the local computers.

If you're going to use NAT, I suppose your clients have private IP
addresses, otherwise you wouldn't need NAT. In that case, unless you
setup specific DNAT rules, internet clients cannot reach your private
IP addresses.
You seem to want SNAT with statefull packet filtering.

> Adding a rule to the FORWARD chain in the filter table won't work,

Unless I'm not understanding your problem ; yes it will.

> because at that point the destination address has already been
> converted to the destination computer's actual address (hence there's
> no way to tell which packets should be dropped).  Would a rule in the
> PREROUTING chain of the mangle table work?  If not, what should I do
> to detect and drop the packets I don't want?

# Drop everything for which we have no rule.
$ipt -P FORWARD DROP

# Allow ESTABLISHED or RELATED packets in a connection.
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow outgoing NEW packets coming from your LAN, going to the INET.
# The rest (both outgoing and incoming) are ESTABLISHED or RELATED.
$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -j ACCEPT

# SNAT outgoing packets from your LAN
$ipt -t nat -A POSTROUTING -o <if_inet> -s <net_lan> \
  -j SNAT --to <ip_local_inet>


Gr,
Rob



