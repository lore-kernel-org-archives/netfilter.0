From: "U. George" <netbeans@gatworks.com>
Subject: Re: iptable: obtaining list of tables?
Date: Thu, 25 Feb 2010 18:45:36 -0500
Message-ID: <4B870BA0.7030706@gatworks.com>
References: <4B86EDE6.8000302@gatworks.com> <Pine.GSO.4.64.1002252214190.21439@mail.time-domain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.64.1002252214190.21439@mail.time-domain.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: andy thomas <andy@time-domain.co.uk>
Cc: netfilter@vger.kernel.org

As far as I can tell - no. Docs says it just list chains. sample try, 
suggests that only the default table is used to list a -t "" .

BTW: if u dont use -L -n, the chain is silently ignored - ;-(

===========================================
[root@MyLaptop gat]# /sbin/iptables  -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

[root@MyLaptop gat]# /sbin/iptables -t nat -A POSTROUTING -o eth0 -j 
MASQUERADE

[root@MyLaptop gat]# /sbin/iptables  -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

[root@MyLaptop gat]# /sbin/iptables -t nat -L -n

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

[root@MyLaptop gat]# /sbin/iptables -t nat -L

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@MyLaptop gat]#
===========================================
