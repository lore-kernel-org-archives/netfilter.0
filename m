From: =?ISO-8859-1?Q?Nicole_H=E4hnel?= <nicole.haehnel@epost.de>
Subject: Re: Dead loop on netdevice ipsec0, fix it urgently!
Date: Fri, 09 Jul 2004 13:50:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EE8676.8010708@epost.de>
References: <40EE7E15.70204@epost.de> <200407091227.46746.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407091227.46746.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

I have no nat rules on interface ipsec0.
There is only one rule on this interface.
It's all allowed.

I have nat rules only for a little group of pcs and a proxy
and they are only for surfing.


Thanks!

Nicole



Antony Stone wrote:

> On Friday 09 July 2004 12:14 pm, Nicole H=E4hnel wrote:
>=20
>=20
>>Hi,
>>
>>I get this error on my firewall-vpn-server
>>
>>Dead loop on netdevice ipsec0, fix it urgently!
>=20
>=20
> What is your ruleset (specifically, any nat rules, and any rules applyi=
ng to=20
> interface ipsec0)?
>=20
>=20
>>Any ideas where this come from?
>=20
>=20
> http://www2.frell.ambush.de/archives/freeswan-users/4677.html
>=20
> Regards,
>=20
> Antony.
>=20


