From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 19:24:54 +0200
Message-ID: <27153.3122439452$1119460801@news.gmane.org>
References: <002601c5774e$499f2c90$5100a8c0@14bis>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002601c5774e$499f2c90$5100a8c0@14bis>
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

Hi,

I am not sure, but that Dispatcher has almost the same ability, as a =
Radius
Proxy. The Radius Proxy is able to send the Request packets to different
servers ( AFAIK ), without client knowing something about it.

Though LDAP is not same as the RADIUS, but I can imagine that is able to
write a daemon ( on the balancer box ) that allows connections. And this
same daemon should be able to forward the queries to the real servers ( =
of
course the one that are alive ). It also should be able to know which
servers are alive and which not...

Just my 50 cent... :D

Regards,

Edvin Seferovic=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Bruno =
Negr=E3o
Sent: Mittwoch, 22. Juni 2005 19:18
To: netfilter@lists.netfilter.org
Subject: IBM Dispatcher X iptables AND linux advanced routing

Hi guys,

I'm reading a documentation regarding high availability of LDAP server, =
and
this=20
document says it is possible use an IBM network device called IBM =
Dispatcher

that can automatically divide the bandwidth between two LDAP servers (a
master=20
and a slave server (that is a replica of the master)). But further on, =
it
can=20
route all the LDAP traffic to only one server, if the other server is =
down.

I know it's possible to implement bandwidth control with linux, but what
about=20
the second feature? Does someone know if it's possible to implement the
second=20
feature using linux?

Thank you,
-------------------------------------------------
Bruno Negrao - Network Manager
Engepel Teleinform=E1tica. 55-31-34812311
Belo Horizonte, MG, Brazil=20




