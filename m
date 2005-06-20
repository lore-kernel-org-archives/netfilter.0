From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 11:01:25 -0500
Message-ID: <49bf7d70506200901529c6726@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<Pine.LNX.4.61.0506201747250.4249@yvahk01.tjqt.qr>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506201747250.4249@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

hello;

reply below.

On 6/20/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>=20
> >at the 2nd lines of defenses the following is seen:
> >
> >date and time is utc.
> >
> >2005-06-18 08:20:38.310864 IP 200.221.11.147.29937 >
> >204.238.34.206.25: R 0:0(0) win 0
>=20
> This looks to me like tcpdump output. As far as I understand, the "listen=
er"
> (used by iptraf, tcpdump, etc.) listens before iptables does it works, so=
 you
> always see packets. - even those which are to be DROPed.
>

the tcpdump capture is on the mail server, 204.238.34.206 and *_not_* on
the firewall, 204.238.34.232.

>=20
> Take a client connected to eth2 and listen on the eth2 bus. There should =
not
> be anything.
>

the tcpdump output is on the mail server, 204.238.34.206.
those packets are being seen on the internal network.
i agree there should not be any 200.0.0.0/8 packets on the internal network
but there are. therefore, iptables is leaking.

>=20
> >2005-06-18 08:35:33.035504 IP 200.221.11.147.9618 > 204.238.34.206.25:
> >R 3184482893:3184482893(0) win 64240
> >2005-06-18 09:12:47.772699 IP 200.221.11.147.37399 >
> >204.238.34.206.25: R 0:0(0) win 0
>=20
>=20
> Jan Engelhardt
>

--=20
terry l. ridder ><>

