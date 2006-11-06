From: Ury Segal <ury_segal@yahoo.com>
Subject: nfq_get_timestamp fails
Date: Mon, 6 Nov 2006 15:46:03 -0800 (PST)
Message-ID: <20061106234603.31270.qmail@web90415.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi!

I get a return value of -1 from nfq_get_timestamp
when I call it from the nfq callback function,
like this:

static int
cb(struct nfq_q_handle *qh, struct nfgenmsg
*nfmsg, struct nfq_data *nfa, void *data)
{
        u_int32_t mark;
        char *packet;
        unsigned int data_len;
        struct timeval ptv;

        mark = nfq_get_nfmark(nfa);
        nfq_get_timestamp(nfa, &ptv);
        data_len = nfq_get_payload(nfa,&packet);
        ptv.tv_sec = 0;
        ptv.tv_usec = 0;
        int res = nfq_get_timestamp(nfa, &ptv);

I get good values for the data_len, mark
and the packet payload. Packet ID and
hw address are OK, too. Only the timestamp
is not.

The pvt variable is untouched.

From some investigation I did I found that 
nfq_get_timestamp fails if it can't find the
timestamp attribute NFQA_TIMESTAMP "attached"
to the message. I guess it's just not there -
do I need to use iptables to turn this on ?

I'm using libnetfilter_queue-20061102, running
on Fedora Core 5 with kernel
2.6.17-1.2187_FC5smp.
i686. gcc version 4.1.1 20060525 (Red Hat
4.1.1-1)

Thanks!


--ury

