From: Jeff Largent <jwlargent@vlsmaps.com>
Subject: Re: Need help with iptables Invalid Argument error
Date: Mon, 12 Jul 2010 08:03:38 -0500
Message-ID: <20100712080338.1381f55d.jwlargent@vlsmaps.com>
References: <AANLkTik5UiaVfTPvlFr1RWrXKMkxG-mG39qUJvBbBg7D@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik5UiaVfTPvlFr1RWrXKMkxG-mG39qUJvBbBg7D@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 10 Jul 2010 16:55:21 +0800
Pete Kay <petedao@gmail.com> wrote:

> Hi,
> 
> I am trying to write some code to simulate this iptables rule:
> iptables -append -t nat -A PREROUTING -s 192.168.3.2 -p udp --dport 80
> -j ACCEPT
> 

iptables -t nat -A PREROUTING -s 192.168.3.2 -p udp --dport 80 -j ACCEPT

There is no -append option or at least there isn't on my version.

> But I am getting "Invalid Argument" error when running the commit.
> Does anyone know what could be wrong with my sample code here?
> 
> Any help will be greatly appreciated.
> 
>        struct ipt_entry *e=NULL;
>         struct ipt_entry_target *pt;
>         struct ipt_entry_match *pm;
>         struct ipt_udp *pudp;
>        const char *tablename = "nat";
>         iptc_handle_t   h = iptc_init(tablename);
>         int ret = 0;
>         size_t target_size, match_size, size;
>         match_size = sizeof(struct ipt_entry_match) + sizeof(struct ipt_tcp);
>         target_size = IPT_ALIGN(sizeof(struct ipt_entry_target)) +
> IPT_ALIGN(sizeof(int));
>         size = sizeof(*e) + match_size + target_size;
>         e = calloc(1, size);
>         e->ip.src.s_addr = inet_addr("192.168.3.2");
>         e->ip.smsk.s_addr = -1;
>         e->ip.proto = IPPROTO_UDP;
>         e->target_offset = sizeof(*e) + match_size;
>         e->next_offset = size;
>         pm = (struct ipt_entry_match *)e->elems;
>         pm->u.user.match_size = match_size;
>         strcpy(pm->u.user.name, "udp");
>         pudp = (struct ipt_udp*)pm->data;
>         pudp->spts[0] = 0;
>         pudp->spts[1] = 0;
>         pudp->dpts[0] = 80;
>         pudp->dpts[1] = 0xffff;
> 
>         pt = (struct ipt_entry_target *) (e->elems + match_size);
>         pt->u.user.target_size = target_size;
>         strcpy(pt->u.user.name, "ACCEPT");
>         if ( !h )   {                printf("Error initializing:
> %s\n", iptc_strerror(errno));
>         }
>         ret = iptc_append_entry("PREROUTING", e, h);
>   printf("append = [%i]\n", ret);
>         ret = iptc_commit(h);
>         printf("commit = [%i]\n",ret);
>         if (!ret) {
>                 printf("false : %s\n", iptc_strerror(errno));   }
> 
> 
> 
> Thanks,
> P
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Jeff Largent <jwlargent@vlsmaps.com>
