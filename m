From: squid@oranged.to
Subject: iptables with irc and auth
Date: Mon, 10 Jan 2005 10:59:49 -0000 (GMT)
Message-ID: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from 212.100.225.41
	(SquirrelMail authenticated user squid@oranged.to)
	by webmail.* with HTTP; Mon, 10 Jan 2005 10:59:49 -0000 (GMT)
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

Hello,

I am trying to configure iptables so that when I connect to IRC on port
6667 it will allow the auth connection back on 113 from that IP address.

I have both inbound and outbound rules on the system. When I try any of
the state information it wont work. Im guessing thats because the iptables
config cant see that its a related connection. Is there any way that I can
setup iptables so that it will allow AUTH only if im connected on port
6667 to that same IP?

thanks

Jimmy.



