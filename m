From: Landy Landy <landysaccount@yahoo.com>
Subject: Forward ssh to an internal server not working
Date: Wed, 1 Dec 2010 18:35:09 -0800 (PST)
Message-ID: <241512.372.qm@web62506.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1291257310; bh=zbpe2lmqrLQ3tYJf4hvxD10sBV9a5qtJhrYWEEkRClI=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=aqvMJpJf56ki5nZaRSQK6vSkRVEjopScwRorO/Ce+plSXL8AWQ+QEEGJ/CGW8QITHiuG5CwCOoK3OKqsu/E1joHbGUrJqQu//zH0ClmeqvIYo51UgxXhjHLXky3dpEpl+/SNIr3ngkK/gmMd4E+h4Upffx/bvpoxDM/PvsnezFA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

Can someone please tell me why I cannot access a machine inside my LAN from outside? These are my rules to try to accomplish that task:

$iptables -t nat -A PREROUTING -i $EXT_IFACE -p tcp \
        -s $UNIVERSE --sport $UNPRIVPORTS -d $EXT_IP --dport 22 \
        -j DNAT --to-destination 172.16.0.200:22

$iptables -A FORWARD -i $EXT_IFACE -o $LAN_IFACE -p tcp \
        -s $UNIVERSE --sport $UNPRIVPORTS -d 172.16.0.200 --dport 22 \
        -m state --state NEW -j ACCEPT

$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

What am I doing wrong?

When I try to ssh from outside our network I can see it gets to the prerouting but, nothing gets forwared:

Chain PREROUTING (policy ACCEPT 1223 packets, 93798 bytes)
 pkts bytes target     prot opt in     out     source               destination         
  374 19224 REDIRECT   tcp  --  eth0   *       172.16.0.0/16        0.0.0.0/0           tcp spts:1024:65535 dpt:80 redir ports 3128 
    0     0 REDIRECT   tcp  --  eth0   *       172.16.0.0/16        172.16.0.1          tcp spts:1024:65535 dpt:8080 redir ports 80 
    0     0 REDIRECT   tcp  --  eth1   *       0.0.0.0/0            190.80.4.42         tcp spts:1024:65535 dpt:8080 redir ports 80 
    3   180 DNAT       tcp  --  eth1   *       0.0.0.0/0            190.80.4.42         tcp spts:1024:65535 dpt:22 to:172.16.0.200:22 

Thanks in advanced for your help.


      
