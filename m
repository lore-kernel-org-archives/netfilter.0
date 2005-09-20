From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 11:24:44 -0400
Message-ID: <65aa6af90509200824223496a@mail.gmail.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2CBD@farmer.vikus.com>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7742E2CBD@farmer.vikus.com>
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

The problem for you is that you have a single default gateway:
default via hdsl_default_gateway_ip dev eth0  metric 1

In case you want to use more than one device to route traffic, here's
ours at the office (output taken from ip route show default):

default
        nexthop via 201.249.120.1  dev eth1 weight 2
        nexthop via 200.109.64.1  dev eth2 weight 1

It requires more than just adding one multipath default route. You
have to set different routing tables for each interface you want to
use... and please, make sure none of them is present in the same
subnetwork (that cause the multipath to NOT war at all... I'm waiting
to one grateful day be accepted in the LARTC mail list to ask about
this).

Anyway.... here's the multipath simplest guide:
http://lartc.org/howto/lartc.rpdb.multiple-links.html

and also, look here:
http://linux-ip.net/html/adv-multi-internet.html

On 9/20/05, Derick Anderson <danderson@vikus.com> wrote:
>=20
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> > Marco Berizzi
> > Sent: Tuesday, September 20, 2005 10:24 AM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: snat to multiple source ip
> >
> > /dev/rob0 wrote:
> >
> > > On Tuesday 20 September 2005 07:39, Marco Berizzi wrote:
> >
> > > the source IP is set by
> > > iproute2 in the routing tables.
> >
> > Ok, I'm not clearly explained.
> > I'm using SNAT to change the source ip address because
> > iproute2 set an ip address that I don't like.
> > So, I have inserted the following line in my firewall script:
> >
> > iptables -t nat -I POSTROUTING -s iproute2_chosen_ip
> > --protocol tcp -j SNAT --to i_want_this_first_ip --to
> > i_want_this_second_ip
> >
> > But everytime I connect to the internet always
> > "i_want_this_first_ip" is chosen to do the SNAT.
>=20
> Uneducated, lazy guess: the SNAT target supports only one "--to [IP]"
> and the command parser ignores the extraneous "--to [IP2]". You can test
> this by switching the two IPs and see if you go out on a different
> address.
>=20
> Derick Anderson
>=20
>

