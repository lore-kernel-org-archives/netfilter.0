From: "Jai Lamerton" <jlamerto@scu.edu.au>
Subject: Throughput stall problem!
Date: Thu, 21 Nov 2002 10:34:37 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c290ed$6b7e8da0$1401a8c0@vampire>
Reply-To: "Jai Lamerton" <jlamerto@scu.edu.au>
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

Hi, Just wondering if anyone has experienced this problem before.

I have 3 boxes on my lan. 1 RH7.2 with kernel 2.4.9
and iptables-1.2.5 a dialup ppp0 with dynamic IP and squid.
Using a most basic form of iptables ie.
All policy are ACCEPT
iptables -t nat -A PREROUTING -i ppp0 -j MASQUERADE

The problem is, for a short time after I dialup everything works to plan.
Then and I'm not sure if it's when accessing the net from 2 boxes at the
same time but data stops flowing. Web, POP, SMTP can't get through but pings
work fine.

Any ideas!
Thanks. Jai.


