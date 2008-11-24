From: "patrick daures" <patrick.daures@gmail.com>
Subject: Question about NAT, src ports and dst ports.
Date: Mon, 24 Nov 2008 14:48:05 +0100
Message-ID: <5ed0ca650811240548v39adffd2ndfc24ee7d858f9fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=h/ePOGEByCVGFDocNXMEz6EsTW0evCmurpNvHBNwv6k=;
        b=AaxZygvJrEF76D0BdjY6F3tISNX/yxzBge1i78BSY++HzJpIqpUMA0osOScQs2ZNl7
         7QiMTPjvIuGsB4IeC9UZY0pfBk03Z3aGscRqK9knsetE/A56IsVp+UBYeXjkAEL0uBTo
         S5uEaZ7SvWxJ/26k5tRqaVZSsmL217fJWWmNQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi !
I am trying to set up a testbed using NAT.
A tool creates packets with a different DSCP values, then packets are
sent to a gateway doing NAT using the DSCP values.
For example, EF packets will be  DNAT to  193.1.1.1 and BE packets
will be DNAT to 194.1.1.1.

I use :
iptables -t nat -A PREROUTING -d .... -m dscp --dscp 46 -j NETMAP --to
193.0.0.0/8

But (yes, there is a but)
when my tool generates packets, it can create TCP, UDP, ... packets
with dst port and src port values.
When it creates udp packets with DIFFERENT dscp values but using the
SAME ports, iptables rules doesn't work like I want.
Example :

DNAT Rule :
DSCP : EF ---> DNAT to 193.1.1.1
DSCP : AF11 ---> DNAT to 194.1.1.1

When my generator creates packets like this :
dstPort = 642, srcPort = 326, DSCP = EF ----> DNAT -----> 193.1.1.1
dstPort = 642, srcPort = 326, DSCP = AF11 ----> DNAT -----> 193.1.1.1

iptables seems to apply the same DNAT to the two kinds of packets,
without respecting my iptables rule.

But, when I use the same rules with these packets :
dstPort = 446, srcPort = 222, DSCP = EF ----> DNAT -----> 193.1.1.1
dstPort = 642, srcPort = 326, DSCP = AF11 ----> DNAT -----> 194.1.1.1

it works.

Is this normal ? (I think "yes")
Could I change it ? Is it possible to set iptables in order to avoid
the srcPort and dstPort check ?

Sorry if this message is not easy to understand...

Thank you
