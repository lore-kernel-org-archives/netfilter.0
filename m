From: ha do <haloha201@yahoo.com>
Subject: Help!!! iptables hashlimit
Date: Wed, 14 Jul 2010 01:03:34 -0700 (PDT)
Message-ID: <4694.23493.qm@web32402.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1279094615; bh=1y2CZOH8HLH05CXHsw7oLrJy3/6JI2ea6jqXhfvRuX4=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=TpFT5CSr0FjAndaaidS7Wx8fANZTLznPxCuIj+wjzKYcj0f1kDu7sJLyFjTJdMgUnYOsGX/8YrwA7er/b1CdHnBAjuVC5zyYFNophFepMf0KaZ84/tnt5OERRnHSUlsdDpVBHT+n8G6ECxNcCo+n+pzm0Du/2Ypl1IDRkBbwxtQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi all

i just setup the hashlimit for SIP REGISTER on iptables and the rule is:
-A  INPUT -p udp -i eth0 --dport 5060 -m hashlimit --hashlimit 1/minute  
--hashlimit-burst 2 --hashlimit-mode srcip,srcport  --hashlimit-name  "cucku" -m 
string --string "REGISTER sip:" --algo bm --to 80 -j ACCEPT

so   from my understand the IPTABLES will let 2 REGSITER packets per minute
so when i use the xlite to  send the RESGISTER message , the first REGISTER 
packet is accepted but  the seconds REGISTER packet is blocked by iptables

[root@centos  ~]# uname -a
Linux centos 2.6.18-128.el5PAE  #1 SMP Wed Jan 21 11:19:46  EST 2009 i686 i686 
i386 GNU/Linux

i want the iptables just to  accept 2 REGISTER packets per minute on per IP 
address:port
please  help

Thank  you


      
