From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: RE: Upgrade Iptables...
Date: Mon, 16 Sep 2002 17:10:30 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC78104545B@server-dcms>
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
To: Raj Wurttemberg <rajw@c64.us>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Okie :-))

Thanks,

Didier Hung Wan Luk
FRCI, Sibotie House
L'Anse Courtois
Pailles
Tel: 230-2869636
Fax: 230-2869629


-----Original Message-----
From: Raj Wurttemberg [mailto:rajw@c64.us]=20
Sent: Monday, September 16, 2002 5:09 PM
To: Didier Hung Wan Luk; 'Netfilter Mailing List'
Subject: RE: Upgrade Iptables...

> I have redhat 7.3 with kernel linux-2.4.18-10 and I want to=20
> use iptables 1.2.7a.
>=20
> When I compile iptables do I need to recompile my kernel to=20
> use the 1.2.7a version of iptables?

Hello Didier,

You will want to apply the patch-o-matic to your kernel and then
recompile your kernel prior to compiling and using the 1.2.7a version of
iptables. I could be wrong, but I do not think that the default RedHat
kernel has all of the necessary iptables modules.

/*Raj*/



