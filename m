From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: rc.local
Date: Thu, 28 Jul 2005 09:31:46 +0400
Message-ID: <9927912d0507272231571653e7@mail.gmail.com>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d0507260430275d8239@mail.gmail.com>
	<5d2f379105072608385caaee15@mail.gmail.com>
	<9927912d050726221615fe208f@mail.gmail.com>
	<5d2f37910507270942577f9173@mail.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507270942577f9173@mail.gmail.com>
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
To: "curby ." <curby.public@gmail.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

On 7/27/05, curby . <curby.public@gmail.com> wrote:
> On 7/26/05, Visham Ramsurrun <vishamr2000@gmail.com> wrote:
> > you are right..i'm having a scripting problem..i don't know how to
> > make a script execute every time a packet is sent by my PC. how can i
> > do that?
>=20
> You don't want to execute a script for each packet... you could be
> easily DoSed. Try:
>=20
> http://netfilter.org/patch-o-matic/pom-base.html#pom-base-nth
>=20
> Please reply to the list, so everyone can help and learn. =3D)
>=20

No I only want to execute a script for all packets that are packets
that are going to be sent out of the NIC (after the packets have been
accepted as valid by a firewall). I don't know how to do that. Do you
know what is the last function in the iptables code or the first
function in the NIC driver, that a packet that has been accepted by
the firewall passes before it is sent on the wire? I would then write
some code so that when a call is made to that function, a signal is
raised and it will cause a shell script to execute.
I don't know abt the DoSed command. Do you have any example?

If there is an easier way, please let me know...

MAny thx for the reply.

Warm regards,
Visham

