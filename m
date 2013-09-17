From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: mac match malfunction?
Date: Tue, 17 Sep 2013 15:54:19 +0300
Message-ID: <CAAo+KF=h_xt_efKSnnp1edbmC9dnMYRkGyKQ44OK-NvWQJPGyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=E/do1cWi6ksN/pjeRdKoZy6hLkAE7fy4ivjZeagpJXY=;
        b=DefPhzpXXI8XzzJ8aOzoWtqOlaEd9k/I4mOP8qbQD6gkHz54SwnrfOmfy7IWxeEV67
         sJI2hjTVjlnWSQ8mpSIZ1hq9THVd5ybl3E+LQDSKLxg9nhbgr9DjmSOj0ifVp/MXF6ck
         5eav0NXIjjVZOCFMjp6SfF2kqgCMh7nRcz/L6Ai3MbC4YAl6b36Ojz+v6hHUcx1ldiKv
         wPpV4v/4BuLH7Jm4eRPO0FKHFG9LmKIZl+s/nSnSYhwJmQ5a70dClZtHMDrH6/3k/792
         qrKjw/ZF/rti94wSUOfTP4HSu5Mf06B8YEmZPgW93f8V4pcwjAOtvb0kiO5NuLKdKS/e
         sBIQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Kernel is 3.4.52
iptables is 1.4.14-2

I have a problem with mac match rules. My rules are like:

iptables -A IPMACCHAIN -s 10.5.1.73/32 -i eth2.51 -m mac --mac-source
00:08:54:44:8A:CF -j RETURN

I drop packet with unexpected MAC or IP addresses.

In logs, I see errors with blank MAC field and user connection is
blocked because of my catchall drop rule.

Other connections from the same IPs work without problem. Especially
SMTP connection are problematic. Another point is packet size. I see
big packet size with this dropped blank-MAC-packets.

If you have a remark, it will be very helpful.

Thanks,

Sep 15 20:00:01 2013 kernel: [113824.380094] IPMAC_MATCHERR:
IN=eth2.51 OUT=eth1 MAC= SRC=10.5.1.73 DST=185.8.128.22 LEN=4420
TOS=0x00 PREC=0x00 TTL=127 ID=25696 DF PROTO=TCP SPT=51769 DPT=5938
WINDOW=65535 RES=0x00 ACK PSH URGP=0 MARK=0x23

Sep 15 20:00:02 2013 kernel: [113824.902318] IPMAC_MATCHERR:
IN=eth2.51 OUT= MAC= SRC=10.5.1.10 DST=10.5.1.1 LEN=8740 TOS=0x00
PREC=0x00 TTL=128 ID=18461 DF PROTO=TCP SPT=389 DPT=60241 WINDOW=65102
RES=0x00 ACK URGP=0 MARK=0x23

Sep 15 20:00:02 2013 kernel: [113824.987072] IPMAC_MATCHERR:
IN=eth2.51 OUT=eth1 MAC= SRC=10.5.1.73 DST=185.8.128.22 LEN=2960
TOS=0x00 PREC=0x00 TTL=127 ID=25713 DF PROTO=TCP SPT=51769 DPT=5938
WINDOW=65535 RES=0x00 ACK PSH URGP=0 MARK=0x23

Sep 15 20:00:17 2013 kernel: [113840.399186] IPMAC_MATCHERR:
IN=eth2.51 OUT=eth1 MAC= SRC=10.5.1.228 DST=77.92.99.2 LEN=1827
TOS=0x00 PREC=0x00 TTL=127 ID=8169 DF PROTO=TCP SPT=65003 DPT=25
WINDOW=64002 RES=0x00 ACK PSH URGP=0 MARK=0x23

Sep 15 20:00:20 2013 kernel: [113843.010882] IPMAC_MATCHERR:
IN=eth2.51 OUT=eth1 MAC= SRC=10.5.1.73 DST=185.8.128.22 LEN=2015
TOS=0x00 PREC=0x00 TTL=127 ID=25828 DF PROTO=TCP SPT=51769 DPT=5938
WINDOW=65144 RES=0x00 ACK PSH URGP=0 MARK=0x23


Oguz Yilmaz
