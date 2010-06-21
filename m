From: Zhu Jing <shadowarrx@gmail.com>
Subject: noob question howto using iptables limit ip access times
Date: Mon, 21 Jun 2010 19:30:32 +0800
Message-ID: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=acBRhK2c7sKIzU0sm7aw/hMX1daIrrvmWf4ZBrxzhD4=;
        b=NgKwrMKqnHtC4Nkqi0GF/vKi243ViMwyLTGj5A7l1+Mih6/Wq/xUlgkweeLhcbdcVp
         RgTtpF4mJW2tKn6n5/YQlf0Rqov/CT8lmyBgireIZQ2btRoD0iYYqurJUeQgAXc8b3lc
         46lJSjOgP15P4ltt20pw3+BP0HnZZ0YkuejqQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi ,all

 My aim is limit ip access to my squid server with 1000 times per day.
If this ip connections counts more then 1000,iptables will drop it.

 I have google a lot,and write a wired scripts :P

===========
    #!/bin/sh
   iptables -F
   iptables -X
   iptables -Z
   iptables -N squid
   iptables -A INPUT -p tcp --dport 80 -j squid
   iptables -A squid -m limit --limit 1/hour --limit-burst 1000 -j RETURN
   iptables -A squid -j DROP
   service iptables save
  service iptables restart
==========

   iptables -A squid -m limit --limit 1/hour --limit-burst 1000 -j RETURN

   IMO: this rule means ,the limit-burst token bucket is set to 1000
initially, for each hour token count goes up by 1, when token bucket
is empty---> not match --> go next rule
   But,  I tested it by using IE refresh my server , when i refresh
more then 7 or 8 times ,iptables going to drop my connections, why?

  CentOS4.6,kernel 2.6.9,iptables v1.3.5
  Im so sorry for my bad English,hope your understand what i was saying
  Any reply, webslink, experience ,doc and tools  are highly appreciable!!



  Regards
