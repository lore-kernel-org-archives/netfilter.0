From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: "connection tracking" and "Connection state"?
Date: Tue, 1 Apr 2003 22:37:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304012237.48814.netfilter@newkirk.us>
References: <F9fFM7FJ5l7rOwSbiqW0000601a@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F9fFM7FJ5l7rOwSbiqW0000601a@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>, netfilter@lists.netfilter.org

On Tuesday 01 April 2003 08:18 pm, SB CH wrote:
> Hello, all.
>
> connection tracking(stateful inspection) has a relation with this
> menu(make config)?
>
> "Connection tracking match support"
>
> But when I deselect this menu, I can use connection tracking like
> NEW,ESTABLISHED,RELATED  etc.
> I think that only "Connection state match support" menu is required to
> use this function.
>
> then what is the function and meaning of the "Connection tracking
> match support"?

As I just found out (Thanks Martin Josefsson!) there is available a=20
conntrack match.  It lets you match more than the three conntrack states=20
you mentioned - you can match conntrack status like ASSURED, SEEN_REPLY,=20
etc, as well as 'states' SNAT and DNAT (matches packets which have been=20
SNATted or DNATted) and also match the original pre-SNAT/pre-DNAT IPs.

http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.ht=
ml#ss3.3

j


