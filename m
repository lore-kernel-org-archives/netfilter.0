From: bright true <brighttrue@gmail.com>
Subject: Re: (no subject)
Date: Sat, 21 May 2005 14:01:51 -0400
Message-ID: <3b29fb79050521110142904b5@mail.gmail.com>
References: <3b29fb79050520200817e1e315@mail.gmail.com>
	<20050521181637.GA1564@bender.817west.com>
	<3b29fb7905052022187076b17d@mail.gmail.com>
	<20050521193152.GA1769@bender.817west.com>
Reply-To: bright true <brighttrue@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050521193152.GA1769@bender.817west.com>
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

Hello ,=20

i want to ask you , i there any way to accomplish the whole thing with out=
=20
the need of re-compiling the Kernel=20

and iptables actually i've a VPS and i don't have my own server and can't=
=20
compile the Kernel for one VPS only=20

Thanks alot=20
Bye

On 5/21/05, Jason Opperisano <opie@817west.com> wrote:
>=20
> On Sat, May 21, 2005 at 01:18:15AM -0400, bright true wrote:
> > Hello ,
> >
> > Thanks for your reply , but can you give me the link of the patch i hav=
e=20
> to
> > apply
>=20
> grab the latest snapshot of PoM available from:
>=20
> http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/
>=20
> for example:
>=20
>=20
> http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-2=
0050520.tar.bz2
>=20
> you need to have both the source of your running kernel available and
> the source of your iptables version available and following the
> instructions in the PoM README file. basic recipe:
>=20
> - apply patches from PoM
> - recompile kernel
> - recompile iptables
> - reboot & enjoy
>=20
> -j
>=20
> --
> "Brian: Excuse me, would you like to taste my smoked meat log?"
> --Family Guy
>=20
>
