From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: what protocols need UDP instead of just TCP?? DNS, IMAP, SSH,
 etc.?
Date: Wed, 26 Jan 2005 14:30:02 +0100
Message-ID: <41F79B5A.8010200@imag.fr>
References: <20050126000550.GB15359@spawar.navy.mil>
	<1106737232.14109.17.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106737232.14109.17.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jose Maria Lopez <jkerouac@bgsec.com>, netfilter@lists.netfilter.org

Jose Maria Lopez wrote:
> El mi=C3=A9, 26 de 01 de 2005 a las 01:05, seberino@spawar.navy.mil esc=
ribi=C3=B3:
>=20
>>I'm only allowing TCP out of my firewall.
>>
>>What apps/protocls need UDP?
>>
>>DNS, IMAP, SSH, etc.?

all the mbone protocols, such as RTP and friends

> DNS needs UDP for sure.
>=20
>=20
>>I dunno if I need to allow UDP for anything.
>=20
>=20
> Just for DNS if you don't have more protocols like NFS or the
> like that use the UDP.
>=20
> Make a lsof -i and look at the daemons you have and if they
> are listening to UDP or TCP ports, or consult the /etc/services
> list to know if your services need UDP or not.
>=20
>=20
>>chris
>=20
>=20
> Regards.
>=20


