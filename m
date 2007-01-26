From: "Andy B." <globi@hot.lu>
Subject: RE: port forwarding through localhost
Date: Fri, 26 Jan 2007 23:55:15 +0100
Message-ID: <000001c7419d$0bab38f0$0d01a8c0@Mobi>
References: <000001c74194$d484d9b0$0d01a8c0@Mobi>	<45BA7E51.40505@plouf.fr.eu.org><000301c74199$7db871f0$0d01a8c0@Mobi>
	<45BA85AF.5010907@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45BA85AF.5010907@plouf.fr.eu.org>
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
> My rules are working when we are talking about the external interfaces
> (eth0), and the SQL Server is responding when talking directly to
10.0.0.100

You didn't say what is the kernel version. If it is >=3D 2.6.11, you're =
stuck.

As I suggested to someone else having the same problem as you, instead=20
of using a DNAT rule you may use a TCP "proxy" such as stone=20
(<http://www.gcd.org/sengoku/stone/>, supports UDP too) or 6tunnel=20
(<http://toxygen.net/6tunnel/>, originally designed to relay connections =

between IPv6 and IPv4 hosts but works between IPv4 hosts too) which=20
listens on the local port 3306 and relays the local connexions to the=20
remote SQL server.



