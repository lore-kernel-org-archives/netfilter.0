From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: No Internet Connection
Date: Fri, 10 Sep 2004 11:41:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4141D921.8020100@pbl.ca>
References: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Giancarlo Boaron wrote:
> INET_IP=`ifconfig eth0 | grep inet | cut -d : -f 2 |
> cut -d ' ' -f 2`

This might not work.  For example, on my home Linux box (FC2) this gives 
the first 2 bytes of link local IPv6 address.  Also, with this approach, 
you must:

a) Make sure this scripts runs *after* dhcpclient configures eth0.

b) Rerun it every time your IP address changes.  There are ISPs out 
there that will let you have same IP address for years, but there are 
some that will force the change of address every day, and there are some 
really bad ones that will force the change every hour.

Anyhow, you don't really need to know this address.  You can use 
something like this on external interface to make sure no spoofing can 
take place (these are private/reserved ranges that should never appear 
on Internet):

-A INPUT -i eth0 -s 192.168.0.0/16 -j DROP
-A INPUT -i eth0 -s 10.0.0.0/8 -j DROP
-A INPUT -i eth0 -s 172.16.0.0/12 -j DROP
-A INPUT -i eth0 -s 169.254.0.0/16 -j DROP
-A INPUT -i eth0 -s 192.0.2.0/24 -j DROP
-A INPUT -i eth0 -s 204.152.64.0/23 -j DROP
-A INPUT -i eth0 -s 224.0.0.0/3 -j DROP
-A INPUT -i eth0 -s 127.0.0.0/8 -j DROP
-A INPUT -i eth0 -d 192.168.0.0/16 -j DROP
-A INPUT -i eth0 -d 10.0.0.0/8 -j DROP
-A INPUT -i eth0 -d 172.16.0.0/12 -j DROP
-A INPUT -i eth0 -d 169.254.0.0/16 -j DROP
-A INPUT -i eth0 -d 192.0.2.0/24 -j DROP
-A INPUT -i eth0 -d 204.152.64.0/23 -j DROP
-A INPUT -i eth0 -d 224.0.0.0/3 -j DROP
-A INPUT -i eth0 -d 127.0.0.0/8 -j DROP

Repeat this for FORWARD chain.

Now if the packet ends up in INPUT (or FORWARD) chains, and is not 
dropped by these rules, it means it is a valid packet.

> /sbin/depmod -a
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
> /sbin/modprobe ipt_REJECT
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp

Most of these will get automatically loaded.  Leave ip_nat_ftp line, and 
delete all the rest.

> $IPTABLES -N tcp_invalidos
> 
> $IPTABLES -A tcp_invalidos -p tcp --tcp-flags SYN,ACK
> SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset
> $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> --state NEW -j LOG \
> --log-prefix "Novo nao SYN:"
> $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> --state NEW -j DROP

Here's the place where you made an error.  When you reach end of 
"tcp_invalidos" chain, default policy for INPUT/OUTPUT/FORWARD chains 
will be applied (which is DROP).  Which means, all packets will be 
dropped by the firewall.

You need to place this line at the end of "tcp_invalidos":

-A tcp_invalidos -j RETURN

Anyhow, better way of doing this is using (for example):

-A INPUT -i eth1 -p tcp --dport some_port --tcp-flags SYN,ACK,FIN,RST 
SYN -m state --state NEW -j ACCEPT

This ensures that the first packet is really SYN packet with no other 
funny flags set.  This way you don't need tcp_invalidos.

> $IPTABLES -A OUTPUT -p all -m state --state
> ESTABLISHED,RELATED -j ACCEPT

I'd place this one as the very first rule (for all three chains).  Vast 
majority of packets is going to match it, and it doesn't make sense in 
forcing 99% of packets to go through any other rules.

I haven't looked at the rest of you rules...

> That's it. Another question: When I configure this
> script to run automatically after rebooting the
> server, I receive this error message (3 times): "Bad
> argument eth0" so the script doesn't work, neither my
> Internet access from my LAN and I can't find where is
> the error.

Because the ifconfig, grep, cut thingie hasn't returned IP address of 
eth0.  I guess in your case it returned eth0.

> However, after rebooting the server and loggin in as
> root, I can run the script from command line. It works
> and my LAN can access the Internet during that short
> time (about 20 minutes. However, I didn't test the
> DHCP rules to ckeck if it continues to happen).

Strange.  It shouldn't work at all...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

