From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Martian source with 2 external interfaces
Date: Sun, 17 Jul 2005 15:57:15 +0300
Message-ID: <3063e505071705576be41f03@mail.gmail.com>
References: <20050717103025.A66F3B1B@agile.dk>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050717103025.A66F3B1B@agile.dk>
Content-Disposition: inline
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
To: Jan Andersen <jma@agile.dk>
Cc: netfilter@lists.netfilter.org

for i in /proc/sys/net/ipv4/conf/*/log_martians ; do
echo 0 > $i
done


And you are done :).

I believe you have the problem because some packets go out to one
interface, and comes back to the other, a common thing to asymetric
routing. I doubt you have hundred of thousounds routes , so you must
use some complicated setup for your load balancing to get those
errors.

On 7/17/05, Jan Andersen <jma@agile.dk> wrote:
> Hi
>=20
>=20
>=20
> I have a setup with 3 interfaces, one for the LAN, one for a cable-modem =
and
> one for DSL.
>=20
>=20
>=20
> What I want (and need) is to have both external interfaces running at the
> same time.
>=20
>=20
>=20
> When I one have my LAN and one of the external running then everything is
> working just fine. But when I turn on both interfaces at the same time my
> machine is generating a huge amount of martian-source errors in the log. =
I
> even tried to turn off the firewall, but with out luck.
>=20
>=20
>=20
> Why is this happening, and how do I solve this problem?
>=20
>=20
>=20
> Regards
>=20
>=20
>=20
> Jan Andersen
>=20
>=20
>=20
>=20


--=20
Bla bla

