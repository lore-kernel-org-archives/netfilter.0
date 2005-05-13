From: Joubert Berger <joubertb@gmail.com>
Subject: Re: When do iptables take effect when using iptables-restore
Date: Fri, 13 May 2005 15:22:14 -0400
Message-ID: <63d3731e05051312223ac9968@mail.gmail.com>
References: <63d3731e0505130835640d8da0@mail.gmail.com>
	<1115999933.4561.59.camel@ngeza>
Reply-To: joubert@berger-family.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115999933.4561.59.camel@ngeza>
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

On 5/13/05, Rakotomandimby (R12y) Mihamina
<mihamina.rakotomandimby@etu.univ-orleans.fr> wrote:
>=20
> > I now want to update them, so I edit my file and then run
> > iptables-restore to load the new rules.
>=20
> Why wouldn't you deal with a shell script to do so?
> With a shell script you would exactly know what rules are applied at a
> moment.
>=20

It is done in a shell script :-)

> > During all this iptables is applying policy on packets.  So, what
> > happens between the time I start running iptables-restore and when it
> > finishes it?
>=20
> If you update your rules, one thing you will have to do is to flush,
> anyway. If you dont, you'd append your updates to the existent rules. So
> once you flushed, I think your "reore" file is read line by line and the
> rules are applied as well as it is read.
>=20

If I was executing individual iptables commands, I understand what the
impact is.  Once I flush the tables there would be no rules there.=20
Then, as I add each policy, I would know that the policy changes as I
add each rule one at a time.

But I am not sure how iptables-restore works.  From what I have read,
it is considered an atomic action.  But, what does that mean?  Build
the entire rules in kernel memory and then at the end hook this into
the iptables search mechanism?  Or does it clear the table, then adds
each rule one at the time at the same time it is also evaluating
packets coming in.  Another way of asking it might be, is the atomic
operation at the iptables-restore level or at the kernel level?  Not
sure if I am explaining what I am looking after :-)

--joubert

