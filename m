From: Michael Hallager <michael@networkstuff.co.nz>
Subject: IP Tables slows network response times
Date: Sun, 14 Aug 2005 21:33:57 +1200
Message-ID: <200508142133.57867.michael@networkstuff.co.nz>
Reply-To: michael@networkstuff.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello all.

I have spent rather a lot of time trying to find an answer for this one.

I have a Slackware Linux box, 2.4.29 kernel running IP Tables. I have the bare 
number of needed modules compiled into the custom kernel.

I start IP Tables using the following batch file:

iptables -P INPUT DROP
iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 25 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 53 -j ACCEPT
iptables -A INPUT -p udp --destination-port 53 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 80 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 110 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 443 -j ACCEPT

This works except it makes webpages and email served from this box SLOW to 
respond. (Several seconds).

Any ideas please? Questions welcomed.

Michael Hallager
networkStuff ltd
www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883

