From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Basic Question on PREROUTING.
Date: Wed, 27 Nov 2002 15:35:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE498E5.9050207@inbox.lv>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NETFILTER <netfilter@lists.netfilter.org>

hi all,

We have a customer network(wireless, cable etc), which passes thru our 
linux box having kernel-2.4.19, squid-25s1, iptables-1-2s7a.
A few custmer network are using squid.. We want _OTHER_ than these 
network to use our squid cache.
So the Question is how can i allow networks/clients who are _NOT_ having 
squid cache, to use our squid cache using PREROUTING..am a bit confused 
coz the clients network ip's are random.
is there any other possiblity than definning _EACH_&_EVERY_ network to 
use squid cache.. i can use _generalised(i.e allow all)_ for PREROUTING 
on eth1(facing clients) for transparent proxy but how to take out those 
network which have squid ?..( the reason i dont want to define 
_EACH_&_EVERY_ network is beacause there are 42 networks that have to be 
defined whereas only 5 network use squid cache)

i will really be thankful for your help in this matter..

A.H


