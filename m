From: Florian Westphal <fw@strlen.de>
Subject: Re: Netfilter hook doesn't see all packets
Date: Thu, 21 Nov 2019 21:36:24 +0100
Message-ID: <20191121203624.GK20235@breakpoint.cc>
References: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com>
 <CAFqmWq_Ha3ces2AAnU_s-Dzbxv7g-pGE4ikg-+HGGq-WNX=gow@mail.gmail.com>
 <5DD6D297.8010609@gmail.com>
 <CAFqmWq_FNTL4p1i=Ur7V2vbjv=KUOer5Ar+J4owoNbpO_KBCOg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqmWq_FNTL4p1i=Ur7V2vbjv=KUOer5Ar+J4owoNbpO_KBCOg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy rambo <psyspy2020@gmail.com>
Cc: Gordon Fisher <gordfisherman@gmail.com>, netfilter@vger.kernel.org

Psyspy rambo <psyspy2020@gmail.com> wrote:
> > >      udp_header = (struct udphdr *)skb_transport_header(skb);
> > >      sip = (unsigned int)ntohl(ip_header->saddr);
> > >      dip = (unsigned int)ntohl(ip_header->daddr);

This doesn't work reliably in netfilter hooks.

See skb_header_pointer() usage in other nf modules.
