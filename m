From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 10:14:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567948D@alderaan.smgtec.com>
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
To: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>, markee@bandwidthco.com, Sudheer Divakaran <sudheer@svw.com>, Netfilter mailing list <netfilter@lists.netfilter.org>

Hudson Delbert J Contr 61 CS/SCBN wrote:
> this should be a basic rule of netsec 101 ...
>=20
> one should have to 'turn' on any allowed traffic out of the box.
>=20
> i.e......the firewall should not allow ANY traffic by default until
> specifically
> 		TOLD TO DO SO BY THE ADMIN.
>=20
> this is a good thing.


Just my two cents on this:

If your firewall is designed correctly, there shouldn't be any network
available services running baring SSH. Because of this, if a hacker gets
into your firewall I assume that 99.9999% of the time, they'll have root
access. Any hacker that could hack into your Linux box will be able to
disable any iptables rules in a second. Hence, blocking the OUTPUT chain
on a firewall does NOT secure you against hackers.

It does protect you against yourself if you really need it. For a
tightly regimented network with many admins of varying experience, this
might be a sane policy to implement. Beyond that, its simply beurocratic
overhead.

