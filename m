From: "mud dog" <muddogxp@gmail.com>
Subject: Re: NF_STOLEN reinsertion
Date: Wed, 1 Mar 2006 16:31:54 +0800
Message-ID: <24dc5ae90603010031l1072736ax@mail.gmail.com>
References: <3f0dd8f80602281818p5b2f16ffpbb0e26b3832906c2@mail.gmail.com>
	<24dc5ae90602282131x1476797aq@mail.gmail.com>
	<3f0dd8f80603010009u71526bc7pe3df35db2dcb9559@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3f0dd8f80603010009u71526bc7pe3df35db2dcb9559@mail.gmail.com>
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
To: chubble@cs.ucsd.edu
Cc: netfilter@lists.netfilter.org

It depends on your kernel version.
Search your kernel codes with NF_HOOK and NF_IP_PRE_ROUTING to find.

2006/3/1, Calvin Hubble <calvin.hubble@gmail.com>:
> Where is the list of oknf functions I can choose from?
>
>
> On 2/28/06, mud dog <muddogxp@gmail.com> wrote:
> > call NF_HOOK_THRESH(), choise the correct oknf() function,
> > to finish the following hook.
> >
> > 2006/3/1, Calvin Hubble <calvin.hubble@gmail.com>:
> > > I have yet to find any resource that answers this question.  If I hav=
e
> > > a kernel module that registers a callback with netfilter and steals a
> > > packet during the NF_IP_PRE_ROUTING stage, How can I re-insert this
> > > packet on the network stack, (before the ip routing stage) so it is
> > > forwarded back out on the correct device?
> > >
> > > Thanks
> > >
> > >
> >
>

