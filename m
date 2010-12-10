From: Mehmet Sezgin <mehmetsez@yahoo.com>
Subject: Netfilter packet receive problem from queue
Date: Fri, 10 Dec 2010 01:48:33 -0800 (PST)
Message-ID: <961845.11441.qm@web120411.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1291974513; bh=AUAyxZt6p91GVb3frA8oMap53rXE6k0eSTska8A5SyI=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=VznkMAgWaR6q8i3ZW/memOfjCR90/1VvwDbkMl5KYVVwzp7qiF01vPXvB9IerB3GyKheiB2L9csEa+WXYaZrUDfF3pDk8yn1mEpCLhWQOVzNDm7Ib+XK0YxYfwoWhX4Kg5Y1G6/4IWTDXRJV8tgsxdTE00X0zsteOkPUx4lYPjA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys,

I defined two rules in the iptables to queue selected packets for
processing.You can see rules below and iptables -A commands. My java application uses JNI to
access the packets queued by netfilter.
My application can receive packets with destination ip 10.0.0.53 but can
not receive other packets with destination ip 195.87.7.163.
But the packets reach to destination 195.87.7.163 without problem.

Thanks

My system
Kernel 2.6.18-194.el5
Red Hat Enterprise Linux Server release 5.5 (Tikanga)
iptables v1.3.5


first rule:
iptables -A FORWARD -s 10.0.0.52 -p tcp -d 10.0.0.53 -j NFQUEUE -queue-num 1
iptables -t nat -A POSTROUTING -s 10.0.0.52 -d 10.0.0.53 -o eth0 -j MASQUERADE

second rule:
iptables -A FORWARD -p tcp -d 195.87.7.163 -j NFQUEUE --queue-num 1
iptables -t nat -A PREROUTING -p tcp --dport 8050 -j DNAT --to-destination 195.87.7.163:10555
[root@imcp1 ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
NFQUEUE    all  --  10.0.0.52            10.0.0.53           NFQUEUE num 1
NFQUEUE    tcp  --  anywhere             195.87.7.163        tcp dpt:10555 NFQUEUE num 1

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@imcp1 ~]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere            tcp dpt:8050 to:195.87.7.163:10555

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  10.0.0.52            10.0.0.53



      
