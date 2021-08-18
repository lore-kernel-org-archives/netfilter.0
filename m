From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd packet based logging with CT info
Date: Wed, 18 Aug 2021 13:52:28 +0200
Message-ID: <20210818115228.GA9294@salvia>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia>
 <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia>
 <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Blažej,

On Wed, Aug 18, 2021 at 12:06:40PM +0200, Blažej Krajňák wrote:
> st 18. 8. 2021 o 9:23 Pablo Neira Ayuso <pablo@netfilter.org> napísal(a):
> > You need this kernel patch to add this information to nfnetlink_queue,
> > compile-tested only.
> 
> Hey Pablo,
> patch is working like a charm. Thank you! Now I see timestamps and
> packets/bytes counters in JSON output correctly.
> At the end I will post customized input plugin for everyone.
> 
> The last thing I want to ask is what's correct way to get
> 
> attrs[NFULA_CT]
> 
> from
> 
> struct nfulnl_msg_packet_hdr *ph = nflog_get_msg_packet_hdr(ldata);
> 
> 
> Now I use the following code which is working but throwing random
> errors "something went wrong (Numerical result out of range)" I'm
> mixing struct nfulnl_msg_packet_hdr with const struct nlmsghdr *nlh

That might be a bug in nflog_nlmsg_parse(): maybe
nflog_parse_attr_cb() is finding a mismatch in the datatype of the
attribute payload.

Could you have a look at what attribute is hitting this error?

> struct nfulnl_msg_packet_hdr *ph = nflog_get_msg_packet_hdr(ldata);
> struct nlattr *attrs[NFULA_MAX + 1] = { NULL };
> int retb;
> 
> retb = nflog_nlmsg_parse(ph, attrs);
> if (retb != MNL_CB_OK) {
>     printf("something went wrong");
>     printf(" (%s)\n", strerror(errno));
>     return retb;
> }
