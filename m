From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: Firewalling non-IPsec connections
Date: Tue, 16 Dec 2003 14:45:14 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDCEPFEJAA.mark@npsl.co.uk>
References: <200312160853.01932.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312160853.01932.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

> > The in-kernel ipsec does not have an ipsec0 virtual interface, that is
> > where the problem come from - I don't see a way yet to destinguish
> > decapsulated ipsec traffic from eth0 to eth1 from raw traffic
> between the
> > two interfaces.
>
> Ah.   I have yet to play with the features of 2.6 kernels,
> therefore I didn't
> realise that this version of IPsec has such a drawback compared
> to FreeS/WAN.
>
I solved this using firewall marks.  Essentially, packets that come in via
IPSEC and then get untunelled retain the fwmark, so you can do something
like:

iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 1
iptables -A INPUT -m mark --mark 1 -j ACCEPT

(Obviously repeat for forward if required and do further firewalling for
anything you don't trust from your VPN).

There is also a way of matching particular SPIs inside AH/ESP packets (where
you can do the same thing and set a mark).  This is even better because
specific connections can then be tracked, untested but should be something
like:

iptables -t mangle -A PREROUTING -m esp --espspi num:num -j MARK --set-mark
1

You would more than likely want to insert these into the firewall ruleset
dynamically with the help of your keying daemon (freeswan, isakmpd, ...).

Mark


