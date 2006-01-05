From: Rub=?ISO-8859-1?B?6Q==?=n Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: IPTABLES + OUTPUT + SNAT
Date: Thu, 05 Jan 2006 13:07:55 +0100
Message-ID: <BFE2CAAB.A40%eb5esx@eb5esx.ampr.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello friends:

We are using iptables under Linux kernerl 2.6.14.

We need to do this:
Our server has 2 ip's. One is used only for SMTP outgoing and the other for
all the rest.
All is running fine except that our smtp outgoing IP has problems conecting
ONLY to one smtp server.
What we want to do is: all from our server to that smtp server change the
source IP and use the other one that we have in our server.
Do i explain ok? My english is not very good :(
We are trying this with this:

iptables -t nat -A OUTPUT -p tcp -j SNAT -d ip_wanadoo --to nuestra_otra_ip

But:
iptables: Invalid argument

We are using OUTPUT becouse we think that it is the correct.

Can this be done? What are we doing badly?

A lot of thank's
=20
--=20
Rub=E9n Navarro Huedo
http://www.palotes.com
http://www.cabodesantapola.org




