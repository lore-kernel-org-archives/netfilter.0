From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: How to use Netlink to create a concatination based verdict-map
 element in nftables?
Date: Mon, 18 Sep 2017 11:14:20 +1000
Message-ID: <20170918011419.GA19455@dimstar.local.net>
References: <7a1e91ed-97ff-6668-271b-62da0756fdce@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7a1e91ed-97ff-6668-271b-62da0756fdce@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Sep 14, 2017 at 09:59:17AM +0100, khawar shehzad wrote:
> Hi,
>
> I have the following code but not working, can anybody have a look. I don't
> know what I am missing here.
>
> int nft_vmap_elem_do(int action, const char* cip, const char* eip, const
> char* table, const char* vmap, const char *verdict)
> {
> struct mnl_socket *nl;
> char buf[MNL_SOCKET_BUFFER_SIZE];
> struct mnl_nlmsg_batch *batch;
> struct nlmsghdr *nlh;
> uint32_t portid, seq, family;
> struct nftnl_set *s;
> struct nftnl_set_elem *e;
> uint16_t data;
> int ret;
> s = nftnl_set_alloc();
> if (s == NULL) {
> perror("OOM");
> exit(EXIT_FAILURE);
> }
>
>
> seq = time(NULL);
> family = NFPROTO_IPV6;
>
>
> nftnl_set_set(s, NFTNL_SET_TABLE, table);
> nftnl_set_set(s, NFTNL_SET_NAME, vmap);
> nftnl_set_set_u32(s, NFTNL_SET_FLAGS, NFT_SET_MAP);
>
>
> e = nftnl_set_elem_alloc();
> if (e == NULL) {
> perror("OOM");
> exit(EXIT_FAILURE);
> }
>
>
> struct sockaddr_in6 sa1,sa2;
> inet_pton(AF_INET6, cip, &(sa1.sin6_addr));
> inet_pton(AF_INET6, eip, &(sa2.sin6_addr));
> nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr), 16);
> nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa2.sin6_addr), 16);
> //uint32_t v = htonl(1);
> uint32_t v = 1;
> nftnl_set_elem_set_u32(e, NFTNL_SET_ELEM_VERDICT, v);
> nftnl_set_elem_add(s, e);
>
>
> batch = mnl_nlmsg_batch_start(buf, sizeof(buf));
>
>
> nftnl_batch_begin(mnl_nlmsg_batch_current(batch), seq++);
> mnl_nlmsg_batch_next(batch);
> switch(action){
> case NFT_VMAP_ADD_ELEM:
> nft_vmap_elem_do(NFT_VMAP_DEL_ELEM, cip, eip, table, vmap, verdict);
> nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
> NFT_MSG_NEWSETELEM, family,
> NLM_F_CREATE | NLM_F_REPLACE | NLM_F_ACK,
> seq++);
> break;
> case NFT_VMAP_DEL_ELEM:
> nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
> NFT_MSG_DELSETELEM, family,
> NLM_F_ACK,
> seq++);
>
>
> break;
> }
> nftnl_set_elems_nlmsg_build_payload(nlh, s);
> nftnl_set_free(s);
> mnl_nlmsg_batch_next(batch);
>
>
> nftnl_batch_end(mnl_nlmsg_batch_current(batch), seq++);
> mnl_nlmsg_batch_next(batch);
>
>
> nl = mnl_socket_open(NETLINK_NETFILTER);
> if (nl == NULL) {
> perror("mnl_socket_open");
> exit(EXIT_FAILURE);
> }
>
>
> if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
> perror("mnl_socket_bind");
> exit(EXIT_FAILURE);
> }
> portid = mnl_socket_get_portid(nl);
>
>
> if (mnl_socket_sendto(nl, mnl_nlmsg_batch_head(batch),
> mnl_nlmsg_batch_size(batch)) < 0) {
> perror("mnl_socket_send");
> exit(EXIT_FAILURE);
> }
>
>
> mnl_nlmsg_batch_stop(batch);
>
>
> ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
> while (ret > 0) {
> ret = mnl_cb_run(buf, ret, 0, portid, NULL, NULL);
> if (ret <= 0)
> break;
> ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
> }
> if (ret == -1) {
> perror("error");
> //exit(EXIT_FAILURE);
> }
> mnl_socket_close(nl);
>
>
> return EXIT_SUCCESS;
> }
>
>
> ///////////////////////////////////////////////////////////////
> Cheers,
> Khawar
>
Hi Khawar,

I tried to build your code, but after inserting

#include <time.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <libnftnl/set.h>
#include <libmnl/libmnl.h>
#include <libipset/nfproto.h>
#include <linux/netfilter/nf_tables.h>

at start of the code, I am still getting NFT_VMAP_ADD_ELEM & NFT_VMAP_DEL_ELEM
undefined.

Where are they please?

Cheers ... Duncan.
