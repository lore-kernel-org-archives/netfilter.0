From: Duncan Sands <baldrick@free.fr>
Subject: Re: masquerade_check: size 24 != 20
Date: Sat, 4 Oct 2003 15:18:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310041518.26254.baldrick@free.fr>
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

OK, it was a gentoo problem: they patched ip_conntrack_tuple.h
and changed it from:

union ip_conntrack_manip_proto
{
        /* Add other protocols here. */
        u_int16_t all;

        struct {
                u_int16_t port;
        } tcp;
        struct {
                u_int16_t port;
        } udp;
        struct {
                u_int16_t id;
        } icmp;
};

to

union ip_conntrack_manip_proto
{
        /* Add other protocols here. */
        u_int32_t all;

        struct {
                u_int16_t port;
        } tcp;
        struct {
                u_int16_t port;
        } udp;
        struct {
                u_int16_t id;
        } icmp;
        struct {
                u_int32_t key;
        } gre;
};

i.e. two bytes bigger.  Since ip_nat_multi_range includes an
ip_nat_range, and ip_nat_range uses two ip_conntrack_manip_proto,
this led to a size increase of 4 bytes.  The gentoo iptables is compiled
using the gentoo kernel headers, so it is using this larger structure,
and thus doesn't work with vanilla kernels.

Sorry to have wasted your time,

Duncan.

