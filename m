From: Oskar Andreasson <blueflux@koffein.net>
Subject: Logging stealth scans with connection tracking enabled. (fwd)
Date: Thu, 26 Sep 2002 07:19:20 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209260717330.1623-100000@laptop1.agatha>
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
Cc: glfaulk@cox.net


Hi all,

Sorry about this, but I simply don't have the time to reply to this mail. 
Please send the mail to the CC'ed adress as well, when you reply.

Thanks!

-- 
----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net

---------- Forwarded message ----------
Date: 23 Sep 2002 15:31:26 -0400
From: Gus Faulk <glfaulk@cox.net>
To: blueflux@koffein.net
Subject: Logging stealth scans with connection tracking enabled.

Hi Oskar. I have been reading your iptables tutorial and have found it
very informative. I am writing a firewall and I have run into a problem
that I cannot find any info on. Here is my problem.

If I use the following lines every thing works fine.

iptables -A INPUT -i eth0 -p tcp --tcp-flags ALL FIN -m limit --limit
5/m -j LOG --log-prefix "Stealth FIN "

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state INVALID -j DROP

Using the above lines I can use nmap to do a FIN scan and the log rule
will catch it and log it.

But when I put in the following lines it does not log it anymore.

iptables -A INPUT -i eth0 -p tcp --tcp-flags ALL FIN -m limit --limit
5/m -j LOG --log-prefix "Stealth FIN "

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A INPUT -m state --state NEW -j DROP

I was under the impression that the way the packets went down the chains
were first seen first hit and the log line would get hit first. But it
must not work that way. 

So I then got the idea that I would use the nat PREROUTING table to log
scans like this because the nat PREROUTING chain gets hit before the
filter rules or so I thought.

iptables -t nat -A PREROUTING -i eth0 -p tcp --tcp-flags ALL FIN -m
limit --limit 5/m -j LOG --log-prefix "Stealth FIN "

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A INPUT -m state --state NEW -j DROP

But it does not work. It seems to me that if I log in the nat PREROUTING
chain that it would hit that before it even got to the filter INPUT
state match chain. Can you offer any help as to what I am doing wrong or
will it just not work. Thanks.



