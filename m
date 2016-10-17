From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Mon, 17 Oct 2016 22:27:12 +0200
Message-ID: <20161017202712.GA8529@salvia>
References: <8737l9mu0c.fsf@ilexius.de>
 <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de

On Mon, Oct 17, 2016 at 10:17:28PM +0200, Noel Kuntze wrote:
> On 17.10.2016 22:11, Pablo Neira Ayuso wrote:
> > On Mon, Oct 17, 2016 at 09:52:06PM +0200, Noel Kuntze wrote:
> >> > On 17.10.2016 21:44, Pablo Neira Ayuso wrote:
> >>> > > On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
> >>>>> > >> > Hi,
> >>>>> > >> > 
> >>>>> > >> > I have two hosts with public ip addresses running Ubuntu 16.04 with
> >>>>> > >> > Kernel version 4.4.0.
> >>>>> > >> > 
> >>>>> > >> > I want to interconnect two containers (systemd-nspawn) with veth
> >>>>> > >> > interfaces running on these hosts in a server client setup.
> >>>>> > >> > 
> >>>>> > >> > So on the first host, where the server in the container runs I have
> >>>>> > >> > the following rules:
> >>>>> > >> > # nft list ruleset
> >>>>> > >> > table ip nat {
> >>>>> > >> >   chain prerouting {
> >>>>> > >> >     type nat hook prerouting priority 0; policy accept;
> >>>>> > >> >     tcp dport { 4506, 4505} dnat 10.0.0.2 
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain output {
> >>>>> > >> >     type nat hook output priority 0; policy accept;
> >>>>> > >> >     tcp dport { 4505, 4506} dnat 10.0.0.2
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain input {
> >>>>> > >> >     type nat hook input priority 0; policy accept;
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain postrouting {
> >>>>> > >> >     type nat hook postrouting priority 0; policy accept;
> >>>>> > >> >     ip saddr 10.0.0.0/8 oif enp4s0 masquerade 
> >>>>> > >> >   }
> >>>>> > >> > }
> >>>>> > >> > 
> >>>>> > >> > On the second host, where the client runs i have the following:
> >>>>> > >> > # nft list ruleset
> >>>>> > >> > table ip nat {
> >>>>> > >> >   chain prerouting {
> >>>>> > >> >     type nat hook prerouting priority 0; policy accept;
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain output {
> >>>>> > >> >     type nat hook output priority 0; policy accept;
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain input {
> >>>>> > >> >     type nat hook input priority 0; policy accept;
> >>>>> > >> >   }
> >>>>> > >> > 
> >>>>> > >> >   chain postrouting {
> >>>>> > >> >     type nat hook postrouting priority 0; policy accept;
> >>>>> > >> >     ip saddr 10.0.0.0/8 oif enp0s31f6 masquerade 
> >>>>> > >> >   }
> >>>>> > >> > }
> >>>>> > >> > 
> >>>>> > >> > This works as expected and without any problems at all. Now IPSec
> >>>>> > >> > enters the picture. As soon as I setup a policy to encrypt everyting
> >>>>> > >> > between the two hosts the following happens:
> >>>>> > >> > + I can still connect from the second host to the server in the
> >>>>> > >> >   container without problems,
> >>>>> > >> > + I can still /connect/ (i.e. establish a connection) from the
> >>>>> > >> >   container on the second host to the server on the first host, but
> >>>>> > >> > + in tcpdump listening on the interface of the container (on the
> >>>>> > >> >   second host) I see lots of TCP Retransmissions and the TCP connection
> >>>>> > >> >   is effectively broken.
> >>>>> > >> > 
> >>>>> > >> > Can someone give me a hint what is going on here?
> >>> > > Did you find the root cause for this problem?
> >>> > > --
> >>> > > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >>> > > the body of a message to majordomo@vger.kernel.org
> >>> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>> > > 
> >> > 
> >> > Probably missing TCP MTU clamping. Normal problem.
> >> > Can happen with broken PMTUD.
> >> > 
> >> > We also need the policy match module to support ipsec in nftables.
> >> > Is that on the TODO list?
> >
> > I know Florian Westphal made a simple extension, he's got a patch in
> > his queue. Trimming off most of it, just leaving this small chunk:
> > 
> > diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
> > index 6c1e024..76b70e1 100644
> > --- a/net/netfilter/nft_meta.c
> > +++ b/net/netfilter/nft_meta.c
> > @@ -190,6 +190,9 @@ void nft_meta_get_eval(const struct nft_expr
> > *expr,
> >                 *dest = prandom_u32_state(state);
> >                 break;
> >         }
> > +       case NFT_META_SECPATH:
> > +               *(__u8 *)dest = secpath_exists(skb);
> > +               break;
> >         default:
> >                 WARN_ON(1);
> >                 goto err;
> > 
> > Would this be enough for your usecase?
> 
> No, the problem is that in nftables, we can't tell apart ipsec
> protected packets from unprotected ones. But we need that, because
> generally, we want to treat them differently.  In iptables we can do
> that with -m policy [additional args], but there's nothing like that
> in nftables.  We need complete support for all the options of the
> policy match module in nftables.

Are you using *all* options there? I'd appreciate if you can develop a
bit the usecases where you use these different options.

> I don't see what that three line patch actually does. Would you
> kindly elaborate?

Allowing to match if the packet is protected/unprotected in a
true/false fashion.

Thanks.
