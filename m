From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 02:21:43 -0500
Message-ID: <49bf7d70506210021181593cc@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.58.0506210901510.3630@blackhole.kfki.hu>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0506210901510.3630@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

hello;

reply below.

On 6/21/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Mon, 20 Jun 2005, terry l. ridder wrote:
>=20
> > while i have reservations concerning posting the output of iptables-sav=
e
> > i have placed it on my web server:
> >
> > http://204.238.34.206/iptables-save-20jun2005.txt
>=20
> Thou salt not filter in the nat table.
>

there is no good reason not to filter in the nat table.
=20
>
> It's in the documentation and was also countless times were written to th=
e
> list: only the first packet of every connection traverses the nat table.
>

there is no connection if the packet is dropped in the nat table.

>=20
> Best regards,
> Jozsef
>

--=20
terry l. ridder ><>

