From: Cory Visi <merlin@phear.lwz.org>
Subject: Re: Static compile issues
Date: Wed, 28 May 2003 17:11:42 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0305281709290.30704-100000@phear.lwz.org>
References: <1054158893.21086.62.camel@dejawu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054158893.21086.62.camel@dejawu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

When I compile the kernel statically and enable IP Tables support,
ipchains compatibilty is becomes no longer available. I have the Invalid
Argument problem with the static kernel.

When I compile the kernel with module support, I do _not_ enable
the ipchains compatibility module.

Should I try enabling this? Obviously, I cannot insert it when the IP
tables module is loaded. Also, this doesn't help my situation with the
static kernel.

Thanks,
Cory

On 28 May 2003, Esteban wrote:

> did you enable the ipchains cmpatibility module?
> (i think is the last one one the netfiler menu con make menuconfig)
>
> good luck
>
> On Wed, 2003-05-28 at 17:09, Cory Visi wrote:
> > I am using a 2.4.20 kernel with pom-20030107 and iptables v1.2.7a. From
> > pom-20030107, I have installed all the pending patches and all the base
> > patches. In addition, I have installed the following extra patches:
> >
> > amanda-conntrack-nat.patch
> > eggdrop-conntrack.patch
> > ip_tables-proc.patch
> > mms-conntrack-nat.patch
> > pptp-conntrack-nat.patch
> > quake3-conntrack.patch
> > rsh.patch
> > tftp-conntrack-nat.patch
> >
> > The problem is, when I compile the kernel statically and enable all the
> > iptables options, I cannot do NAT. Any iptables line that specifies a
> > chain in the nat table causes an Invalid Argument:
> >
> > # iptables -t nat -A POSTROUTING -o $EXTERNAL -s $INTERNAL_NETWORK -j SNAT --to-source $EXTERNAL_IP
> > Invalid argument
> >
> > Another interesting thing to point out, is that I also compiled this
> > kernel with modules and experienced the same problem. I was, however, able
> > to fix it by disabling the IPv4 netfilter option for "NAT of local
> > connections". For the module kernel, disabling this option fixes the
> > problem. For the staticly compiled kernel, disabling this option has no
> > effect-- the error persists.
> >
> > Anyone have any ideas?
> > Please CC me directly if you respond to the list, since I am not
> > subscribed (yet).
> >
> > Thank you,
> > Cory Visi
> >
> >
> >
>
>
>


