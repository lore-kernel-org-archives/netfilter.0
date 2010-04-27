From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: threaded interrupt handler
Date: Tue, 27 Apr 2010 21:57:36 +0530
Message-ID: <q2pcfeab66d1004270927we59dd900hc6fb90cb7c1ecf6b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=hulZTvyctf15pRLzej8vEWngQKQs+19680YszcGLiKA=;
        b=Zu2OLxWicjRCYEBmJxWqnJAoYVbqMYlwqbef9vtkMUI4gta/AbL3KS6mYZ1SBJWfLH
         yqqGJA2oL+DKr2fkCo6QFntpCh0u7+5tuuc/P1rJS1Wkoy1SF6p+XWrnaIS5Hmwk/FhE
         Okey/ijUiyVJb0b+I+mwQNQsieePP9kCiTSRY=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, netfilter@vger.kernel.org

Top half of  interrupt is implemented as kernel thread  in my embedded
linux  , this act as a Home  Router . It has a wan -interface (eth1 )
and lan-interface t( eth0 )

https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO
http://lwn.net/Articles/302043/


1. if i flood packets on my wan network interface , i can see cpu
utilization of  ksoftirq-rx ( kernel thread ) goes high . But  irq-rx
( kernel thread ) cpu utilization remains same . Why is it so ?


2 . I  modified static priority of  ksoftirq-rx  ( using renice )  to
+19 and  my user space application ( say app-x ) is made -19 . But
still my app-x wont get any cycles ??


3 . How do i set scheduling algorithm of all processes and threads to
Round Robin . So that my app-x would get some processor cycles ?
    Should i individually set  scheduling algorithm for each process ?


thanks,
ratheesh
