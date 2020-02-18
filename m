From: Florian Westphal <fw@strlen.de>
Subject: Re: NFQUEUE/iptables and kernel warning messages for
 net/ipv4/tcp_output.c
Date: Tue, 18 Feb 2020 14:21:07 +0100
Message-ID: <20200218132107.GK19559@breakpoint.cc>
References: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
 <20200218123958.GJ19559@breakpoint.cc>
 <CABLYT9j6a+QT=7BdeSbJY2AnbHhKz72OQTJ8x5nL6_4TBeZT3Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABLYT9j6a+QT=7BdeSbJY2AnbHhKz72OQTJ8x5nL6_4TBeZT3Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vieri Di Paola <vieridipaola@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Vieri Di Paola <vieridipaola@gmail.com> wrote:
> On Tue, Feb 18, 2020 at 1:39 PM Florian Westphal <fw@strlen.de> wrote:
> >
> > get this patch working (untested)
> 
> > +static uint32_t nfq_get_pktinfo(struct nfq_data *nfad)
> > +{
> > +        return ntohl(nfnl_get_data(nfad->data, NFQA_SKB_INFO, uint32_t));
> 
> I applied the patch, but I get this compilation error:
> 
> In file included from suricata-common.h:180,
>                  from source-nfq.c:28:
> source-nfq.c: In function 'nfq_get_pktinfo':
> source-nfq.c:404:48: error: 'NFQA_SKB_INFO' undeclared (first use in
> this function)
>   404 |         return ntohl(nfnl_get_data(nfad->data, NFQA_SKB_INFO,
> uint32_t));
>       |                                                ^~~~~~~~~~~~~

This means your kernel headers are older than 3.10.
It should be part of /usr/include/linux/netfilter/nfnetlink_queue.h .


You can substitute 14 instead, or add

#define NFQA_SKB_INFO 14

> I'll post to the suricata ML asap.

Thanks.
