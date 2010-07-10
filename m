From: Pete Kay <petedao@gmail.com>
Subject: Need help with iptables Invalid Argument error
Date: Sat, 10 Jul 2010 16:55:21 +0800
Message-ID: <AANLkTik5UiaVfTPvlFr1RWrXKMkxG-mG39qUJvBbBg7D@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=rTbKj8v6C3Hfxg18DhkBBCXx+4GfjVUN57ghklNfrcw=;
        b=USFzXiYLkdRKhM3g81h8xitMhEJ0JDSxYnuWx+46h+6NLvExDppBmmEEGbKVDs41Qz
         UuizL/ruT+L3qNIHg1HJHQYukUSX/EHqyOOd3Bb6tY/kUSF5oWGFzjJWyBcjSw51o4XR
         OQfaTI/MHI6QlCtcdO6ffbXK7Y4j/3H0vDxPc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to write some code to simulate this iptables rule:
iptables -append -t nat -A PREROUTING -s 192.168.3.2 -p udp --dport 80
-j ACCEPT

But I am getting "Invalid Argument" error when running the commit.
Does anyone know what could be wrong with my sample code here?

Any help will be greatly appreciated.

       struct ipt_entry *e=NULL;
        struct ipt_entry_target *pt;
        struct ipt_entry_match *pm;
        struct ipt_udp *pudp;
       const char *tablename = "nat";
        iptc_handle_t   h = iptc_init(tablename);
        int ret = 0;
        size_t target_size, match_size, size;
        match_size = sizeof(struct ipt_entry_match) + sizeof(struct ipt_tcp);
        target_size = IPT_ALIGN(sizeof(struct ipt_entry_target)) +
IPT_ALIGN(sizeof(int));
        size = sizeof(*e) + match_size + target_size;
        e = calloc(1, size);
        e->ip.src.s_addr = inet_addr("192.168.3.2");
        e->ip.smsk.s_addr = -1;
        e->ip.proto = IPPROTO_UDP;
        e->target_offset = sizeof(*e) + match_size;
        e->next_offset = size;
        pm = (struct ipt_entry_match *)e->elems;
        pm->u.user.match_size = match_size;
        strcpy(pm->u.user.name, "udp");
        pudp = (struct ipt_udp*)pm->data;
        pudp->spts[0] = 0;
        pudp->spts[1] = 0;
        pudp->dpts[0] = 80;
        pudp->dpts[1] = 0xffff;

        pt = (struct ipt_entry_target *) (e->elems + match_size);
        pt->u.user.target_size = target_size;
        strcpy(pt->u.user.name, "ACCEPT");
        if ( !h )   {                printf("Error initializing:
%s\n", iptc_strerror(errno));
        }
        ret = iptc_append_entry("PREROUTING", e, h);
  printf("append = [%i]\n", ret);
        ret = iptc_commit(h);
        printf("commit = [%i]\n",ret);
        if (!ret) {
                printf("false : %s\n", iptc_strerror(errno));   }



Thanks,
P
