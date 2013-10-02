From: Alfonso Caponi <alfonso.caponi@gmail.com>
Subject: iptables, recent module and milliseconds
Date: Wed, 2 Oct 2013 11:15:20 +0200
Message-ID: <CAF3e4iY=M4+akAdEeNmJBbRmPheDkcAqNE+vziPkxWfwwZNHSg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=89dWjcZyvzXgP/ZiimwDSpfgg4m9F1RcKllPXNjGW/8=;
        b=qcWwXZODVXl0X6RzEa4lqN2LPFiMipeH+xibcOFWEYQ9UdSLQjHHQax0vVmVyttsWp
         8/1M9MTHhNg4P/59ToQU70hYmokt5vJLDiISVkTk2eV6pUBFFxKyf/sc5sneyYPzES3v
         0yKGloIcfUXMgkpBB478jVbGI9A/PuNapdNQEMomhjlJ/K6FH95SNqcybLLjysaoUgS+
         b5JoYcmeLn7ydO0hypSshylzt5Ey+pMNK/qfmtASLkuoDeimxXxg7OjelnBKcJBpCfK5
         wPlgHQx/7sgMecPqsc6Cmr3o5qiRw2zu6Agp5m/t5kjX5hmmtVZh3eZYaPY+/vSdTRja
         64FQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I've a particular network enviroment and I use these rules for my DNS
server to limit the clients requests:

/sbin/iptables -N BLACKLIST_53
/sbin/iptables -A BLACKLIST_53 -j LOG --log-prefix "DROP BLACKLIST DNS 53: "
/sbin/iptables -A BLACKLIST_53 -m recent --set --name ip_blacklist_53 -j DROP
/sbin/iptables -N DNS
/sbin/iptables -I DNS 1 -m recent --update --name ip_blacklist_53
--reap --seconds 86400 -j DROP
/sbin/iptables -I DNS 2 -m recent --update --name timer_53 --reap
--seconds 60 --hitcount 20 -j BLACKLIST_53
/sbin/iptables -I DNS 3 -m recent --set --name timer_53 -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 53 -m state --state NEW -j DNS
/sbin/iptables -A INPUT -p tcp --dport 53 -m state --state NEW -j DNS

Ok it seem works fine, but... not works if many requests comes to
distance of thousandths of seconds.
I think recent module uses the seconds as a time window.
The number of entries into /proc/net/xt_recent/ is not corret, so IP
addresses are never banned.

01-Oct-2013 14:07:50.655 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.656 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.656 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.656 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.657 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.657 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.657 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)
01-Oct-2013 14:07:50.658 client 1.2.3.4#49940: query: example.info IN
ANY +ED (192.168.123.123)

I think would be the same using "-m limit --limit 5/s"...

Any tips?
Thank you
