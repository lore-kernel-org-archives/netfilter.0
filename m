From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 14:17:37 -0300
Message-ID: <002601c5774e$499f2c90$5100a8c0@14bis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi guys,

I'm reading a documentation regarding high availability of LDAP server, and=
 this=20
document says it is possible use an IBM network device called IBM Dispatche=
r=20
that can automatically divide the bandwidth between two LDAP servers (a mas=
ter=20
and a slave server (that is a replica of the master)). But further on, it c=
an=20
route all the LDAP traffic to only one server, if the other server is down.

I know it's possible to implement bandwidth control with linux, but what ab=
out=20
the second feature? Does someone know if it's possible to implement the sec=
ond=20
feature using linux?

Thank you,
-------------------------------------------------
Bruno Negrao - Network Manager
Engepel Teleinform=E1tica. 55-31-34812311
Belo Horizonte, MG, Brazil=20


