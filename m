From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: packet-based load-balanced stateless iptables firewall
Date: Sat, 16 Apr 2005 22:03:54 +0400
Message-ID: <9927912d05041611031e3c93f@mail.gmail.com>
References: <425fd35c.4b2f42c3.66d2.ffff9c96SMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425fd35c.4b2f42c3.66d2.ffff9c96SMTPIN_ADDED@mx.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi to all,

I would like to know how to build a packet-based load-balanced
stateless iptables firewall.

I came across this:

In IPtables, load balancing is done by specifying multiple IP
addresses in a DNAT rule. For example:

iptables -t nat -A PREROUTING -i eth0 -o eth1 -d 192.0.34.72 -j DNAT
--to-destination 192.168.1.2-192.168.1.4

Is the load balancing done in a packet-based manner? Does it use the
round-robin algorithm for it?

Any help will be very much appreciated..

Regards,
Visham

