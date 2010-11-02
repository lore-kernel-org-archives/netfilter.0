From: Rajkumar S <rajkumars@gmail.com>
Subject: libnetfilter_queue exiting on big tcp sessions
Date: Tue, 2 Nov 2010 21:16:36 +0530
Message-ID: <AANLkTimmr4MVCOwgxea9KoGB1BjomBchJ7oAgpnt2WyZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=nhCXSVbYfyfqn1u7/T2vqtHo8egVoXyJDMCu1eU4CkU=;
        b=N71LOSCR3gYvTEzGftJWVek6OOozvqVYdiUd8jziOHxAfyIZ8KuXl1bYGY2ytkxAkh
         iUwJq0lKk7Z9qn8ws70sDopSFQoH14ibT1rsSd+eopPH9lGVIODb5Les/CAr99cibrOC
         VJXgdRP41LYBtwRmBy1vvpOX0xkYBgY+eisog=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I am using latest git checkout of libnetfilter_queue and libnfnetlink
on debian etch with kernel 2.6.26-2-686. The iptables rules used while
testing are:

-A INPUT -s 192.168.3.22/32 -m state --state NEW,ESTABLISHED -j
NFQUEUE --queue-num 0
-A OUTPUT -d 192.168.3.22/32 -m state --state NEW,ESTABLISHED -j
NFQUEUE --queue-num 0

I am using utils/nfqnl_test.c as my test program and using wget to get
a file from 192.168.3.22 for testing. The program runs okay when
getting smaller files but if number of packets go above say 200
nfqnl_test exits with following message:

hw_protocol=0x0800 hook=1 id=389 hw_src_addr=00:14:2a:c9:e1:5d indev=2
payload_len=1500
entering callback
hw_protocol=0x0800 hook=1 id=390 hw_src_addr=00:14:2a:c9:e1:5d indev=2
payload_len=1500
entering callback
closing library handle

The number of packets to trigger this condition varies from say 200 to
about 1000 and changes with each run.

dmesg does not show any error, the last lines of dmesg are:
[76465.470246] ip_tables: (C) 2000-2006 Netfilter Core Team
[92735.818567] Netfilter messages via NETLINK v0.30.
[92793.863824] nf_conntrack version 0.5.0 (6144 buckets, 24576 max)

Before testing with compiled git version I was trying with ubuntu
(lucid) and nfqueue-bindings for python and got the same error.

I am not sure what goes wrong here, I can help with any debug steps to
find out the exact error if required. Any help to locate and fix this
issue is much appreciated.

with regards,

raj
