From: Chris Shepherd <chriss@whstuart.com>
Subject: ip_conntrack_http?
Date: Mon,  9 Dec 2002 11:16:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039450606.3df4c1ee704fd@mail.whstuart.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

Hi,
  I was attempting to perform some connection-level load balancing with 
NetFilter this past weekend, and I kept running into issues with non-static 
pages. Specifically PHP and/or ASP pages that utilise server-side Session 
variables. The problem stems from the fact that most, if not all browsers, open 
multiple connections to the same webserver. This problem may only occur in 
places where you are using frames. 

My Setup was as follows:

(10.0.0.1) FW (10.0.1.1) --------- WS (10.0.1.2)
                        \_________ WS (10.0.1.3)

Rules were as follows:
iptables -t nat -A PREROUTING -i eth0 -d 10.0.0.1 --dport 80 -j DNAT --to 
10.0.1.2-10.0.1.3
iptables -A FORWARD -i eth0 -o eth1 -d 10.0.1.0/24 --dport 80 -j ACCEPT
iptables -A FORWARD -o eth0 -s 10.0.1.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 10.0.1.0/24 -j SNAT --to 10.0.0.1

My problem was this:
I successfully login to my webdev site (triggering creation of session vars). 
At this point, it seems that the browser only initiated 1 connection. 
As soon as the login completes, it forwards to a php script containing a 
frameset.
This frameset has three frames. At this point, the browser initiates a second 
connection.
All my scripts check for the existance of a boolean session variable, and if it 
is not there, it forwards the user back to the login page. This session 
variable was not set on the second webserver for obvious reasons, so I get 
forwarded back to the login page. 
Now, the problem here is that the browser's second connection got Natted to 
10.0.1.3 instead of 10.0.1.2, and the webserver on 1.3 has no clue of the 
session variables on the other server. 

What I'm wondering is twofold:
1) Did I do something wrong with my configuration?
2) If not, and this is by design, is there any module/could a module be written 
that would track HTTP requests and forward ALL http requests from the same 
connection to the same IP?

What happens now:
CONN1a -> WS1
CONN1b -> WS2
CONN2a -> WS1
CONN2b -> WS2

What should happen:
CONN1a -> WS1
CONN1b -> WS1
CONN2a -> WS2
CONN2b -> WS2

Provided that CONN1[ab] are related connections, but unrelated to CONN2[ab].

Is this possible with the current NetFilter setup? Must a module be written?

I am very interested in knowing, because it could save myself and a few dozen 
webdevs I know a lot of money that we'd be spending on a hardware connection-
level load balancer.

-- 
Chris Shepherd




-------------------------------------------------
This email may contain confidential information. Use of any such information
is strictly prohibited without express written consent of the sender



