From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: use libiptc to build a rule to allow tftp traffic
Date: Fri, 13 Mar 2020 15:22:26 +0100
Message-ID: <20200313142226.e2scfjjtqze5bvao@salvia>
References: <CAJjT2kgnuK_zy1tyQh5U7GiSv1P9pQqK7c7e_578w10sFMLKDA@mail.gmail.com>
 <CAJjT2kgiAg17n085MbvOTOOYCvDnnzEUJqqj+t89-J5wmqNC2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="5ch3oy6hwsvqaylb"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJjT2kgiAg17n085MbvOTOOYCvDnnzEUJqqj+t89-J5wmqNC2w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Moyuan Chen <moyuan.chen@gmail.com>
Cc: netfilter@vger.kernel.org


--5ch3oy6hwsvqaylb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2020 at 03:48:43PM -0400, Moyuan Chen wrote:
> Hello,
> I am trying to build a rule just like below:
> iptables -t raw -I OUTPUT -j CT -p udp --dport 69 --helper tftp

I think you are missing some options for CT? What's the intention with
this rule?

BTW, if you really want to use iptables instead of nftables. Then,
please, use libnftnl and the netlink interface for this. Modern
networking subsystems provide netlink interfaces. I'm attaching a
sketch code you can use for reference.

libiptc is an internal library that uses the getsockopt()/setsockopt()
interface, it is very old and obscure.

--5ch3oy6hwsvqaylb
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="nft-xtables-rule-add.c"

#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stddef.h>	/* for offsetof */
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>

#include <linux/netfilter.h>
#include <linux/netfilter/nfnetlink.h>
#include <linux/netfilter/nf_tables.h>

#include <linux/netfilter/xt_tcpudp.h>
#include <linux/netfilter/xt_helper.h>
#include <linux/netfilter/xt_LOG.h>

#include <libmnl/libmnl.h>
#include <libnftnl/rule.h>
#include <libnftnl/expr.h>

static void add_match(struct nftnl_rule *r)
{
	struct nftnl_expr *e;
	struct xt_udp *info;

	e = nftnl_expr_alloc("match");
	if (e == NULL) {
		perror("expr match oom");
		exit(EXIT_FAILURE);
	}

	nftnl_expr_set(e, NFTNL_EXPR_MT_NAME, "udp", strlen("udp"));
	nftnl_expr_set_u32(e, NFTNL_EXPR_MT_REV, 0);

	info = calloc(1, sizeof(*info));
	if (!info) {
		perror("expr match oom");
		exit(EXIT_FAILURE);
	}

	info->spts[0] = info->spts[1] = 69;
	nftnl_expr_set(e, NFTNL_EXPR_MT_INFO, info, sizeof(*info));

	nftnl_rule_add_expr(r, e);
}

static void add_match_2(struct nftnl_rule *r)
{
	struct xt_helper_info *info;
	struct nftnl_expr *e;

	e = nftnl_expr_alloc("match");
	if (e == NULL) {
		perror("expr match oom");
		exit(EXIT_FAILURE);
	}

	nftnl_expr_set(e, NFTNL_EXPR_MT_NAME, "helper", strlen("helper"));
	nftnl_expr_set_u32(e, NFTNL_EXPR_MT_REV, 0);

	info = calloc(1, sizeof(struct xt_helper_info));
	if (!info) {
		perror("expr match oom");
		exit(EXIT_FAILURE);
	}

	strncpy(info->name, "tftp", sizeof(info->name));
	nftnl_expr_set(e, NFTNL_EXPR_MT_INFO, info, sizeof(*info));

	nftnl_rule_add_expr(r, e);
}

static void add_target(struct nftnl_rule *r)
{
	struct nftnl_expr *e;
	struct xt_log_info *info;

	e = nftnl_expr_alloc("target");
	if (e == NULL) {
		perror("expr target oom");
		exit(EXIT_FAILURE);
	}

	nftnl_expr_set(e, NFTNL_EXPR_TG_NAME, "LOG", strlen("LOG"));
	nftnl_expr_set_u32(e, NFTNL_EXPR_TG_REV, 0);

	info = calloc(1, sizeof(struct xt_log_info));
	if (!info) {
		perror("expr target oom");
		exit(EXIT_FAILURE);
	}

	strncpy(info->prefix, "my log message: ", sizeof(info->prefix));
	nftnl_expr_set(e, NFTNL_EXPR_TG_INFO, info, sizeof(*info));

	nftnl_rule_add_expr(r, e);
}

static void add_payload(struct nftnl_rule *r, uint32_t base, uint32_t dreg,
			uint32_t offset, uint32_t len)
{
	struct nftnl_expr *e;

	e = nftnl_expr_alloc("payload");
	if (e == NULL) {
		perror("expr payload oom");
		exit(EXIT_FAILURE);
	}

	nftnl_expr_set_u32(e, NFTNL_EXPR_PAYLOAD_BASE, base);
	nftnl_expr_set_u32(e, NFTNL_EXPR_PAYLOAD_DREG, dreg);
	nftnl_expr_set_u32(e, NFTNL_EXPR_PAYLOAD_OFFSET, offset);
	nftnl_expr_set_u32(e, NFTNL_EXPR_PAYLOAD_LEN, len);

	nftnl_rule_add_expr(r, e);
}

