From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: intermittent and unreliable behaviour with iptables scripts
Date: Wed, 13 Nov 2002 15:21:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211131521.21313.netfilter@newkirk.us>
References: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com> <1037200566.4557.37.camel@rayw.knowledgefactory.co.za>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037200566.4557.37.camel@rayw.knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wednesday 13 November 2002 10:16 am, Raymond Leach wrote:
> On Wed, 2002-11-13 at 16:34, Doug Watson wrote:
> > what does the (policy ACCEPT 4 packets, 284 bytes) mean?
> > Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)
>
> It means that the default policy for the OUTPUT chain is to accept
> packets and that there have been 4 packets totalling 284 bytes tested
> against this chain.

Actually, this tells us that 4 packets totalling 284 bytes made it throug=
h the=20
output chain rules and were ACCEPTED by policy rather than a rule.  If an=
=20
earlier rule in the chain led to an ACCEPT or a DROP or RETURN then it wi=
ll=20
NOT be counted here, but only in the rule(s) it matched.

> > Is that the total number of packets to traverse the OUTPUT
> > chain or it he number of packets ACCEPTED by the policy for the
> > OUTPUT chain? Or something else?
>
> As above ...

j

