From: "Robert Surton (Burgess)" <burgess@systems.cs.cornell.edu>
Subject: Mangled and ACCEPTed NFQUEUE packets getting dropped
Date: Mon, 22 Nov 2010 12:16:24 -0500
Message-ID: <1290446184.6559.26.camel@lawrence>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-fCre0pusyHaV6EusDjue"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-fCre0pusyHaV6EusDjue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As part of a packet processor I am working on in my research, I often
want to turn a packet around, by swapping its source and destination
addresses and ports.  I have reduced what I want to accomplish down to a
small test program, which I have attached, that is more or less a UDP
echo service.  Packets that go through NFQUEUE 1 should be sent right
back unchanged save for direction.

I set up a rule to match all UDP packets destined for port 20000, then
connected with `socat udp:localhost:20000 -'.  Whatever I sent came back
correctly.  However, when I went to another machine and used `socat
udp:192.168.1.103:20000 0', everything dropped into the ether.  I know
the network and basic setup is correct, because the rule shown by
`iptables -L -v' still increments correctly, and the usual UDP echo
service works---my mangled packets simply aren't arriving back.

Because I see the expected behavior over the loopback device but not the
local network, I hypothesize that the problem is either that the MAC
addresses should also be reversed and aren't, or that the egress
interface needs to be recomputed and isn't, or something like that.
Basically, I suspect the kernel has made some sort of routing decision
before I change the addresses, and needs to update it based on the new
values but does not.  My question, then, is how do I set up my rules so
that my mangling is done in the right place and my packets are delivered
correctly?

I currently use the following rule:

$ iptables -t mangle -A INPUT -p udp --dport 20000 -j NFQUEUE
--queue-num 1

I had previously tried the usual filter table, but read somewhere that
one shouldn't mangle packets in that table, so I switched to the mangle
table.  I have also tried the PREROUTING chain rather than INPUT.  All
such variations produce the exact same behavior; it works on the
loopback but packets disappear when I introduce a second machine.

--=-fCre0pusyHaV6EusDjue
Content-Disposition: attachment; filename="test-netfilter.c"
Content-Type: text/x-csrc; name="test-netfilter.c"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#include "rtcp.h"

#ifndef __FAVOR_BSD
#define __FAVOR_BSD
#endif

#ifndef __USE_BSD
#define __USE_BSD
#endif

#include <netinet/ip.h>
#include <netinet/udp.h>

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <libnetfilter_queue/libnetfilter_queue.h>
#include <linux/netfilter.h>

static int bounce(struct nfq_q_handle *q, struct nfgenmsg *m,
                  struct nfq_data *d, void *a)
{
	int id;
	int ret;
	struct ip *ip;
	struct udphdr *udp;
	uint32_t addr;
	uint16_t port;

	(void)m;
	(void)a;

	id = ntohl((nfq_get_msg_packet_hdr(d))->packet_id);
	nfq_get_payload(d, (char **)&ip);
	udp = (struct udphdr *)((uint32_t *) ip + ip->ip_hl);

	addr = ip->ip_src.s_addr;
	ip->ip_src.s_addr = ip->ip_dst.s_addr;
	ip->ip_dst.s_addr = addr;

	port = udp->uh_sport;
	udp->uh_sport = udp->uh_dport;
	udp->uh_dport = port;
	
	ret = nfq_set_verdict(q, id, NF_ACCEPT, ntohs(ip->ip_len),
			      (unsigned char *)ip);
	if (ret < 0) {
		fputs("Error setting verdict.\n", stderr);
		exit(EXIT_FAILURE);
	}
	return ret;
}

int main(int argc, char **argv)
{
	char buf[1500];
	int fd;
	int ret;
	ssize_t size;
	struct nfq_handle *h;
	struct nfq_q_handle *q;

	(void)argc;
	(void)argv;

	h = nfq_open();
	if (!h) {
		fputs("Error opening the queue interface.\n", stderr);
		exit(EXIT_FAILURE);
	}
	/*
	 * From the netfilter mailinglist: "The entire unregistration
	 * stuff is a horrible hack, the only reason why it (still)
	 * exists is because registration of the same handler returns
	 * EEXIST instead of silently ignoring it. The best fix for now
	 * is to ignore the return value of nfq_unbind_pf()."
	 */
	nfq_unbind_pf(h, AF_INET);
	ret = nfq_bind_pf(h, AF_INET);
	if (ret < 0) {
		fputs("Error binding the queue handler.\n", stderr);
		exit(EXIT_FAILURE);
	}

	q = nfq_create_queue(h, 1, bounce, NULL);
	if (!q) {
		fputs("Error creating the incoming queue.\n", stderr);
		exit(EXIT_FAILURE);
	}
	ret = nfq_set_mode(q, NFQNL_COPY_PACKET, sizeof(buf));
	if (ret < 0) {
		fputs("Error setting up the incoming queue.\n", stderr);
		exit(EXIT_FAILURE);
	}

	fd = nfq_fd(h);
	while ((size = recv(fd, buf, sizeof(buf), 0)) > 0)
		nfq_handle_packet(h, buf, size);

	nfq_destroy_queue(q);
	nfq_close(h);
	return EXIT_SUCCESS;
}

--=-fCre0pusyHaV6EusDjue--

