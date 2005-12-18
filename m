From: Marcin Krol <mark@wbp.krakow.pl>
Subject: poor 1:1 NAT / port forwarding performance
Date: Sun, 18 Dec 2005 12:41:50 +0100
Message-ID: <1522723205.20051218124150@wbp.krakow.pl>
Reply-To: Marcin Krol <mark@wbp.krakow.pl>
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

Hello everyone,


I would be very grateful if someone could pinpoint the source of this
problem (and even more grateful for a solution).

Since I can't get more public IP addresses, I have set out to make NAT
translation with sort of port forwarding to another web server (on
another machine, 192.168.25.1) on port 5006 on gateway machine:


iptables -t nat -A PREROUTING -p tcp -d EXT_IP --dport 5006 -j DNAT \
--to-destination 192.168.25.1

iptables -t nat -A POSTROUTING -p tcp -s 192.168.25.1 --sport 5006 \
-j SNAT --to-source EXT_IP


It works, but it's slow as hell!!

I download the test file from the main HTTP server (over the internet)
at 160-180 KB/s, while with the NATted server the transfer is about 16
KB/s - 10 times too slow!!!

(It's definitely not the issue of the 2nd webserver box having little
resources, it has a lot of resources; besides, locally over Ethernet
and without NAT it's very fast)

I set the policy on all chains to ACCEPT, I was emptying the tables
leaving only above rules, etc, nothing works, it's still slow. I've
been googling a lot for a solution, but to no avail - some people
report this problem, but nobody has ever found the solution.

Kernel 2.4.22 / FedoraCore 1.

Is anybody here using 2.6 kernel for this sort of work? If so, is it
slow, too, or is it working like it should be?



  

-- 
Best regards,
 Marcin                          mailto:mark@wbp.krakow.pl



