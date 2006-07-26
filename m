From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: A netfilter 'if possible' question
Date: Wed, 26 Jul 2006 12:17:57 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127E1@knowledge.wizdom.nu>
References: <5bdb1aa70607260229h5742562djf4065dfb70dfbb6c@mail.gmail.com>
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
To: Simon <greminn@gmail.com>, netfilter@lists.netfilter.org

There are no lame questions, only lame answers like: NAT =3D NAT =3D NAT =
=3D NAT :-)
=20
Sure you can do this, just add a DNAT rule in the PREROUTING chain of =
the NAT table, translating x.x.x.x to y.y.y.y.
And be sure to allow 'any' to access port 80/443 on y.y.y.y in the =
FORWARD chain of the filter table.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Simon
Sent: Wed 26-Jul-06 11:29
To: netfilter@lists.netfilter.org
Subject: A netfilter 'if possible' question



Hi There,

I understand NAT to the level that i currently use it, to send certain
ports from our DSL link to various different servers within our
internal network. Is it possible to do this to an outside IP address.

eg. zzz.zzz.zzz.zzz sends http requests to port 80 and 443 on
xxx.xxx.xxx.xxx, then have netfilter NAT those requests thru to port
80/443 on yyy.yyy.yyy.yyy, both x and y being different real world IP
addresses and on different subnets? (physically seperate servers).

Thanks and sorry if its a lame question...

Simon




