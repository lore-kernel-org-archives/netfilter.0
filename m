From: Karthik Venkateswaran <Karthik.Venkateswaran@lntinfotech.com>
Subject: RE: iptable: obtaining list of tables?
Date: Fri, 26 Feb 2010 18:44:18 +0530
Message-ID: <C7232BDB534C6241BE85C96D129205D002F40F7BFD@BLRINMSMBX01.bglrodc.lntinfotech.com>
References: <4B86EDE6.8000302@gatworks.com>
 <Pine.GSO.4.64.1002252214190.21439@mail.time-domain.co.uk>
 <4B870BA0.7030706@gatworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B870BA0.7030706@gatworks.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "U. George" <netbeans@gatworks.com>, andy thomas <andy@time-domain.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I agree with you George, atleast it seems there is no mechanism to list the tables.

Apologies for my ignorance, but could you tell me the reason why you would need to list the tables. As far as I know netfilter provides a static list of tables - filter, mangle & nat.

Regards,
Karthik

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of U. George
Sent: Thursday, February 25, 2010 6:46 PM
To: andy thomas
Cc: netfilter@vger.kernel.org
Subject: Re: iptable: obtaining list of tables?

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
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

______________________________________________________________________

This Email may contain confidential or privileged information for the intended recipient (s) If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.

______________________________________________________________________
