From: Jeff Jensen <jjensen@unyalli.com>
Subject: explanation of the syslog LEN and WINDOW entries
Date: Wed, 28 Oct 2009 07:53:47 -0600
Message-ID: <b376a78e0910280653y6312fc63yb2d20414d76a1ce0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there an explanation of the LEN and WINDOW fields in an
iptables/netfilter syslog entry?

In the first example I have a LEN=60 and a WINDOW=5840. Can I use
these entries to calculate bandwidth usage?

In the second example I have a LEN=60 and a LEN=56. Can I use these
entries to calculate bandwidth usage?


Example: IN=eth1 OUT=eth0 SRC=******* DST=******* LEN=60 TOS=0x00
PREC=0x00 TTL=62 ID=11625 DF PROTO=TCP SPT=4741 DPT=1901 WINDOW=5840
RES=0x00 SYN URGP=0

Example: IN=eth1 OUT=eth0 SRC=******* DST=******* LEN=76 TOS=0x10
PREC=0x00 TTL=62 ID=0 DF PROTO=UDP SPT=123 DPT=123 LEN=56

Thanks, Jeff
