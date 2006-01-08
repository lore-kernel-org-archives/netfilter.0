From: syrius.ml@no-log.org
Subject: Re: IPv6 stateful in kernel 2.6.15 & nf_conntrack ?
Date: Sun, 08 Jan 2006 17:05:15 +0100
Message-ID: <87fynyu399.87ek3iu399@87d5j2u399.message.id>
References: <43BC2ACD.6070904@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43BC2ACD.6070904@gmx.de> (Malte =?iso-8859-15?Q?Schr=F6der's?=
	message of "Wed, 04 Jan 2006 21:06:37 +0100")
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
Content-Type: text/plain; charset="iso-8859-1"
To: Malte =?iso-8859-15?Q?Schr=F6der?= <MalteSch@gmx.de>
Cc: netfilter@lists.netfilter.org

Malte Schr=F6der <MalteSch@gmx.de> writes:

> Hello,
> I am trying to figure out how to do ipv6 stateful inspection with the
> new kernel 2.6.15. Currently I am using the patch from USAGI for 2.6.14
> but they seem to have dropped the state-match in their patch for 2.6.15.
>
> Is there stateful inspection in 2.6.15 for ipv6 (there is connection
> tracking ...) and how could I use it?

It seems some progress have been made. I'm also looking forward to
test those new features.
I read x_tables has be pushed to linus' tree, but i don't know
how/where to get it.

any advice ?

--=20

