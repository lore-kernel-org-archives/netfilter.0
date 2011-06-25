From: John Brown <john.gmane@bcgassets.com>
Subject: IPTABLES: How to NOT display MAC addr in log files
Date: Sat, 25 Jun 2011 19:25:36 +0000 (UTC)
Message-ID: <loom.20110625T212223-868@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

How do I prevent IPTABLES from sending the MAC address data to a log file.

Otherwords I don't wan the MAC=00:25....... data. Its useless to me and wastes a
ton of space in the log files.

Jun 25 13:15:16 infodeli kernel: LOGDROP--IN=eth0 OUT=
MAC=00:25:90:01:34:ec:00:09:44:02:2c:0a:08:00 SRC=xxx.XXX.xxx.xxx
DST=yyy.yyy.yyy.yyy LEN=92 TOS=0x00 PREC=0x00 TTL=61 ID=23777 PROTO=UDP SPT=3001
DPT=15029 LEN=72

Many thanks in advance

