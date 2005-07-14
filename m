From: liyas_m m <liyasmm@gmail.com>
Subject: Re: firewall ignore the rule
Date: Thu, 14 Jul 2005 10:19:19 +0800
Message-ID: <2452665f0507131919823198c@mail.gmail.com>
References: <2452665f0507130352544ab556@mail.gmail.com>
	<1121252895.11584.6.camel@anduril.intranet.cartel-securite.net>
	<2452665f05071318551f788f42@mail.gmail.com>
	<20050714020155.GA26028@bender.817west.com>
	<2452665f0507131910300b00de@mail.gmail.com>
	<20050714021032.GA26090@bender.817west.com>
Reply-To: liyas_m m <liyasmm@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050714021032.GA26090@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

u mean blocking the MAC address also doesnot do any good. hmm i
thought iptables is that powerful.

On 7/14/05, Jason Opperisano <opie@817west.com> wrote:
> On Thu, Jul 14, 2005 at 10:10:30AM +0800, liyas_m m wrote:
> > so how do i block that source from transmitting/broadcasting packet?
>=20
> use something that operates at layer 2.  arptables and ebtables come to
> mind.
>=20
> -j
>=20
> --
> "Stewie: What the hell is this?
>  Lois: Stewie that's tuna salad.
>  Stewie: Really? I could have sworn it was cat food."
>         --Family Guy
>=20
>

