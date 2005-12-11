From: Erik <erikev@gmail.com>
Subject: Re: QoS with netfilter (nfcan: addressed to exclusive sender for
	this address)
Date: Sun, 11 Dec 2005 01:40:17 -0800
Message-ID: <bab495710512110140p7b2d449cm6019f8e326b697a@mail.gmail.com>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<20051210150841.GI21804@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051210150841.GI21804@salty>
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
To: nfcan.x.jimlaur@dfgh.net
Cc: netfilter@lists.netfilter.org

Thanks,
The packets are getting set properly.  I am however still getting 0x00
on the wire. Quite strange.
Questions:
1) Can the stack force this to zero somwhere else?
2) (Sidebar) How can TOS be set? I see many packets with TOS
set,(according to ipfilter -L, wire is still 0x00) but grep'ing the
'man iptables' gives no hits on TOS

This is on 2.6.12-12mdk and mandriva

On 12/10/05, Jim Laurino <nfcan.x.jimlaur@dfgh.net> wrote:
> On 2005.12.10 07:53, Erik - erikev@gmail.com wrote:
> > Am trying to add QoS to some web cam traffic on a network.
> > Also a newbie to netfilter.
> >
> ...
> >
> > Tried netfilter commands like:
> > >iptables -t mangle -A FORWARD -s 10.0.0.0/8 -j DSCP --set-dscp 1
> >
> ...
> > Furthermore, a command like
> > >iptables -L FORWARD
> >
> > list a set of rules etc but this QoS is not one of them apparently...
> >
>
> The -L command has a default table argument, filter.
> If you want to see the contents of another table,
> you have to specify the table explicitly. Try this:
>
> iptables -t mangle -L -xnv
>
> --
> Jim Laurino
> nfcan.x.jimlaur@dfgh.net
> Please reply to the list.
> Only mail from the listserver reaches this address.
>
>

