From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: NAT'ed Domain Authentication
Date: Wed, 13 Oct 2004 10:53:10 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E386@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Bryan McAninch <bmcaninch@penson.com>, netfilter@lists.netfilter.org

Bryan McAninch wrote:
> Hi all,
>=20
> I am attempting to setup remote access domain login over an IPSec
> tunnel. The tunnel is between a Linux firewall with iptables &
> openswan, and a windows xp laptop; the internal domain controllers
> are 2003 servers. For routing purposes, I need to SNAT the laptop to
> one of our internal rfc 1918 addresses on the internal interface of
> the firewall. The problem I am encountering is getting the laptop to=20
> successfully log on to the domain, and I'm certain it has something
> to do with the SNAT.=20

You should be logging in using Windows LDAP. If you aren't giving the
Laptop a valid internal IP, I suppose you'd have to SNAT the incoming
traffic to the Linux firewall. Questions:

What can't you give the incoming host an internal IP?
Do you have two nested networks inside NAT'ed or do you not control the
allocation of IP's, or some other reason (no ProxyARP?)?

Why can't you login using LDAP or Kerberos? It shouldn't matter if
you're snated or not.

Can you access ANY service behind the firewall?

Do you log all soon to be dropped packets & do you see in the logs any
packets getting dropped when trying to login?


