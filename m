From: Real Cucumber <monkcucumber@yahoo.com>
Subject: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 09:51:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713165106.65338.qmail@web40710.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a fedora firewall/router using iptables to
forward incoming SSH packets to an internal server and
it works great....however, only if the user does not
remain idle for 1 minute.  If they idle for 1 minute,
the connection "freezes" in the sense that it drops
the connection but its not a proper "connectoin
closed" from the server as if it is a timelimit, but
rather just a connectoin loss like you've unplugged
your cable in the middle of a connection.

If the user is connecting from within the network,
they can remain idle for an unlimited amount of time
without being disconnected.  It is only ones
connecting from outside hte network going through the
iptables firewall that have this idle problem.

I am only allowing TCP and UDP for SSH to be
forwarded.

Do I need any ICMP or any other special connection
timeout rules on the iptables side to fix this
problem?

Any help appreciated!




	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

