From: "julien vehent" <julien@linuxwall.info>
Subject: Log MARK value
Date: Wed, 24 Sep 2008 17:56:26 +0200
Message-ID: <66c343c00809240856n58cdcfd4qd255b4deb80d0ed4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:mime-version:content-type:content-transfer-encoding
         :content-disposition:x-google-sender-auth;
        bh=KQ1eMLKh5TJ9AdUo8Qxwr3csNjXlrbIXSJRFeQ+6jUI=;
        b=KvgYYDX6uSM7evADCz8HY+18+u5Zb2o2W5F7XSmUwGdM5qosu8Ag8ydg3OJuKy0jbM
         MEb/Njo07+OmlE6+lLlhcqRzksKsVdN7QvBTrwe9uptGmWvRQGabksQovxekn738V4kp
         ZSt3L200ja9kkfJLbB51ybfJXVhoxL0DiruwM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi There,

I'm trying to debug some rules and would like to LOG the mark value
assigned to a packet.
The LOG target doesn't give this information, even in debug level. I
tried ULOG but apparently it's the same thing.
/proc/net/ip_conntrack shows a "mark" field that stays at zero,
whatever I change in my rules.

I found a commit from Patrick McHardy on this subject :
http://kerneltrap.org/mailarchive/git-commits-head/2008/4/19/1508664

Has this been commited yet ? If yes, how can I use it ?
My current kernel version is Linux 2.6.18-6-686.

The test rule : iptables -t mangle -A INPUT -p tcp --dport 22 -j MARK
--set-mark 0x5

What's seen on the system :

arael:/proc/net# cat ip_conntrack|grep dport=22
tcp      6 431999 ESTABLISHED src=[IP SRC] dst=[IP DST] sport=3874
dport=22 packets=2585 bytes=165320 src=[IP SRC] dst=[IP DST]  sport=22
dport=3874 packets=2483 bytes=637896 [ASSURED] mark=0 use=1

arael:/proc/net# iptables -L -v -t mangle
Chain INPUT (policy ACCEPT 1074K packets, 448M bytes)
 pkts bytes target     prot opt in     out     source               destination
  360 27348 MARK       tcp  --  any    any     anywhere
anywhere            tcp dpt:ssh MARK set 0x5

arael:/proc/net# tail -n 1 /var/log/syslog
Jul 18 20:27:07 arael kernel: IN=eth0 OUT=
MAC=00:0c:29:f8:19:1a:00:15:60:98:aa:6b:08:00 SRC=[IP SRC] DST=[IP
DST] LEN=92 TOS=0x00 PREC=0x00 TTL=128 ID=21023 DF PROTO=TCP SPT=3874
DPT=22 WINDOW=63732 RES=0x00 ACK PSH URGP=0


Regards,
Julien
