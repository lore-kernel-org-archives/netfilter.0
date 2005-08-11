From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 11 Aug 2005 11:06:58 -0400
Message-ID: <65aa6af90508110806ea3380e@mail.gmail.com>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<65aa6af905072107096e1d6d06@mail.gmail.com>
	<65aa6af9050810083761c164a8@mail.gmail.com>
	<200508101511.50410.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508101511.50410.rob0@gmx.co.uk>
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

I know the routing decision has been made.... but I thought there
could be a second routing decision... just like OUTPUT (there will be
a second routing decision if some properties from the packet were
mangled... or natted).

On 8/10/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> [ top-posting fixed ]
> On Wednesday 2005-August-10 10:37, Edmundo Carmona wrote:
> > On 7/21/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> > > > But for the record: for locally generated packets the routing
> > > > engine is called after OUTPUT only if source address, destination
> > > > address, nfmark field or tos of the skbuff changed. So it's not
> > > > called blindly for every packet.
>=20
> > Sorry to reply on an old thread.. but I think it's a good point to
> > start my next questions. Does the same policy stand on FORWARD? There
> > will be another routing decision if source address, destination
> > address, nfmark field or tos of the skbuff changed???
>=20
> Of which FORWARD are you asking, filter or mangle? In either case I
> think the routing decision has already been made. In neither case
> (TTBOMK; I don't know much about mangle) can you change source and
> destination IP addresses. Why would there be another routing decision?
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>=20
>

