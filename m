From: "Troy L. Mayes" <troy@mayesnet.net>
Subject: Outgoing IP's
Date: Fri, 5 Sep 2003 12:27:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <421F17AAEED10C4ABD00F2875BD87B5429CA@kingkong.mayesnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

OK, the Executive summary.... In a nutshell, I am trying to channel a
single (or multiple) internal host request through a Squid server, and
then have the Squid Svr send it's packets out 10 IP's (virtual
interfaces eth0:1 - eth0:10), round-robin fashion.  We are a legitimate
business specializing in security investigations.

Our company is trying to rotate all traffic outbound from the Squid Svr
using multiple IP's (about 12).  Both iptables and Squid are on the same
computer. Tried using the Squid tcp_outgoing_address, with no luck.
This is not a normal situation, thus the requirement for using multiple
outbound IP addresses.

In the past we used sites such as multiproxy, and others.  Most of these
sites no longer allow our type of activity.  Also, we needed anonymity
of our HTTP traffic, thus the use of a our own proxy.  The users of the
proxy are at a different physical location (corp) than the physical
proxy.  The users tunnel in, and the proxy handles the request from
there.  The proxy is sitting behind a PIX.  The proxy has been assigned
10 IP's from the 172.16.x.x block, with 1 IP being used for the incoming
request.  These IP's are statically mapped by the PIX to 10 routable
IP's. =20

For anybody that reads this, and responds, thanks in advance for your
help and advice.


