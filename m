From: Jaret <bitgod@gmail.com>
Subject: Multiple iptables exceptions?
Date: Thu, 23 Sep 2004 10:08:39 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <bc9fb38004092308087dc97b87@mail.gmail.com>
Reply-To: Jaret <bitgod@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

When dealing with iptable rules you can use the "!" exception rule.
For instance...

IPTABLES -t nat -A PREROUTING -s 10.1.1.2 -d ! 207.46.0.0/16 --proto
tcp --dport 80 -j DNAT --to-destination 10.1.1.3:80

That statement will redirect any port 80 traffic from 10.1.1.2 to
10.1.1.3 -unless- it is trying to reach the class B network
207.46.0.0/16. That 207.46.0.0/16 happens to be part of the microsoft
domain, this way the user will only be allowed to go get updates but
will not be allowed to browse online freely. This has been tested and
proven.

So here comes the twist... microsoft does some dns load balancing and
sometimes the update site resolves at 64.4.xx.xx. Ive been digging
through documentation and trying to insert customized rules but I cant
get it to accept anything I try to allow two exception statements...

conceptually what im looking for is something like this...

IPTABLES -t nat -A PREROUTING -s 10.1.1.2 -d ! 207.46.0.0/16,
64.4.0.0/16 --proto tcp --dport 80 -j DNAT --to-destination
10.1.1.3:80

But iptables will not allow the double exception.. well it doesnt
recognize the comma delimit anyways. Like I said I've tried to get
this working a few ways and havent been able to in a single statement
or through multiple statements.

Does anyone out there know a work around for this? Preferably a
solution that stays within IPtables.

Thanks!

