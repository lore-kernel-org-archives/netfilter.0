From: Jimmy James <jamesstickland@sympatico.ca>
Subject: Denying output to irc servers on std. tcp ports from router and behind 
 NAT
Date: Mon, 09 Sep 2002 07:34:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7C874B.A69024FC@sympatico.ca>
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

Hi, the reason i am here is to ask how i can block access to any tcp
connection with any host on ports 6666-7000.  I am running Iptables
1.2.2, which came with an old slackware linux 8.0 cd.

My connection to the internet is pppoe, whereas ppp0 is the internet
interface that is bonded with eth0.  I only have 2 nics, one physicaly
connected to the dsl modem (eth0), and the other (eth1) connected to the

hub.

<INTERNET---<ppp---<firewall---<ppp0---<eth0---<eth1---<hub---<WORKSTATIONS

           \-------->/-------->/-------->/----->/------>/----------->/
This is the best i can illustrate it.

Anyway, what I am trying to do is deny outbound access to all of irc
from all my computers including the router.

I changed the output chain for the filter table on the router by typing
"iptables -t filter -A OUTPUT -o ppp0 -p tcp --dport 6666:7000 -j DROP"

Once this entry was made, i could no longer connect to any irc server
(that runs standard port settings) from my router.

However,  on NATed machines, such as my twm workstation, I could still
connect to open ports 6666:7000 on any serverr.  What is wrong?  Why
does the iptables entry i just typed not drop outbound packets from
NATed machines?

Seeing that eth0(ppp0) is the closest NIC to the internet, I figure that

an outbound packet from behind the NAT will depart to the outside from
this interface.  Why doesnt the filtering of output to tcp6666-7000
using the interface closest to the internet on my router apply to the
internal machines?  Wcan i still connect to irc from my workstation
using this rule?

I did find a solution that would disable output to tcp6666-7000  from
both my router and the workstations behind it.  However,  this solution
requires that i apply an additional iptables rule.

I figure that as a NATed machine attempts to connect to a host in the
outside world, it obviously goes through the router.  Since the closest
interface between the internal network and the router is eth1, i figure
that in abstract, the routing from the workstation to the internet IRC
servers goes like this:

WORKSTATION-->ROUTER(ETH1)-->ROUTER(ETH0)-->ROUTER(PPP0/ETH0)-->PPP(DSL
MODEM)-->INTERNET-IRC SERVER

Considering that the iptables rule is written on the router, and since
the workstation is linked to the router via eth0, I assume that the rule

must consider the packets coming from the workstation as data destined
for the router (the machine handling the iptables rules).

Using the following rule, "iptables -t nat -A PREROUTING -i eth1 -p tcp
--dport 6666:7000 -j DROP,"
I am no longer able to connect to IRC servers! Good!  However, while
reading the IP-Tables HOWTO at
http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutorial.html,

I noticed that "Table 3-2. Destination local host (our own machine)"
makes a note that one should avoid packet filtering in step 4.

WHAT IS WRONG?!  Why cant i just use one iptables entry in the
FILTER table using the OUTPUT chain to handle the filtered output for
both my internal network and router at once?

Does anyone know of a new rule i could use, a module i need to load, or
maybe an additional rule for this to work?

Thanks.

-James Stickland [Scarborough, Toronto, Ontario , Canada]











