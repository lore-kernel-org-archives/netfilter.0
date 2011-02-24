From: jobhunts02@aol.com
Subject: nfct_open prototype warning
Date: Wed, 23 Feb 2011 16:06:01 -0800
Message-ID: <BE517636-CC11-4CD2-B28A-01C5E63833D6@aol.com>
Mime-Version: 1.0 (iPhone Mail 8C148)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Why does this line:

     handle = nfct_open(CONNTRACK, NFCT_ALL_CT_GROUPS);

give me this warning?

     warning: passing argument 1 of 'nfct_open' with different width due to prototype


I tried casting CONNTRACK to u_int8_t, in accordance with the prototype, and I got the same warning.

How can I eliminate this warning?  I am running Linux 2.6.26 on PowerPC.
