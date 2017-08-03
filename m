From: khawar shehzad <shehzad.khawar@gmail.com>
Subject: Adding verdict-map elements with concatenation using C
Date: Thu, 3 Aug 2017 13:14:29 +0100
Message-ID: <7fd22d6f-6c83-c9fa-8e2d-5e350f5f39f2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=d3paJh1CsMus1dBMdTK8qaBxdk7qQNICD8rMKy+P42Y=;
        b=n0RP8e9LkcLU314Dc+VJzOHOuN2DB7QAb06vJWAw3abOstHtb+pxmFA8lOIMs7JA2p
         wUW9de9RnulrO6uDrO6QKSWZCKHNmlg8lIl2cOPjqg6GRfVXcrDh+m2+9nE4N18rmfcr
         UtnzJ+L6dawPfuFkpfaX/iNyXJitoo5raVoeQLzGgxJpPTg8ytExNdxvPa5eoU+w3MKQ
         WwdW9MrBVsLjfW6SISeIeGWQtni0r2rMIOsqu0WCPPIDWKOMkfD9SyQKFUvlO0T3mINb
         xdjEVzCpxnLO5yKF8JFHnrQqxRx4tv5d73DYeGy6CSFXsLnp0rqWN3QKbhkdLNH6atF8
         nVUA==
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I hope everybody is fine.


I want to implement the following command in C for performance reasons 
in my software.


sudo nft add element ip6 myTable myTable_vmap {2001:db8::1 . 2001:db8::2 
: accept}


Can anybody hint me to the right direction? I was able to add simple map 
element like the following but unable to do concatenation in code (both 
functions are given below, one working, the other isn't).

///////////////////////////////////////////


int nft_map_elem_do(int action, const char* key, const char* val, const 
char* table, const char* map)
{
struct mnl_socket *nl;
char buf[MNL_SOCKET_BUFFER_SIZE];
struct mnl_nlmsg_batch *batch;
struct nlmsghdr *nlh;
uint32_t portid, seq, family;
struct nftnl_set *s;
struct nftnl_set_elem *e;
uint16_t data;
int ret;
s = nftnl_set_alloc();
if (s == NULL) {
perror("OOM");
exit(EXIT_FAILURE);
}


seq = time(NULL);
family = NFPROTO_IPV6;


nftnl_set_set(s, NFTNL_SET_TABLE, table);
nftnl_set_set(s, NFTNL_SET_NAME, map);


e = nftnl_set_elem_alloc();
if (e == NULL) {
perror("OOM");
exit(EXIT_FAILURE);
}


struct sockaddr_in6 sa1,sa2;
inet_pton(AF_INET6, key, &(sa1.sin6_addr));
inet_pton(AF_INET6, val, &(sa2.sin6_addr));
nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr), 16);
nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &(sa2.sin6_addr), 16);
nftnl_set_elem_add(s, e);


batch = mnl_nlmsg_batch_start(buf, sizeof(buf));


nftnl_batch_begin(mnl_nlmsg_batch_current(batch), seq++);
mnl_nlmsg_batch_next(batch);
switch(action){
case NFT_MAP_ADD_ELEM:
nft_map_elem_do(NFT_MAP_DEL_ELEM, key, val, table, map);
nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
NFT_MSG_NEWSETELEM, family,
NLM_F_CREATE | NLM_F_REPLACE | NLM_F_ACK,
seq++);
break;
case NFT_MAP_DEL_ELEM:
nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
NFT_MSG_DELSETELEM, family,
NLM_F_ACK,
seq++);


break;
}
nftnl_set_elems_nlmsg_build_payload(nlh, s);
nftnl_set_free(s);
mnl_nlmsg_batch_next(batch);


nftnl_batch_end(mnl_nlmsg_batch_current(batch), seq++);
mnl_nlmsg_batch_next(batch);


nl = mnl_socket_open(NETLINK_NETFILTER);
if (nl == NULL) {
perror("mnl_socket_open");
exit(EXIT_FAILURE);
}


if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
perror("mnl_socket_bind");
exit(EXIT_FAILURE);
}
portid = mnl_socket_get_portid(nl);


if (mnl_socket_sendto(nl, mnl_nlmsg_batch_head(batch),
mnl_nlmsg_batch_size(batch)) < 0) {
perror("mnl_socket_send");
exit(EXIT_FAILURE);
}


