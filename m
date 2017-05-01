From: Darshan Ghumare <darshan.ghumare@gmail.com>
Subject: ulogd start script
Date: Mon, 1 May 2017 11:28:29 +0530
Message-ID: <CAOr=3U_-b4Az0MpU3RTt3_R6MMhCFbNUDTZMFQg0kVQxaBSdxA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1sHbBrczMZvhXvh2glCs4HeFw1DylmmbpzeAh4to+fk=;
        b=g/DlsfoaEavEtdBIDXhhHDjWD8dRZQqK1IDGegunzkkPdR5bb3YeqsARiNGuRsPVb4
         XDqCubrJ+svzz0tBbJxSa+3o4dQKoEGTmpTP/f/6CufVs+HAWBUVpy1YROfNEbWSqJe6
         7f5oLkWBRjbugjOg2selOuWzWc84GtIrinO8JDTo05SKbGLaE1vQ4PVVWlgf5E+tv607
         V03dduRiJ6tpNo8VoH/s/XQyQOMVDjoBVg3QyUI+ea4b3DD1ZT3q5IARaFW8Qz3G3qXa
         oQElvZiryJi+D9TWoDNdyzgkwKKxVE5G5vFcX+BYHXTD8jvi6He72g6aZXMPZ6cKisel
         xxFQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

Hi,

When I trying to run ulogd using  init script I am getting error but
run without it (ulogd -d) there wasn't any problem. Please help me to
understand,

service ulogd start; tailf /var/log/ulogd/ulogd.log

Starting ulogd:  [  OK  ]

Sun Apr 30 22:49:51 2017 <5> ulogd.c:940 building new pluginstance
stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'

Sun Apr 30 22:49:51 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctnetlink

Sun Apr 30 22:49:51 2017 <7> ulogd.c:910 error starting `ct2'

Sun Apr 30 22:49:51 2017 <8> ulogd.c:1543 not even a single working plugin stack

^C

[root@darshan-2 ulogd]# ulogd -d

[root@darshan-2 ulogd]# tailf /var/log/ulogd/ulogd.log

Sun Apr 30 22:48:16 2017 <5> ulogd.c:940 building new pluginstance
stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'

Sun Apr 30 22:48:16 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctnetlink

Sun Apr 30 22:48:16 2017 <7> ulogd.c:910 error starting `ct2'

Sun Apr 30 22:48:16 2017 <8> ulogd.c:1543 not even a single working plugin stack

Sun Apr 30 22:49:51 2017 <5> ulogd.c:940 building new pluginstance
stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'

Sun Apr 30 22:49:51 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctnetlink

Sun Apr 30 22:49:51 2017 <7> ulogd.c:910 error starting `ct2'

Sun Apr 30 22:49:51 2017 <8> ulogd.c:1543 not even a single working plugin stack

Sun Apr 30 22:51:40 2017 <5> ulogd.c:940 building new pluginstance
stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'

Sun Apr 30 22:51:40 2017 <5> ulogd_inpflow_NFCT.c:1399 NFCT plugin
working in event mode


Thanks,
Darshan Ghumare
