From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd packet based logging with CT info
Date: Thu, 19 Aug 2021 12:16:28 +0200
Message-ID: <20210819101628.GA2036@salvia>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia>
 <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia>
 <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia>
 <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Aug 18, 2021 at 10:06:40PM +0200, Blažej Krajňák wrote:
> I'm really confused from searching a bug.
> 
> Getting nf_conntrack via nflog_nlmsg_parse(ph, attrs); is (I think)
> bad because ph parameter must be nlmsghdr not nfulnl_msg_packet_hdr

Right, nflog_nlmsg_parse() should take the nlh parameter.

> So different way. I added new getters to libnetfilter_log.c:
> 
> struct nf_conntrack *nflog_get_ct(struct nflog_data *nfad)
> {
>     return nfnl_get_pointer_to_data(nfad->nfa, NFULA_CT, struct nf_conntrack);
> }

This will not work (as you noticed). The kernel does not store a
struct in the NFULA_CT attribute.

Better to stick to use nflog_nlmsg_parser(), my suggestion is:

#1 msg_cb() provides struct nfgenmsg *nfmsg, you could retrieve the nlmsg
   from there since the nlmsghdr comes before nfgenmsg:

        struct nlmsghdr *nlh;

        nlh = (struct nlmsghdr *)((void *)nfg - sizeof(*nlh));

        err = nflog_nlmsg_parse(nlh, attrs);
        if (err < 0)
                ... error path

#2 once you have access to attrs[NFULA_CT], from there on:

        struct nf_conntrack *ct;

        ct = nfct_new();
        if (!ct)
                ... error path

        err = nfct_nlmsg_parse(nlh, ct);
        if (err < 0)
                ... error path

Then, you get the pointer to conntrack object.
