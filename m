From: "Richard Whittaker" <RWHITTAKER@nwtel.ca>
Subject: NetFilter DMZ question...
Date: Fri, 23 May 2003 13:29:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sece223b.030@nwtel.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Greetings:

We have a webserver living in a DMZ, and I have the following rule
setup to allow this:

/usr/sbin/iptables -A PREROUTING -t nat -i eth1 -p tcp -d 199.85.228.1
--dport 80 -j DNAT --to 192.168.70.3:80

Unfortunately, the web server only sees the IP address of the
interface, not the source IP address, which kinda messes with our
statistical programs, since the only address the web server "sees" is
the same one over, and over... Is there any way to present the web
server with the "real" address, or should it be be already?....

Thanks,
Richard...


Richard Whittaker, CISSP
System Manager
NorthwesTel Inc.
Whitehorse, YK
(867) 393-7756


