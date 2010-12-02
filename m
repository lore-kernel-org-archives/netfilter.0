From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Forward ssh to an internal server not working
Date: Thu, 2 Dec 2010 04:02:30 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012020401560.29349@obet.zrqbmnf.qr>
References: <241512.372.qm@web62506.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <241512.372.qm@web62506.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Landy Landy <landysaccount@yahoo.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-02 03:35, Landy Landy wrote:

>Hello.
>
>Can someone please tell me why I cannot access a machine inside my LAN from outside? These are my rules to try to accomplish that task:
>
>$iptables -t nat -A PREROUTING -i $EXT_IFACE -p tcp \
>        -s $UNIVERSE --sport $UNPRIVPORTS -d $EXT_IP --dport 22 \
>        -j DNAT --to-destination 172.16.0.200:22
>
>$iptables -A FORWARD -i $EXT_IFACE -o $LAN_IFACE -p tcp \
>        -s $UNIVERSE --sport $UNPRIVPORTS -d 172.16.0.200 --dport 22 \
>        -m state --state NEW -j ACCEPT
>
>$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>What am I doing wrong?
>
>When I try to ssh from outside our network I can see it gets to the prerouting but, nothing gets forwared:
>
>Chain PREROUTING (policy ACCEPT 1223 packets, 93798 bytes)
> pkts bytes target     prot opt in     out     source               destination         
>  374 19224 REDIRECT   tcp  --  eth0   *       172.16.0.0/16        0.0.0.0/0           tcp spts:1024:65535 dpt:80 redir ports 3128 
>    0     0 REDIRECT   tcp  --  eth0   *       172.16.0.0/16        172.16.0.1          tcp spts:1024:65535 dpt:8080 redir ports 80 
>    0     0 REDIRECT   tcp  --  eth1   *       0.0.0.0/0            190.80.4.42         tcp spts:1024:65535 dpt:8080 redir ports 80 
>    3   180 DNAT       tcp  --  eth1   *       0.0.0.0/0            190.80.4.42         tcp spts:1024:65535 dpt:22 to:172.16.0.200:22 

This spts thing. It's redundant and does not protect anything.
