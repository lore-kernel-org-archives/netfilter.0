From: <bmcdowell@coxhealthplans.com>
Subject: RE: Firewall four nics, two separate routes
Date: Mon, 26 Jan 2004 12:50:55 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BEA00@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


Well, it doesn't seem to be very thorough, and it wouldn't encompass
non-IP (_IP_tables), but what about something like:

iptables -A FORWARD -i eth0 -o ! eth1 -j LOG --log-prefix "Wrong Route:
" (and -j DROP)
iptables -A FORWARD -i eth2 -o ! eth3 -j LOG --log-prefix "Wrong Route:
" (and -j DROP)

Test this.  I'm just guessing here.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ryan Johnson
Sent: Monday, January 26, 2004 11:50 AM
To: netfilter@lists.netfilter.org
Subject: Firewall four nics, two separate routes


Hi all,

I have a firewall with four nics, two external nics with two public ips
and two internal nics with private ips (two different networks). What I
would like to do is force all traffic from each internal network to its
corresponding external nic. I believe the only solution to this is to
use iproute2, but I have had to luck. So traffic from internal net1 will
be routed out external nic1, then the other side, internal net2 will be
routed out the external nic2. Internal net1 traffic should never go out
external nic2 and internal net2 traffic should never go out external
nic1.


Thank you in advance,
Ryan

Ryan Johnson
Security Architect
ESP Group


