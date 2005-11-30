From: Jay Zorzi <jzorzi@marketlinksolutions.com>
Subject: DMZ Setup Question
Date: Wed, 30 Nov 2005 11:22:00 -0500
Message-ID: <1133367720.22295.45.camel@syslinux.marketlinksolutions.net>
Reply-To: jzorzi@marketlinksolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

My colleague and i are having a disagreement about our network firewall
and routing policies.  First the setup information.
We have a Bridge Router running iptables and ebtables as our external
firewall.  Behind that we have a DMZ that contains machines with valid
external addresses.  Between the DMZ and our internal network there is
another firewall.  Our choke firewall.  The choke firewall is doing NAT
in order for our internal network to surf the Internet but for our DMZ
machines to talk to our internal machines we are just using routing, no
NAT.

Now here is the disagreement.  Because the internal machines are using a
private network address my colleague is concerned that we are violating
Internet rules/etiquette by having this internal private ip's routing to
our DMZ machines that have valid Internet IP's.  He is also suggesting
that using nat is more secure.

Can someone help us settle this disagreement?

