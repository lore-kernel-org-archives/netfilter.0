From: "louie miranda" <lmiranda@chikka.com>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: Thu, 12 Dec 2002 11:11:41 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f301c2a18c$373cf3b0$0b00000a@nocpc3>
References: <014901c2a02a$0dbf59f0$0b00000a@nocpc3> <3DF720D9.7030501@istitutocolli.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Thanks for those people who replied, But still i can't get it to work.
Ill be posting my rule set here.

=======================================
panic:/# iptables -nL --line-num
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination

Chain FORWARD (policy DROP)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
3    LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 0
level 4

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
panic:/#
=======================================
panic:/# iptables -nL --line-num -t nat
Chain PREROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80
redir ports 3128

Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
panic:/#
=======================================

My rule set is just a simple masq w/ port redirection internally, catching
all port 80 request
and redirect it to my squid on port 3128


I tried the simple rule set that Joel Newkirk, Andrea Rossato and all the
people who have
helped me on my problem but still It does not work, I actually set all the
IPTABLES/NETFILTER
options on my kernel and add "1" on /proc/sys/net/ipv4/ip_forward. I
actually search and
search google.com for my similar problem and tried it all, I had no error's
or such all is working
i think. It just does not connect over to my granted port. Ill try any port
even port 80 or port 139
on my firewall just get this forwarding to work.

Well, thanks again. I hope what i have posted here "my rule set" will give
me such nice answers
to resolved my probem, And ill cont. reading and reading any docs i can find
on the internet.



--
thanks,
louie miranda



