From: "Shaun Hedges" <sh@realsecure.net>
Subject: FORWARD in/out VS. states
Date: Mon, 17 Mar 2003 22:04:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IAEOKBNDAKLABMLEEMMKOEMBDCAA.sh@realsecure.net>
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

Hi,

Our scenario:

One firewall serving roughly 5000 in/out connections every second on avg.

Our mission:

To only allow FORWARD traffic coming from a trusted NIC or subnet out to the
internet, while not letting any traffic at ALL back into that trusted NIC or
SUBNET UNLESS it was initiated from within.

Our problem:

Using states (ip_conntrack) works, but performance is not good, connections
are dropped/lost, etc.

We want to somehow implement this without any connection tracking, can this
be done?

Our ifaces:

eth1 ( 10.0.0.1 ) Trusted
eth0:1 ( 2.2.2.1 ) Default gateway to 2.2.2.0/24
eth1 ( 1.1.1.1 ) Small /31 subnet for routing, it's default gw is 1.1.1.2
and vice versa, all 2.2.2.0/24 traffic routes over here

So, we want 2.2.2.0/24 to be able to initiate any connections they want, and
get the response it needs back, but we want no connections to be able to
come in ( i.e. those annoying windows msg popup ads spammers are using, worm
problems, icmp probes, etc ).

I've read up and understand somewhat, but can't seem to figure out how to
deal with this in/out issue and not using connection tracking.

Thanks!


