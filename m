From: "Benny Butler" <benny.butler@nexusitg.com>
Subject: Multiple source question
Date: Wed, 19 Jun 2002 08:31:57 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <000101c21795$aff6d3b0$0205a8c0@maxima>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Ok, after much hacking together the rule below I finally get the machine
at 192.168.2.70 to access 10.46.210.5.  Great, but if I run the same
rule on any more internal IP addresses, still only 2.70 works.  I'm
pretty sure after reading the docs that my problem is because my rule is
being matched and it's not allowing anything after the first.  I got
desperate and tried -A PREROUTING and -A FORWARD and -j ACCEPT, none of
which helped (usually made it worse.)

I also tried multiple source addresses in one rule, but either that's
not acceptable or it's not , or ; delimited.

And you may ask why sudo, it's cause this whole thing runs out of a php
script as the apache user.

Does anyone have any tips for this?

Thanks


sudo /sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.70 -d /
10.46.210.5 -p tcp --dport 80 -j MASQUERADE



[root@localhost html]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  tcp  --  192.168.2.70         10.46.210.5        tcp
dpt:http

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@localhost html]#




 
_______________________
Benny Butler
334-340-8345
http://www.nexusitg.com


