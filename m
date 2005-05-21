From: bright true <brighttrue@gmail.com>
Subject: Re: (no subject)
Date: Sat, 21 May 2005 01:18:15 -0400
Message-ID: <3b29fb7905052022187076b17d@mail.gmail.com>
References: <3b29fb79050520200817e1e315@mail.gmail.com>
	<20050521181637.GA1564@bender.817west.com>
Reply-To: bright true <brighttrue@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050521181637.GA1564@bender.817west.com>
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

Thanks for your reply , but can you give me the link of the patch i have to=
=20
apply=20

Thank You

On 5/21/05, Jason Opperisano <opie@817west.com> wrote:
>=20
> On Sat, May 21, 2005 at 06:08:59AM +0300, bright true wrote:
> > Hello ,
> > How can i set the Max number of allowed tcp connections from the same i=
p
> > address ???
> > if the current ip has more than the allowed number of connections the
> > server will drop or reject the new connections
> > untill it gets an empty space to connect
> > if there's any rule i can set for this (please provide me with the way=
=20
> to
> > remove the rule also)
>=20
> the way to do this correctly is to apply the connlimit patch from PoM,
> and use a rule like (using SMTP as an example and 4 conns):
>=20
> iptables -A [INPUT|FORWARD] -p tcp --syn --dport 25 \
> -m connlimit --connlimit-above 4 -j REJECT
>=20
> this will result in any individual IP being allowed to make up to 4
> simultaneous connections.
>=20
> you delete rules by replacing the '-A' with a '-D'
>=20
> -j
>=20
> --
> "Peter: Brothers and sisters fighting is as natural as a white mans
> dialog in a Spike Lee movie."
> --Family Guy
>=20
>
