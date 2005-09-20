From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 08:44:11 -0400
Message-ID: <65aa6af905092005445b3940d4@mail.gmail.com>
References: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
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
To: netfilter@lists.netfilter.org

You are using multiroute path, right?

what is the output of

ip route show default

(on the router, of course).

On 9/20/05, Marco Berizzi <pupilla@hotmail.com> wrote:
> Thanks for the reply Rob0.
>=20
> On Thursday 2005-September-15 04:59, Marco Berizzi wrote:
> >> My firewall script mark all the squid packet and I route them
>=20
> >You did not post your rules.
>=20
> This is not the real problem.
> The problem is the SNAT rule. It is doesn't work as stated
> by man. How does it work? Per socket? Or per socket per host?
>=20
> iptables -t nat -I POSTROUTING -s HDSL_ip
> --protocol tcp -m multiport --dports SQUIDports
> -j SNAT --to first_adsl_ip --to second_adsl_ip
>=20
> This rules snat all packets created by this (squid) host, but
> everytime I connect to the internet *always* the first_adsl_ip
> is chosen. My company lan has about 150 pc that connect to
> the internet by this proxy, so I don't understand why *everytime*
> I open my browser and I connect to www.dnsstuff.com always the
> same ip is displayed. It isn't a cache problem because I reset them
> (both on squid and browser side).
>=20
> >> through the two adsl connections (I have patched the kernel
> >> with the equalize patch).
>=20
> > Which patch is this? I have used Julian Anastasov's patches
>=20
> Here is http://www.ussg.iu.edu/hypermail/linux/kernel/0203.2/1314.html
> However this is only for routing not for nat.
>=20
>=20
>=20
>

