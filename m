From: Akao <technique@akao.fr>
Subject: table "mangling" is missing, but she shouldn' t
Date: Mon, 14 Jun 2004 12:20:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40CD7C01.9050105@akao.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello
I have a linux box , linux-2.4.26 with netfilter (and iptables 1.2.9) 
built in the kernel, with the mangling option.
There aren' t any modules compiled. All is builtin.

"iptables -t mangle -L"
gives :

iptables v1.2.9: can't initialize iptables table `mangle': Table does 
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

and :

"cat /proc/net/ip_tables_names" gives

nat
filter

I have not set any rules for the moment, just activated IP-forwarding 
with "echo 1 > /proc/sys/net/ipv4/ip_forward"

What can be the problem ?

Thanks in advance.
Regards.

Axel


