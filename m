From: Michael Robinton <michael@insulin-pumpers.org>
Subject: port redirect for local host
Date: Mon, 1 Sep 2003 22:00:31 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0309012154390.24379-100000@pandora.is.bizsystems.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a relatively simple redirect that does not seem to work for the
local host. I'm running a DNSBL on a virtual IP address on a host that
already has a DNS daemon running.

entry is...

$IPTABLES -t nat -A PREROUTING -p tcp -d $DNSBL_IP --dport 53 -j REDIRECT
--to-port $DNSBL_PORT

this works fine from both the network (internet) and from the interfaces
on the private side. eth1, eth0

I does not work at all from the local host and no amount of tweaking of
the rule set seems to help.

I've tried about every DNAT combination I can think of.

Any suggestions??

Michael



