From: "Matt Parlane" <matt@zevi.net>
Subject: Multiple conditions for logging packets
Date: Mon, 23 Sep 2002 23:06:50 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09d001c262f1$50f418d0$0200a8c0@bart>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi list...

I have a simple linux machine acting as a firewall/gateway, and I'm after a
way to specify multiple conditions for rules.  Basically I want to create a
rule for packets which are either coming from or going to the internet - not
packets which are both sourced and destined for the local network.  The
reason is that I am logging the packets to MySQL using ULogD - and I really
can't afford to be periodically removing all the records from the table
which are only for internal traffic.

I haven't been able to do this so far using iptables rules.  Does anyone
have any ideas about how this might be achieved?

Many thanks in advance...

Matt Parlane
Zevi Interactive
matt@zevi.net


