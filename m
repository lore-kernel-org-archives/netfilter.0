From: "John Black" <black@arbbs.net>
Subject: assigning alias ip address
Date: Thu, 9 Sep 2004 22:10:22 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <003c01c496e3$b6416c60$f82ffea9@black>
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

How does assigning alias IP address work?

I have one network jack coming into my server room. 
eth0  10.10.10.10

I have two servers with public IP address.
this assigns them, right?
ifconfig eth0:10 192.168.1.10 netmask 255.255.255.0
ifconfig eth0:11 192.168.2.11 netmask 255.255.255.0

iptables -t nat -A PREROUTING -d 192.168.1.10 -i eth0 \
                -j DNAT --to-destination 10.10.10.11
iptables -t nat -A PREROUTING -d 192.168.2.11 -i eth0 \
                -j DNAT --to-destination 10.10.10.12

When a mail or web request is made from the internet.  
How does it know where the servers are?

thanks
John


