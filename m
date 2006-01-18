From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: ipv6 state matching
Date: Wed, 18 Jan 2006 07:15:09 +0100
Message-ID: <20060118071509.6905e71a@pluto.priv.schuetter.org>
References: <87wtgyc41n.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <87wtgyc41n.fsf@newton.gmurray.org.uk>
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

Hello Graham,

On Tue, 17 Jan 2006 14:39:00 +0000
Graham Murray <graham@gmurray.org.uk> wrote:

> Now that Linux kernel 2.6.15 includes conntrack for IPv6, what is the
> ip6tables (v1.3.4) command which does the equivalent of=20
>=20
> 'iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT'
>=20
> The obvious replacement of iptables by ip6tables complains that
> libip6t_state.so cannot be found.

this is a "bug" in your version of iptables. If you are using
debian, just add
deb http://debian.seabone.net/debian-ipv6 sid ipv6
to your /etc/apt/sources.list and reeinstal the version from this
source with
apt-get install iptables=3D1.2.9-10.0.ipv6.r1



J=F6rg

--=20
J=F6rg Sch=FCtter                      http://www.schuetter.org/joerg
joerg@schuetter.org                http://www.lug-untermain.de/

