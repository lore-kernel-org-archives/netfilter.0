From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: Denying output to irc servers on std. tcp ports from router and behind  NAT
Date: Mon, 9 Sep 2002 21:45:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJEEBAGLAA.B-Morgan@concentric.net>
References: <3D7C874B.A69024FC@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7C874B.A69024FC@sympatico.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jimmy James <jamesstickland@sympatico.ca>, netfilter@lists.netfilter.org

James,

> I changed the output chain for the filter table on the router by typing
> "iptables -t filter -A OUTPUT -o ppp0 -p tcp --dport 6666:7000 -j DROP"

> Once this entry was made, i could no longer connect to any irc server
> (that runs standard port settings) from my router.

> Using the following rule, "iptables -t nat -A PREROUTING -i eth1 -p tcp
> --dport 6666:7000 -j DROP,"

You need two rules.  One in the OUTPUT chain for your router (you have this
one), and one in the FORWARD chain to drop packets passing through your
router (you were close).

"iptables -t nat -A FORWARD -i eth1 -p tcp --dport 6666:7000 -j DROP"

There is a good diagram in the Netfilter documentation that shows how
packet flow through the firewall.  The INPUT and OUTPUT chains on the
firewall are for packets originating (or terminating) on the firewall.
Packets passing through use the FORWARD chain.  PREROUTING and POSTROUTING
are used to do modify packets.

Regards,

Brad Morgan












