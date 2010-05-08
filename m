From: David F <netfilter@meta-dynamic.com>
Subject: libnetfilter_queue: mark-value byte ordering?
Date: Sat, 08 May 2010 15:21:46 -0400
Message-ID: <4BE5B9CA.5090606@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hi,

I am using libnetfilter_queue to set the mark on some queued packets 
[nfq_set_verdict_mark(), with verdict==NF_ACCEPT]; then in a later 
iptables chain, I matched on -m mark, looking for my previously marked 
packets, but apparently they didn't match.  So I logged packets and saw 
my packets with my mark values in the log entries, but they seemed to be 
in reverse byte-order (I'm on a little-endian machine).  I changed my 
code to use htonl() on the mark-value prior to calling 
nfq_set_verdict_mark(), and it all suddenly started working.

I had a quick look through the source code of libnetfilter_queue and 
libnfnetlink_queue and didn't see any obvious byte-order conversion 
prior to sending to the kernel, so I wonder if anyone could help me 
understand,
* Is the mark value _supposed_ to be supplied in network byte order or 
is something else going on here;
and if so,
* Since the mark never hits the wire, why would it ever be kept in 
network byte order?

Thanks in advance,
-- David F.