mnl_nlmsg_batch_stop(batch);


ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
while (ret > 0) {
ret = mnl_cb_run(buf, ret, 0, portid, NULL, NULL);
if (ret <= 0)
break;
ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
}
if (ret == -1) {
//perror("error");
//exit(EXIT_FAILURE);
}
mnl_socket_close(nl);


return EXIT_SUCCESS;
}


///////////////////////////////////////////////////////////








AND HERE IS THE CODE FOR ADDED ELEMENT TO A VMAP. WHICH IS DOING 
PROBLEM. CAN ANYBODY HELP ME SOLVE THIS ISSUE IN FOLLOWING CODE. WHEN I 
RUN IT IT SAYS ERROR: INVALID ARGUMENT.



int nft_vmap_elem_do(int action, const char* cip, const char* eip, const 
char* table, const char* vmap, const char *verdict)
{
struct mnl_socket *nl;
char buf[MNL_SOCKET_BUFFER_SIZE];
struct mnl_nlmsg_batch *batch;
struct nlmsghdr *nlh;
uint32_t portid, seq, family;
struct nftnl_set *s;
struct nftnl_set_elem *e;
uint16_t data;
int ret;
s = nftnl_set_alloc();
if (s == NULL) {
perror("OOM");
exit(EXIT_FAILURE);
}


seq = time(NULL);
family = NFPROTO_IPV6;


nftnl_set_set(s, NFTNL_SET_TABLE, table);
nftnl_set_set(s, NFTNL_SET_NAME, vmap);
nftnl_set_set_u32(s, NFTNL_SET_FLAGS, NFT_SET_MAP);


e = nftnl_set_elem_alloc();
if (e == NULL) {
perror("OOM");
exit(EXIT_FAILURE);
}


struct sockaddr_in6 sa1,sa2;
inet_pton(AF_INET6, cip, &(sa1.sin6_addr));
inet_pton(AF_INET6, eip, &(sa2.sin6_addr));
nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr), 16);
nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa2.sin6_addr), 16);
//uint32_t v = htonl(1);
uint32_t v = 1;
nftnl_set_elem_set_u32(e, NFTNL_SET_ELEM_VERDICT, v);
nftnl_set_elem_add(s, e);


batch = mnl_nlmsg_batch_start(buf, sizeof(buf));


nftnl_batch_begin(mnl_nlmsg_batch_current(batch), seq++);
mnl_nlmsg_batch_next(batch);
switch(action){
case NFT_VMAP_ADD_ELEM:
nft_vmap_elem_do(NFT_VMAP_DEL_ELEM, cip, eip, table, vmap, verdict);
nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
NFT_MSG_NEWSETELEM, family,
NLM_F_CREATE | NLM_F_REPLACE | NLM_F_ACK,
seq++);
break;
case NFT_VMAP_DEL_ELEM:
nlh = nftnl_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
NFT_MSG_DELSETELEM, family,
NLM_F_ACK,
seq++);


break;
}
nftnl_set_elems_nlmsg_build_payload(nlh, s);
nftnl_set_free(s);
mnl_nlmsg_batch_next(batch);


nftnl_batch_end(mnl_nlmsg_batch_current(batch), seq++);
mnl_nlmsg_batch_next(batch);


nl = mnl_socket_open(NETLINK_NETFILTER);
if (nl == NULL) {
perror("mnl_socket_open");
exit(EXIT_FAILURE);
}


if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
perror("mnl_socket_bind");
exit(EXIT_FAILURE);
}
portid = mnl_socket_get_portid(nl);


if (mnl_socket_sendto(nl, mnl_nlmsg_batch_head(batch),
mnl_nlmsg_batch_size(batch)) < 0) {
perror("mnl_socket_send");
exit(EXIT_FAILURE);
}


mnl_nlmsg_batch_stop(batch);


ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
while (ret > 0) {
ret = mnl_cb_run(buf, ret, 0, portid, NULL, NULL);
if (ret <= 0)
break;
ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
}
if (ret == -1) {
perror("error");
//exit(EXIT_FAILURE);
}
mnl_socket_close(nl);


return EXIT_SUCCESS;
}


///////////////////////////////////////////////////////////////
Cheers,
Khawar

