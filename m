From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: are the four packet "states" all-encompassing?
Date: Thu, 24 Oct 2002 09:58:51 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210240958110.32289-100000@localhost.localdomain>
References: <1035467865.16954.27.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035467865.16954.27.camel@elendil>
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

On 24 Oct 2002, Cedric Blancher wrote:

> Le jeu 24/10/2002 =E0 15:29, Robert P. J. Day a =E9crit :
> > On 24 Oct 2002, Cedric Blancher wrote:
> > > One very packet can have one state, and one. =

> > so every syntactically correct ("well-formed"??) packet is one
> > of NEW, ESTABLISHED or RELATED, while all others are just
> > INVALID?  ok, i can accept that, thanks.
> =

> Yes and no, it is a bit more complicated...
> =

> INVALID applies to all packets for which ip_conntrack is not able to
> give a state. As common examples :
> =

> 	. TCP packets that does not complies to RFC 793
> 	. ICMP errors non related to existing flows
> 	. lack of memory or conntrack table full
> =

> So, well formed packets can sometimes fall into INVALID state, but it i=
s
> safe to DROP them.

ok, gotcha.  but none of that changes the assertion that each and
every packet will fall into one, and only one, of these four
states.  thanks.

rday