static void add_cmp(struct nftnl_rule *r, uint32_t sreg, uint32_t op,
		    const void *data, uint32_t data_len)
{
	struct nftnl_expr *e;

	e = nftnl_expr_alloc("cmp");
	if (e == NULL) {
		perror("expr cmp oom");
		exit(EXIT_FAILURE);
	}

	nftnl_expr_set_u32(e, NFTNL_EXPR_CMP_SREG, sreg);
	nftnl_expr_set_u32(e, NFTNL_EXPR_CMP_OP, op);
	nftnl_expr_set(e, NFTNL_EXPR_CMP_DATA, data, data_len);

	nftnl_rule_add_expr(r, e);
}

static void add_counter(struct nftnl_rule *r)
{
	struct nftnl_expr *e;

	e = nftnl_expr_alloc("counter");
	if (e == NULL) {
		perror("expr counter oom");
		exit(EXIT_FAILURE);
	}

	nftnl_rule_add_expr(r, e);
}

static struct nftnl_rule *setup_rule(uint8_t family, const char *table,
				     const char *chain, const char *handle)
{
	struct nftnl_rule *r = NULL;
	uint8_t proto;
	uint16_t dport;
	uint64_t handle_num;

	r = nftnl_rule_alloc();
	if (r == NULL) {
		perror("OOM");
		exit(EXIT_FAILURE);
	}

	nftnl_rule_set_str(r, NFTNL_RULE_TABLE, table);
	nftnl_rule_set_str(r, NFTNL_RULE_CHAIN, chain);
	nftnl_rule_set_u32(r, NFTNL_RULE_FAMILY, family);
	nftnl_rule_set_u32(r, NFTNL_RULE_COMPAT_PROTO, IPPROTO_UDP);
	nftnl_rule_set_u32(r, NFTNL_RULE_COMPAT_FLAGS, 0);

	if (handle != NULL) {
		handle_num = atoll(handle);
		nftnl_rule_set_u64(r, NFTNL_RULE_POSITION, handle_num);
	}

	/* Match on IP header protocol field. */
	proto = IPPROTO_UDP;
	add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
		    offsetof(struct iphdr, protocol), sizeof(uint8_t));
	add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &proto, sizeof(uint8_t));

	add_match(r);
	add_match_2(r);

	add_counter(r);
	add_target(r);

	return r;
}

int main(int argc, char *argv[])
{
	struct mnl_socket *nl;
	struct nftnl_rule *r;
	struct nlmsghdr *nlh;
	struct mnl_nlmsg_batch *batch;
	uint8_t family;
	char buf[MNL_SOCKET_BUFFER_SIZE];
	uint32_t seq = time(NULL);
	int ret;

	if (argc < 4 || argc > 5) {
		fprintf(stderr, "Usage: %s <family> <table> <chain>\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	if (strcmp(argv[1], "ip") == 0)
		family = NFPROTO_IPV4;
	else if (strcmp(argv[1], "ip6") == 0)
		family = NFPROTO_IPV6;
	else {
		fprintf(stderr, "Unknown family: ip, ip6\n");
		exit(EXIT_FAILURE);
	}

	if (argc != 5)
		r = setup_rule(family, argv[2], argv[3], NULL);
	else
		r = setup_rule(family, argv[2], argv[3], argv[4]);

	nl = mnl_socket_open(NETLINK_NETFILTER);
	if (nl == NULL) {
		perror("mnl_socket_open");
		exit(EXIT_FAILURE);
	}

	if (mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0) {
		perror("mnl_socket_bind");
		exit(EXIT_FAILURE);
	}

	batch = mnl_nlmsg_batch_start(buf, sizeof(buf));

	nftnl_batch_begin(mnl_nlmsg_batch_current(batch), seq++);
	mnl_nlmsg_batch_next(batch);

	nlh = nftnl_rule_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
			NFT_MSG_NEWRULE,
			nftnl_rule_get_u32(r, NFTNL_RULE_FAMILY),
			NLM_F_APPEND|NLM_F_CREATE|NLM_F_ACK, seq++);

	nftnl_rule_nlmsg_build_payload(nlh, r);
	nftnl_rule_free(r);
	mnl_nlmsg_batch_next(batch);

	nftnl_batch_end(mnl_nlmsg_batch_current(batch), seq++);
	mnl_nlmsg_batch_next(batch);

	ret = mnl_socket_sendto(nl, mnl_nlmsg_batch_head(batch),
				mnl_nlmsg_batch_size(batch));
	if (ret == -1) {
		perror("mnl_socket_sendto");
		exit(EXIT_FAILURE);
	}

	mnl_nlmsg_batch_stop(batch);

	ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
	if (ret == -1) {
		perror("mnl_socket_recvfrom");
		exit(EXIT_FAILURE);
	}

	ret = mnl_cb_run(buf, ret, 0, mnl_socket_get_portid(nl), NULL, NULL);
	if (ret < 0) {
		perror("mnl_cb_run");
		exit(EXIT_FAILURE);
	}

	mnl_socket_close(nl);

	return EXIT_SUCCESS;
}

--5ch3oy6hwsvqaylb--
