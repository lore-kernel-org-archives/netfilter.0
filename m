From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Mon, 26 Jul 2004 13:27:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261327.43786.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <200407241647.52286.Antony@Soft-Solutions.co.uk> <200407261413.27558.fred99@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407261413.27558.fred99@libertysurf.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Monday 26 July 2004 1:13 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:

> Thanks for your answer but if I understand whant you mean, I have only =
to
> add the following line in my iptables script :
> iptables -A POSTROUTING -t nat -o eth2 -j DNAT --to 62.160.X.Y

Please note the correction posted by Jason Opperisano - I typed a D inste=
ad of=20
an S:

iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to 62.160.X.Y

> With this line the computers on my LAN and my DMZ will allow to exit to=
 the
> Internet ??

Yes.

> With the two following lines will it work ?
> iptables -t nat POSTROUTING -s 172.16.0.0/16 -o eth2 -j MASQUERADE
> iptables -t nat POSTROUTING -s 192.168.2.0/24 -o eth2 -j MASQUERADE

Yes, that would work as well, but:

1. Why do you want to specify the source addresses?   Do you have any oth=
er=20
subnets on the inside of your firewall (if not, why bother to specify, if=
=20
yes, don't you want those other addresses to have access to the Internet?=
)

2. Do you have a dynamic (DHCP) address on eth2?   If so, then MASQUERADE=
 is=20
the correct target, but if ti's a static address, SNAT is marginally more=
=20
efficient.

Regards,

Antony.

--=20
If J. Random Websurfer clicks on a button that promises dancing pigs on h=
is=20
computer monitor, and instead gets a hortatory message describing the=20
potential dangers of the applet - he's going to choose dancing pigs over=20
computer security any day. If the computer prompts him with a warning scr=
een=20
like: "The applet DANCING PIGS could contain malicious code that might do=
=20
permanent damage to your computer, steal your life's savings, and impair =
your=20
ability to have children," he'll click "OK" without even reading it. Thir=
ty=20
seconds later he won't even remember that the warning screen even existed.

 - Bruce Schneier "Secrets and Lies"

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


