From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: next topic:  --limit and --burst-limit
Date: Thu, 31 Oct 2002 09:27:09 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210310917480.30950-100000@localhost.localdomain>
References: <1036073063.21852.34.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036073063.21852.34.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter mailing list <netfilter@lists.netfilter.org>

On 31 Oct 2002, Cedric Blancher wrote:

> Le jeu 31/10/2002 =E0 13:15, Robert P. J. Day a =E9crit :
> > example:
> > 	limit: 3/hour
> > 	burst: 5
> > =

> > what does this mean?  it means that i start with a bucket of 5 tokens=

> > and, every time a matching packet comes in, i can accept it by paying=

> > a token.  simple as that.    when i run out of tokens, i can't accept=

> > any more packets until i get more tokens.
> =

> That's it. It another interesting point of vue ;)
>  =

> > and with a limit of 3/hour, every 20 minutes, i get another token dro=
pped
> > into my bucket, up to a maximum of my burst value of 5, so that i can=
 =

> > accept more packets.  that's it.  is it really that simple?
> =

> You begin with 8 tokens and that's you maximum number of tokens. 5 for
> the burst (lower part of my bucket), and 3 that are time dependant
> (upper part of the bucket).
> Each time you receive a packet, you pay it with a token, so you can pay=

> for 8 packets within the first _hour_. Then, at the end of this first
> hour, you will get three more tokens up to 8 tokens.
> =

> I can be wrong, but that's what I understood from the HOWTO, as for 1/s=

> limit with burst of 5, you first accept 6 packets.

ok, you and i still have a fundamental disagreement, but it can be
cleared up pretty quickly.  (sadly, the graphical example in the
HOWTO at www.netfilter.org doesn't use numbers that would distinguish
between your view and mine.  bummer.)

let's go with my analogy of an initial bucket of tokens, with which
you have to pay a token to accept a packet.

Example:
	limit: 3/hour
	burst: 5

so, here are the simple questions that will settle this once and
for all:

1)  how many packets can i accept in an initial burst if they just
    come flooding in?  i assumed 5, you contend 8.  (IOW, i assumed
    that i have just 5 tokens to start with, you seem to think that
    it's 5 + 3 =3D 8.  so which is it?

2) regardless of the traffic, how frequently and by how much does my
   token bucket get refilled?  it could be adding 3 every hour, or
   it could be more uniform and be adding an extra token every
   20 minutes.  (the latter would produce a more uniform packet
   acceptance behavior.  the average would, of course, turn out to
   be the same, but the distribution would look different.)

so answering these two questions would pretty much settle the issue,
right?

rday
 =



