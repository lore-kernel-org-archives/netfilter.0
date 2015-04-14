From: Kees-Jan Hermans <hermans@fox-it.com>
Subject: Modifying a packet's length using netfilter queue
Date: Tue, 14 Apr 2015 08:43:12 +0000
Message-ID: <B7FD9CFA-CC4B-48B6-9672-50FBBCDE1C5F@fox-it.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <C206BC3C58E7D341838E111426D6EA00@fox-it.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone. I am new to this list, and I'd like to know if I can make a packet, captured through netfilter queueing, bigger. I have created the following function:

#include <libnfnetlink/libnfnetlink.h>
#include <libnetfilter_queue/libnetfilter_queue.h>

struct nfq_data {
 struct nfattr **data;
};

void nfq_set_payload_length
 (struct nfq_data *nfad, unsigned length)
{
 //.. could be an error here if length + NFA_LENGTH(0) > 0xffff..
 (nfad->data[NFQA_PAYLOAD-1])->nfa_len = (length + NFA_LENGTH(0));
}

In order to be able to modify the length of a captured packet (in NFQNL_COPY_PACKET mode). Everything about the packet will be in order - recalculated checksums etc). Is this an acceptable approach?

KJ