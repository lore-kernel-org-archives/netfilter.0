From: manisha s <cdac_manisha@yahoo.com>
Subject: Iptables command failed
Date: Wed, 7 Apr 2004 04:59:31 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040407115931.75869.qmail@web61002.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello All,

I m new to this mailing list and I don't know if
somebody have faced such a problem and may have
answerd to this question.

I m using kernel 2.4.22 and iptables rpm 1.2.7a-2.
I compiled a kernel to support the Network filtering
successfully. But when i issued the following command

iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP

i got the following error

/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
unresolved symbol nf_register_sockopt_Rsmp_f5985dce

/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
unresolved symbol nf_unregister_sockopt_Rsmp_a5c3249c

/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
insmod 
/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o
failed

/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
insmod ip_tables failed

iptables v1.2.7a: can't initialize iptables table
`filter': iptables who? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.


what this error means?do i need to update the iptables
or kernel?

Any help or hint would be appreciated

Thanks in advance
Manisha

__________________________________
Do you Yahoo!?
Yahoo! Small Business $15K Web Design Giveaway 
http://promotions.yahoo.com/design_giveaway/

