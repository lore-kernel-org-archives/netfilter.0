From: Alex <mysqlstudent@gmail.com>
Subject: Analyzing DNAT traffic
Date: Fri, 4 Mar 2011 15:13:05 -0500
Message-ID: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=gtoOhIbw4x1qVmHh3dJgLpTzT8HG0QWAIIzatmxWg6I=;
        b=hTMANa+O89lHEMrlzzOA0W4KD9HX/0H5BvhW9yvDJVwl31GDwsQdt6rcX6dYX5fzNp
         0q7ldaBQ1bAAK1oTVvVaePhAYJOExXLb31/jM/Cvmm3MWvcIoMpHv9vbKR0yRm2CJJi6
         VBUTMojDFL8FgFJWyEkkbT/ooy1pH3fls5q2o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have DNAT set up for a few ports on a fedora14 box with
shorewall-4.4.11.1 for bittorrent traffic, and I'm still seeing quite
a bit of traffic that I think should be translated but is not. I had
initially posted this on the shorewall list, but it seems more
appropriate here.

How can I analyize this traffic to determine if it should be forwarded
on to its intended internal recipient, or if it is completely
unrelated traffic that should continue to be blocked?

I have a firewall with two interfaces connected to the Internet via a
cable modem. The destination ports are unknown to me; I'm using a
different port for the bittorrent dnat traffic. Here are a few sample
log entries for traffic I think should be translated:

[2373602.833434] Shorewall:ext2fw:REJECT:IN=eth0 OUT=
MAC=40:61:86:4e:84:09:00:21:a0:75:e3:12:08:00 SRC=221.192.199.46
DST=68.XXX.YYY.44 LEN=40 TOS=0x00 PREC=0x00 TTL=108 ID=256 DF
PROTO=TCP SPT=12200 DPT=27977 WINDOW=8192 RES=0x00 SYN URGP=0
[2373626.966318] Shorewall:ext2fw:REJECT:IN=eth0 OUT=
MAC=40:61:86:4e:84:09:00:21:a0:75:e3:12:08:00 SRC=123.30.133.59
DST=68.XXX.YYY.44 LEN=40 TOS=0x00 PREC=0x00 TTL=99 ID=256 PROTO=TCP
SPT=6000 DPT=1433 WINDOW=16384 RES=0x00 SYN URGP=0

The .44 address is the address of the external interface to the
Internet on the firewall. Other log entries have similar ports, but
there is also quite a range of destination ports, and I'm not able to
correlate any of them to the output of "netstat -tnap" on the host
that is dnat'd.

Can you recommend options for tcpdump that might be used to trace the
traffic and see if it's traversing the firewall, or if the traffic
contains packets associated with that host and bittorrent?

Thanks,
Alex
