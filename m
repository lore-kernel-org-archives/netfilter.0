From: Bob Keyes <bob@sinister.com>
Subject: assymetrical routing, iptables problem.
Date: Wed, 2 Oct 2002 22:15:09 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.BSO.4.33L0.0210022200040.16901-100000@sinister.com>
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


Hello All,
due to some unfortunate issues in dealing with Network Solutions, I have a
machine that cannot have its address changed, though it has moved. While I
am trying to rectify this, I am attempting to use iptables to redirect
that traffic to the machine's new home.

Routers on both sides are linux. Router 'A' is on the old network,
designated here as 1.1.1.1, and the computer 'B' is on 2.2.2.2, the new
network. The new network has teh ability to send out packets with any
source address, i.e. the ISP does not do IP source filtering. Also, I only
need to have http functioning here, but I need to have it working on both
addresses on the A and B networks. Apache is listening on port 8000 as
well as 80.



on A:

# iptables -t nat -A PREROUTING -d 1.1.1.1 -p tcp --destination-port 80 \
  -j DNAT --to-destination 2.2.2.2:8000

Redirects packets destined for 1.1.1.1 port 80 to 2.2.2.2 port 8000. This
is a way to 'tag' the packets (I opted against using any TCP options, as
routers/firewalls along the way may play with said options).

on B:

# iptables -t nat -A POSTROUTING -s 2.2.2.2 -p tcp --source-port 8000 -j \
  SNAT --to-source 1.1.1.1:80

This translates the source back to it's proper address for the right
packets and sends it out.

The problem is, the latter half of this doesn't work. What I really want
is SNAT in OUTPUT, as I believe that POSTROUTING won't touch packets that
originate on the local machine. Of course I could stick another linux
system inbetween the web server B and the T1 router, but I'd rather not
waste the space/electricity/time.

Any bright ideas?


