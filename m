From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Programmatically adding Map element into the map/set using libnftnl
Date: Wed, 30 Nov 2016 19:16:28 +0000
Message-ID: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=pLeXfSBNJsJp2gIbX4/Lq7Kox7Ifd1/m+zeFSG3lTvc=;
        b=kJxEW4uSgGmRznXqgCsEbCuzrKzHOnTNUFtfjTLBeuJSsdGdyZmG6ksDtZlNL2N/KX
         Pyh7cp4a7ps0kLyBKt7sUyeyhfBPULvZQeP46vQRKVhXj9Fc3HRZ5ZCjDis5HocvGeQw
         HFDuWQL44lFMgUDtoO/tp5PAhxQYBNVB1bczuJLxR6/RjeVbwQ3AP1SUKnxxaVVTn1r+
         Io8oDb2BdyIricgR4SPgsv1wreOkXfhnHb8uhFcA/J6lfD4Cnq4Ep5umOFQx9CcG4IZi
         RubDtFNdaN8/nvOMSy1eTrEWawqAvpdsORRw9Kgf3QAvzeBD1Y6MqaYLjUPxBpGyTeyq
         OSyQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
I hope everybody is fine.

I want to do following programmatically in C using libnftnl.


_______________________________________________
"nft add element ip6 my_table my_map {fe80::2 : fe80::3 }"
_______________________________________________

My example code is below, and it gives "error: Invalid argument"
error. My question is simple how can I add an IPv6 map into a set/map.
My map type is "type ipv6_addr : ipv6_addr".


#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <netinet/in.h>
#include <linux/netfilter.h>
#include <linux/netfilter/nf_tables.h>
#include <libmnl/libmnl.h>
#include <libnftnl/set.h>

int main(int argc, char *argv[])
{
        struct mnl_socket *nl;
        char buf[MNL_SOCKET_BUFFER_SIZE];
        struct nlmsghdr *nlh;
        uint32_t portid, seq, family;
        struct nftnl_set *s;
        struct nftnl_set_elem *e;
        int ret;

        s = nftnl_set_alloc();

        seq = time(NULL);
        family = NFPROTO_IPV6;

        nftnl_set_set(s, NFTNL_SET_TABLE, "my_table");
        nftnl_set_set(s, NFTNL_SET_NAME, "my_map");

        e = nftnl_set_elem_alloc();

        nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, "fe80::2", 16);

        nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, "fe80::3", 16);

        nftnl_set_elem_add(s, e);

        e = nftnl_set_elem_alloc();

        nlh = nftnl_set_nlmsg_build_hdr(buf, NFT_MSG_NEWSETELEM, family,
                                      NLM_F_CREATE|NLM_F_EXCL|NLM_F_ACK, seq);
        nftnl_set_elems_nlmsg_build_payload(nlh, s);
        nftnl_set_free(s);

        nl = mnl_socket_open(NETLINK_NETFILTER);

        if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
                perror("mnl_socket_bind");
                exit(EXIT_FAILURE);
        }
        portid = mnl_socket_get_portid(nl);

        if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
                perror("mnl_socket_send");
                exit(EXIT_FAILURE);
        }

        ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
        while (ret > 0) {
                ret = mnl_cb_run(buf, ret, seq, portid, NULL, NULL);
                if (ret <= 0)
                        break;
                ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
        }
        mnl_socket_close(nl);

        return EXIT_SUCCESS;
}



I get the "error: Invalid argument" error. Any help will be much appreciated.

Cheers,
Khawar
