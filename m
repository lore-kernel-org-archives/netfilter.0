From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: Re: routing mail traffic through a second interface
Date: Mon, 26 Jul 2004 08:43:00 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4455.216.239.71.162.1090845780.squirrel@216.239.71.162>
References: <20040726042628.25004.71017.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040726042628.25004.71017.Mailman@vishnu.netfilter.org>
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
To: dyna@tri-oxyde.org

Hi Julien,

Julien <dyna@tri-oxyde.org> wrote:

> Hi,
>
> I have been trying for a few days now to route mail traffic on a=3D20
> different connection than rest of traffic using iproute2, I already did=
=3D20
> some posts regarding this problem, and thanks to help of guys here and=3D=
20
> in the lartc mailing list I succedeed to have a little improvement.
>
> Here are the box infos :
>
> Slackware 9.1 (Linux 2.4.22)
> Two dsl connections via pppoe
>
> I only care about locally generated mail traffic but I didn't succeed=3D=
20
> making it as the mta level.
>
> I did :
> iptables =3DE2=3D88=3D92A OUTPUT =3DE2=3D88=3D92i eth0 =3DE2=3D88=3D92t=
 mangle =3DE2=3D88=3D92p t=3D
> cp =3DE2=3D88=3D92=3DE2=3D88=3D92dport 25 =3DE2=3D88=3D92j MARK =3DE2=3D=
88=3D92=3DE2=3D88=3D92set=3DE2=3D88=3D
> =3D92mark 1
> echo 201 mail.out >> /etc/iproute2/rt_tables
> ip rule add fwmark 1 table mail.out
> ip route add default via [Second's ISP Gateway] dev ppp1 table mail.out
>

Why not use the ROUTE target ?

Let's say your normal flow goes through ppp0 by default.

def_int=3Dppp0
iptables -t mangle -I OUTPUT -o $def_int -p tcp --dport 25 -j ROUTE --oif
ppp1 --continue

So now, all traffic generated from the computer itself will use ppp1 as
the outgoing interface. Do not forget the --continue which means the
packet will continue traversing other rules.

> In order to make packets go out with correct source ip address :
> iptables -t nat --append POSTROUTING -p tcp --dport 25 --jump SNAT=3D20
> --to-source [Second's ISP external IP]
>

Correct.

> The current situation :
> I can see with tcpdump packets going out, and back but if I do telnet=3D=
20
> someisp.com 25 I see nothing in the terminal.
>

Are you sniffing on ppp1 ?
Did you enable NAT of local connection ?

> I really don't know what can be wrong and found no answer neither in
> the=3D20
> mailing list archive, in the lartc howto or in the advanced routing how=
to=3D
> .
>

I can actually not answer.  Please provide more details such as related
Conntrack entries, commands you executed to troubleshoot, etc.



--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


