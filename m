From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: sub interface filtering
Date: Wed, 2 Apr 2003 11:53:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF50C6FEE@alderaan.smgtec.com>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

Correct. Aliases are obsolete from what I can see. IProute2 adds IP
addresses directly to interfaces, so eth0 could have 10 IP addresses
instead of the awkward eth0:0 eth0:1, etc. mechanism. In this system,
you filter based on IP address instead of interface alias.

-----Original Message-----
From: Rob Sterenborg [mailto:rob@sterenborg.info]=20
Sent: Wednesday, April 02, 2003 11:39 AM
To: netfilter@lists.netfilter.org
Subject: RE: sub interface filtering

> Hi guys I have the following setup and rules. And I cant seem to get
the filtering to work.
> eth2:0
>=20
> <routeable internetIP/28>
>=20
> eth2:1
>=20
> <routeable internetIP/28>

AFAIK it is because you cannot filter eth<x>:y (but you can filter the
IP address of course).


Rob



