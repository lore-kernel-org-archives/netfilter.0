From: Clist <clist@uah.es>
Subject: petition: Connection tracking benchmarking results
Date: Tue, 2 Nov 2004 16:39:13 +0100
Message-ID: <200411021639.13336.clist@uah.es>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all,

I need to study a solution based on iptables for a large number of networke=
d hosts.=20
It will be used as a central wategay for the networks we have at University=
 of Alcal=E1.

We need to perform a large numer of NAT (above 3000 host or so) for the int=
ernal networks and filtering for
several ranges of public addresses for web servers and things like that.=20

Our main campus backbone is ATM based but we plan to deploy our solution on=
 gigabit links attached to=20
our routers because we think this setup will be more stable that managing A=
TM and lane connections at the firewall.

Currently we have a setup for filtering access for our public web servers a=
nd networking services based on dual Pentium III at 800Ghz 1Gb RAM and kern=
el 2.4.2x
customized over RedHat 7.3 but we have no idea of behavior of iptables conn=
ection tracking on managing large number of network clients.=20

Anyone know  benchmarking test results, or studies of netfilter performance=
 carried by some people,=20
that we can see in order to decide how much hardware resouces we need, best=
 distributions for doing so=20
or high performance projects base on netfilter/iptables?

Thanks in advance, Clist

=2D-=20
=2D------------------------------------------------
Clister UAH
=2D------------------------------------------------

