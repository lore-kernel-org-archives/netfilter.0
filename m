From: "Michael P. Brininstool" <mikepb@hoplite.org>
Subject: RE: port forwarding through localhost
Date: Tue, 30 Jan 2007 12:54:26 -0700
Message-ID: <005401c744a8$7a804690$c84f949b@nasw.ds.army.mil>
References: <000001c7419d$0bab38f0$0d01a8c0@Mobi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c7419d$0bab38f0$0d01a8c0@Mobi>
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
To: "'Andy B.'" <globi@hot.lu>, netfilter@lists.netfilter.org

I know this is a little late, but when doing services like this, it has
proved helpful in the past to have the customers use a FQDN
(full-qualified-domain-name) instead of an IP.  For example, I setup the
following: imap.domain.com, smtp.domain.com, www.domain.com,
mail.domain.com, mysql.domain.com, proxy.domain.com, ftp.domain.com, =
etc,
even if they are all on the same machine.  That way, as services need to =
be
split off onto their own machine, a simple DNS change moves the load.

In the manner of helping in your current situation, isn't there a -j
REDIRECT table?

--
Michael P. Brininstool
=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Andy B.
Sent: Friday, January 26, 2007 3:55 PM
To: netfilter@lists.netfilter.org
Subject: RE: port forwarding through localhost

I am using 2.6.19.2.

An intermediate tcp proxy method doesn't sound so nice, since iptables =
is
way more flexible to me :-/

Andy

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal =
Hambourg
Sent: Friday, January 26, 2007 23:50
To: netfilter@lists.netfilter.org
Subject: Re: port forwarding through localhost

Andy B. a =E9crit :
> Sorry about the "3333", it was a typo. Of course I meant 3306.
>=20
> My rules are working when we are talking about the external interfaces =

> (eth0), and the SQL Server is responding when talking directly to
10.0.0.100

You didn't say what is the kernel version. If it is >=3D 2.6.11, you're =
stuck.

As I suggested to someone else having the same problem as you, instead =
of
using a DNAT rule you may use a TCP "proxy" such as stone
(<http://www.gcd.org/sengoku/stone/>, supports UDP too) or 6tunnel
(<http://toxygen.net/6tunnel/>, originally designed to relay connections
between IPv6 and IPv4 hosts but works between IPv4 hosts too) which =
listens
on the local port 3306 and relays the local connexions to the remote SQL
server.






