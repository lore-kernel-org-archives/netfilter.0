From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: extreme rDNS lag with iptables
Date: Tue, 4 Nov 2003 21:47:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031104214742.18b1ef85.netfilter@schuetter.org>
References: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hallo Ben,

On Tue, 4 Nov 2003 15:27:04 -0500
"Ben" <nigma@nigma.info> wrote:

> Hello,
>=20
> =20
>=20
> I'm new to this list, so forgive me is I seem newbish :-)
>=20
> =20
>=20
> The problem I am having that when I turn on iptables, I see rDNS lag
> to about 30 seconds.  I see this happen with two programs I am using,
> proftpd and uwimap.  Both work fine with flush tables, but when I run
> the following
[...]

try to reject ident connections instead of dropping them () which is the
default in your policy.


J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


