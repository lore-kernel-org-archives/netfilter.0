From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: are the four packet "states" all-encompassing?
Date: Thu, 24 Oct 2002 09:29:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210240928360.32101-100000@localhost.localdomain>
References: <1035460692.18292.13.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035460692.18292.13.camel@elendil>
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

> Le jeu 24/10/2002 =E0 13:37, Robert P. J. Day a =E9crit :
> >   are the four conntrack states NEW, ESTABLISHED, RELATED and
> > INVALID all-encompassing?  that is, does every single packet
> > fall into one and only one of these states?
> =

> Yes.
> One very packet can have one state, and one.

so every syntactically correct ("well-formed"??) packet is one
of NEW, ESTABLISHED or RELATED, while all others are just
INVALID?  ok, i can accept that, thanks.

rday


