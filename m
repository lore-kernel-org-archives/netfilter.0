From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 19:15:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312091915.49683.Antony@Soft-Solutions.co.uk>
References: <20031209190402.GA16255@fobie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209190402.GA16255@fobie.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 09 December 2003 7:04 pm, =D6rjan Persson wrote:

> Hello,
>
> I would like to redirect incoming traffic on host1:33 to host2:44!
>
> Tried to find information about this for a day now but all I come up
> with is the DNAT/SNAT solution. The problem with this is when the final
> packet arrives at the host2 it thinks that host1 sends them.
>
> Is there a way to keep the senders IP?

If both the real source IP and the real destination IP exist on the same=20
interface (directly, or some distance away) of the machine running netfil=
ter,=20
then no, you cannot translate the destination address without altering th=
e=20
source address as well.

The reason is simple:

If you translate only the destination address, then reply packets go dire=
ct=20
from destination back to source without going back through the reverse na=
t,=20
therefore the reply comes back from a different address (the real one) th=
an=20
the original request was sent to.

Only if you also translate the source address do the reply packets come b=
ack=20
through netfilter, allowing the reverse translation to occur, keeping bot=
h=20
ends of the link happy about what IP they're talking to.

If it is not true that the real source IP and the real destination IP exi=
st on=20
the same interface of the netfilter machine, repost your query with a bit=
=20
more detail and we may be able to help futher.

Antony.

--=20
The difference between theory and practice is that in theory there is no=20
difference, whereas in practice there is.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


