From: Victor Julien <victor@nk.nl>
Subject: Re: Creating rules without the /sbin/iptables command?
Date: Wed, 17 Mar 2004 21:59:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4058BC41.3040702@nk.nl>
References: <40589CF8.8010007@nk.nl> <1079551538.1424.23.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079551538.1424.23.camel@anduril.intranet.cartel-securite.net>
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
To: Netfilter List <netfilter@lists.netfilter.org>

Hi Cedric,

Okay, thanx i will do that. I thought that netfilter-devel was only for=20
development of netfilter itself. My bad ;)

By the way, are the iptables libs in /usr/lib/iptables meant for use by=20
third party tools, or is this considered a dirty hack?

Regards,
Victor

Cedric Blancher wrote:
> Le mer 17/03/2004 =E0 19:46, Victor Julien a =E9crit :
>=20
>>My program (written in c) creates rules by opening a pipe to=20
>>/sbin/iptables. However this is quite slow with large rulessets and on=20
>>slow hardware. Is there another way, like an iptables librarycall or=20
>>something?
>=20
>=20
> You could use iptables libs that stand in /usr/lib/iptables, just like
> iptables does.
>=20
> You should however ask netfilter developpers mailing list.
>=20
> Cc : netfilter-devel@lists.netfilter.org
>=20


