From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Mon, 10 Aug 2009 16:32:53 +0530
Message-ID: <cfeab66d0908100402u5dd7eb7blc050e7e0439253e0@mail.gmail.com>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
	 <1249899383.7133.13.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0HGfYEJ4mrwi+Hw6PhbY1bjM81oV390J9Ku5a5gC0lg=;
        b=KnJCGNMPICqxTcrEr5IiBqwk5UwItFOEnLpm6WJ9KXehJG6MEw3BdAfCE2ElWVBTiD
         LMwMrmqKhu3Exc6zxYk/xgvRuV5r7IMf9Zg//H2HcztwmWnRnJ4OeqkgZU2JjWzIojAw
         qU8SDt5wlrvQzvM+G9Q9BWsyJ8cC6TReOVZU8=
In-Reply-To: <1249899383.7133.13.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/ip.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netinet/ip_icmp.h>
#include <netinet/udp.h>
#include <syslog.h>

#include <linux/types.h>
#include <linux/netfilter.h>            /* for NF_ACCEPT */

#include <libnetfilter_queue/libnetfilter_queue.h>

int main(int argc, char **argv)
{
        struct nfq_handle *h;
        struct nfq_q_handle *qh;
        struct nfnl_handle *nh;


        printf("opening library handle\n");
        h = nfq_open();
        if (!h) {
                fprintf(stderr, "error during nfq_open()\n");
                exit(1);
        }

        printf("unbinding existing nf_queue handler for AF_INET (if any)\n");
        if (nfq_unbind_pf(h, AF_INET) < 0) {
                fprintf(stderr, "error during nfq_unbind_pf()\n");
                exit(1);
        }
        printf("binding nfnetlink_queue as nf_queue handler for AF_INET\n");
        if (nfq_bind_pf(h, AF_INET) < 0) {
                fprintf(stderr, "error during nfq_bind_pf()\n");
                exit(1);
        }

        printf("binding this socket to queue '0'\n");
        qh = nfq_create_queue(h,  0, &cb, NULL);
        if (!qh) {
                fprintf(stderr, "error during nfq_create_queue()\n");
                exit(1);
        }

        printf("setting copy_packet mode\n");
        if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff) < 0) {
                fprintf(stderr, "can't set packet_copy mode\n");
                exit(1);
        }
}
