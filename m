From: Benjamin Bostow <bbostow@exypnos.com>
Subject: Limit Virus Effects on Web Server
Date: Wed,  5 Jan 2005 07:44:13 -0700
Message-ID: <20050105144413.15525.qmail@webmail02.mesa1.secureserver.net>
Mime-Version: 1.0
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a gateway that directs all internal web traffic to my website.
The site makes use of extensive DB calls. When someone with a virus
that connects to port 80 plugs in behind the gateway the DB goes to
100% CPU usage. I am trying to limit this and try to filter out virus
traffic from browser/user traffic. I was thinking I could use kinda the
same rule as I have for preventing ping attacks but it doesn't seem to
work. I have tried using "iptables -t nat -I PREROUTING 1 -p tcp -m tcp
--dport 80 -m limit --limit 5/s --limit-burst 10 -j redirection_chain". 
It seems that all traffic no matter how great still goes to my
webserver. Also, is there a way to drop packets over a certain amount
per time from one user?

Benjamin


