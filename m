From: Navneet Choudhary <navneetkc@gmail.com>
Subject: Re: yahoo mail problem
Date: Mon, 7 Mar 2005 13:04:13 +0530
Message-ID: <1dceb012050306233417b707d3@mail.gmail.com>
References: <0dd101c5215c$7393efb0$09603fca@southern>
	<4229C04F.1000103@cardvn.net>
	<0f7a01c522e5$deac0dc0$09603fca@southern>
Reply-To: Navneet Choudhary <navneetkc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f7a01c522e5$deac0dc0$09603fca@southern>
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
Content-Type: text/plain; charset="windows-1252"
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

iptables -t nat -A POSTROUTING =E2=80=93s <your LAN network> -o <the eth po=
rt
used to go outside> -j SNAT --to-source <Your VALID TROUBLED PUBLIC
IP>

e.g
-A POSTROUTING -s 192.168.0.1/255.255.0.0 -o eth1 -j SNAT --to-source
66.94.234.13


 >> when iam doing NAT and masq.. iam not able to check yahoo mails
> >> when i use the public IP i could able to check mails and send/receive

are you changing Public IP when you sitwch to second IP & won't able
to send/receive mails.


Regards,
Navneet


On Mon, 7 Mar 2005 12:48:32 +0530, hareram <hareram@sol.net.in> wrote:
> Hi
>=20
> no iam not using pppoe
> iam using plain ethernet based connectivity to my ISP
>=20
> any other suggestions
>=20
> hare
> ----- Original Message -----
> From: "Nguyen Dinh Nam" <64vn@cardvn.net>
> To: "hareram" <hareram@sol.net.in>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Saturday, March 05, 2005 7:51 PM
> Subject: Re: yahoo mail problem
>=20
> > If you use pppoe, and your ISP blocks ICMP packets (many incompetent IS=
Ps
> > do so), you will need tp CLAMP MSS:
> > http://lists.roaringpenguin.com/pipermail/rp-pppoe/2004-August/000006.h=
tml
> >
> > hareram wrote:
> >
> >> Hi all
> >>
> >> I have iptables running with FC3
> >> I have some different problem
> >> when iam doing NAT and masq.. iam not able to check yahoo mails
> >> when i use the public IP i could able to check mails and send/receive
> >>
> >> iam doing ip masq using 1 public ip address.
> >> when i change to another public ip for 2 days iam able to check the ya=
hoo
> >> mails send/receive ok.
> >> then again start getting the same yahoo mail problem
> >>
> >> does any one face this kind of problem or any solution for this kind o=
f
> >> situation ??
> >>
> >> suggestion and some docs will be appreciated
> >>
> >> hare
> >
> >
> >
> >
>=20
>

