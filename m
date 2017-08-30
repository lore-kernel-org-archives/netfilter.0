From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: NFLOG Performance issues ...
Date: Wed, 30 Aug 2017 23:09:13 +0530
Message-ID: <CAA5aLPgoCdJcFZk0iScnNXNPjv04XbkFEdfAjpwq32u4xd8zPg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jevYB6/KkuS9ktCc5lGp+QMYIAfJ/iQ9gFCLRRCnQPM=;
        b=jdnBdWmoRObude0+1LRZA+EsBUlgAnoNrmVoATfkg9qKTSrnVkYnAyZk2FTThwnZ6W
         SfEmnMXyDugRrCSLJT4dHK4HannsA1nfomTMLMTDcTGUPLLYH6BemtlimD65RWQNvBX6
         YVc3X9cMxk/wM4aFTrbLDPWrtyOdNk1xghYXAUj30BSjlv7pbF/HNITSfUYJravSbdqA
         s0PzKpJfTf6xLqcqc2VFlj56vWo4g6Fwfk9y7cijHBhFY0J7ZBUHDmC+sAP4bzL1CbbC
         gqj/cjzkQAYN5z3htR3D6SZXYgRMpKs5Zo8w5ed782FnpgtCMx+s4XtPxDa+8gNWWZNS
         WLRQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 am using ulogd2 to log iptables activity.
However, when using pgsql as output plugin ... performance is very
very sluggish. (~130-150 entries per second)

To enhance performance I am trying

modprobe ipt_ULOG nlbufsiz=65535 flushtimeout=1000

but this gives error : ipt_ULOG module not found.


On the same lines, I tried

modprobe ipt_NFLOG nlbufsiz=65535 flushtimeout=1000
It didnt give any error !!!

But still there is no increase in performance.
Are these values effective?

I am also using  --nflog-threshold 50 in iptables rule.

I am setting buffer_size as
netlink_socket_buffer_size=104857600
netlink_socket_buffer_maxsize=1048576000

When running ulog, it gives message of setting buffer size as
21708600. Though it didnt give any message like
"ulogd_inppkt_NFLOG.c:443 We are losing events, increasing buffer size
to xxxxxx"
but again why it is only setting buffer size as 21708600 though I have
set in config as 104857600?
