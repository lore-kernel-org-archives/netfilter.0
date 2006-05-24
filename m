From: desert@zarzamora.com.mx
Subject: Load Balancer Trouble, are "Routes with Memory" Possible?
Date: Tue, 23 May 2006 22:56:46 -0500
Message-ID: <20060523225646.poejqicpp0cg88gc@zarzamora.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I have a working load balancer, i have balanced traffic between 3
ADSL, im planning to upgrade it to 5 ADSL's. But not before solving
the following problem.

I will give you plenty of details.

THE BALANCER
------------
Every link comes just linke this:

LAN--[-eth0-linux-ethX]--192.168.6x.x-[ADSL-Modem]--(ISP)

eth0: 192.168.62.1 -- LAN

eth1: 192.168.61.6 -- ADSL 1
eth2: 192.168.63.6 -- ADSL 2
eth3: 192.168.64.6 -- ADSL 3

so the topology of my network is

<-LAN               /---192.168.61.6-->
192.168.62.1-[linux]---192.168.63.6-->
                    \---192.168.64.6-->


The way i balance is documented on the internet, i use SNAT lines like
this:
#iptables -t nat -A POSTROUTING -o eth1 -j \
         SNAT --to-source 192.168.61.6

basically I create a table for each link using "ip route" then i use
the magical command:

#ip route add default equalize  \
  nexthop via 192.168.61.1 dev eth1 weight 2 \
  nexthop via 192.168.63.1 dev eth2 weight 2 \
  nexthop via 192.168.64.1 dev eth3 weight 1

also i deactivate rp_filter for each WAN interface and activate IP
forward. (dont't need MASQUERADE). This is route based load
balancing.

I can surf the net.
It works!!...well, almost.

THE SYMPTOMS (and partial solution)
------------

Web navigation works fine, but i began to had trouble with MSN
Messenger, it suddenly disconnects after 5 minutes, i found that MSN
servers don't like seeing you come from different IP's ever 5 min.
That's annoying, so i solved it using static routing for MSN traffic.
Then i found SSH drops your connection too. Again, static routing. I
use this:

#iptables -A PREROUTING -t mangle \
   -m multiport -p tcp --dports 21,22,1863 \
   -j MARK --set-mark 4

#ip rule add fwmark 4 table 1

Then i began to had trouble with more Instant Messengers, and used
static routing. Is is low traffic, just conversations, so it is not
really a problem to use this kind of solution.

Solved!!, ... well, almost.

THE PROBLEMS
------------

FTP sessions have problems, I log in perfectly, but when i try to do
an "ls" i just cant, "connection refused". The easy solution was to
try to do static routing again, IT DIDN'T WORK.

Why? My guess is that the session is authenticated via one route and
the "ls" is tried to be done using a different WAN route. The remote
FTP server refuses to reply to an "unauthorized" client, not knowing
is the same one, just coming from a different IP.

I tryed using the --state RELATED,ESTABLISHED matches for iptables
using port 21, didn't work. Then i found that for passive mode i need
port 20 also.

THE UTOPIC DESIRES
------------------

If i continue to do static routing, i will no longer have an automatic
load balancer, but a manually balaced router.

The need is for something as route memory. There are similar toys like
CONNTRACK and the "recent" patch for netfilter:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html=
#toc3.16

What i need is this.

1) A connection comes from LAN trying to access an IP in WAN
2) Round robin (or whatever) to select any WAN pipe.
3) Remember that route for many minutes
   or until client closes it.

I dont care if other LAN clients follow the same route or if they
select a different route.

The real trick is to mantain the route for as long as the client needs
it.

This is what i haven't found on Google, LARTC, this mailing, Usenet,
nor any Blog.

This kind of behavior will avoid using static routing for anything.
everything will be semi-static for a few minutes or until the client
needs.

The problem with my actual route balancing is that routes live for
only 5minutes, even those that are in constant use.

Is there a solution for this?
Or can anybody point me in the right direction?
Is it possible with the "recent" patch?
Is it better to use the Nth patch?

Has anybody done this before?

Thanks Verrry Much for any comment on this!!


PS: I cant do BGP with my ISP.






---
@-@

