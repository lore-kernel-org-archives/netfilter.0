From: Alexander Kolesnik <Alexander.Kolesnik@awanti.com>
Subject: ulog: losing packets
Date: Fri, 27 Feb 2009 17:26:54 +0300
Message-ID: <547716004.20090227172654@awanti.com>
Reply-To: Alexander Kolesnik <Alexander.Kolesnik@awanti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

We're accounting traffic for users by ULOG-ipcad chain. Some time ago
I've found that some of users traffic does not appear in ipcad. To
check that this is not ipcad's problem I've installed ulogd and found
following in its log:
Fri Feb 27 15:25:56 2009 <3> ulogd.c:487 ulogd Version 1.22 starting
Fri Feb 27 15:25:56 2009 <5> ulogd.c:766 initialization finished, entering main loop
Fri Feb 27 15:27:00 2009 <7> ulogd.c:777 ipulog_read == -1! ipulog_errno == 6, errno = 105
Fri Feb 27 15:27:02 2009 <7> ulogd.c:777 ipulog_read == -1! ipulog_errno == 6, errno = 105
...

I have following settings for ulog and other stuff:
/etc/modprobe.conf:
options nf_conntrack hashsize=2097152
options ipt_ULOG nlbufsiz=65535 flushtimeout=100

# sysctl -a|grep rmem
net.ipv4.tcp_rmem = 4096        87380   174760
net.core.rmem_default = 221184
net.core.rmem_max = 4194304

/etc/ulogd.conf:
rmem=442368
bufsize=1000000

/etc/ipcad.conf:
buffers = 4194304;

# uname -a
Linux host.mydomain 2.6.20.20-2 #2 SMP Mon Oct 15 15:26:52 MSD 2007 i686 i686 i386 GNU/Linux

# free
             total       used       free     shared    buffers     cached
Mem:       1033124     980912      52212          0      83132     507860
-/+ buffers/cache:     389920     643204

Please, let me know what should be tuned to fix this problem!

Thanks in advance!

-- 
Alexander

