From: Duncan Sands <duncan.sands@math.u-psud.fr>
Subject: Re: masquerade_check: size 24 != 20
Date: Sat, 4 Oct 2003 11:07:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310041107.59838.duncan.sands@math.u-psud.fr>
References: <200310031446.18321.duncan.sands@math.u-psud.fr> <1065201775.27885.4.camel@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065201775.27885.4.camel@wookie.shorewall.net>
Content-Disposition: inline
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
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@lists.netfilter.org

On Friday 03 October 2003 19:22, Tom Eastep wrote:
> On Fri, 2003-10-03 at 05:46, Duncan Sands wrote:
> > translate_table: size 1112
> > Finished chain 0
> > Finished chain 3
> > Finished chain 4
> > find_inlist: loading `ipt_MASQUERADE'.
> > masquerade_check: size 24 != 20.
> > ip_tables: check failed for `MASQUERADE'.
> >
> > The check in question is:
> >
> >         if (targinfosize != IPT_ALIGN(sizeof(*mr))) {
> >                 DEBUGP("masquerade_check: size %u != %u.\n",
> >                        targinfosize, sizeof(*mr));
> >                 return 0;
> >         }
>
> Are you applying any updates from Patch-O-Matic?

No.  What's that?

Duncan.

