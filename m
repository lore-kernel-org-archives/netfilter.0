From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Poor mans cluster question
Date: Mon, 3 Oct 2005 23:19:27 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B581D@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hello,=20

I need to setup a very simple cluster for testing a couple different
devices and applications.  I'm not looking for perfection.

What I have are 3 web servers in our test environment.  We are testing
both Windows and a Linux web server at the same time.  We basically want
to round robin traffic via IP to any one of the 3 servers.  My
understanding is that the following should make this happen:=20

-A PREROUTING -d 10.0.16.89 -j DNAT --to 10.0.16.90-10.0.16.92

But it doesn't.  I figure the next step would be to implement the
CLUSTERIP but I'm not sure how to do this.  I'd really like to do this
at the firewall level as the production environment uses local director
for load balancing.

Is there a better approach without having to modify the OS?  I'm not
looking for failover but rather round robin.  DNS hasn't been doing the
round robin the way we wanted on the local LAN (as a single workstation
will get stuck with a single IP for that session).

Gary Wayne Smith
