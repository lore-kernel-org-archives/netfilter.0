From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARDING and NAT chains
Date: Fri, 30 Jan 2004 12:36:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301236.31350.Antony@Soft-Solutions.co.uk>
References: <001901c3e670$a4bd2250$3d40000a@wisdom> <200401301025.17981.Antony@Soft-Solutions.co.uk> <1075465401.1860.4.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075465401.1860.4.camel@jasiiitosh.nexusmgmt.com>
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
To: netfilter@lists.netfilter.org

On Friday 30 January 2004 12:23 pm, John A. Sullivan III wrote:

> On Fri, 2004-01-30 at 05:25, Antony Stone wrote:
> >
> > Place the destination address in the nat rule, eg:
> >
> > iptables -A PREROUTING -t nat -d ! my.ip.add.ress -j DNAT --to a.b.c.d
> >
> > This means "destination nat all packets which are not addressed to
> > my.ip.add.ress and send them to a.b.c.d".
>
> This is true but she went on to state in a later e-mail that she has
> many interfaces and needs to exclude two.  That's a knarly problem I've
> run into many times with the limitation of only being able to specify a
> single address/subnet (or a contiguous range with iprange) in
> destination and source.
>
> I suggested using a RETURN target to bypass processing for the two
> excluded interfaces although I was surprised to not find RETURN in my
> man page. I hope I wasn't having a premature senior moment when I
> recalled the RETURN target! Thanks - John

Oh, okay - try using ACCEPT in the nat table to stop packets continuing to 
later rules..

RETURN is only valid for user-defined chains (I think).

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


