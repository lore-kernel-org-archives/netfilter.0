From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: transfer Bytes Counting
Date: Tue, 01 Oct 2002 15:50:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPIEMKDAAA.stewart.thompson@shaw.ca>
References: <001301c2692a$f1df95a0$7cfcc5cb@humanpc>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <001301c2692a$f1df95a0$7cfcc5cb@humanpc>
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
To: HareRam <hareram@sol.net.in>, netfilter@lists.netfilter.org

Hi Hare:

	Always CC the list so that other people can
help you out as well. I don't do redirect with any of the machines
that I Administer. However, you seem to be loading a lot of modules
for the simple rules you are using. Perhaps you have plans for them
in the future. Hopefully Antony will jump in here and add to this advice.

	Make a user defined chain for each on of your subnets.
Also, if your looking for security, which you should be if this accesses
the Internet. Flush all your chains, and set your policies to DROP.
Anyway, getting back to your question. I was thinking of something like.

/sbin/iptables -N NET1CHAIN
/sbin/iptables -A NET1CHAIN -s 192.168.20.11 -j REDIRECT --to-port 3129
/sbin/iptables -A NET1CHAIN -s 192.168..20.22 - j REDIRECT --to-port 3129
/sbin/iptables -A NET1CHAIN -s 192.168.20.33 -j REDIRECT --to-port 3129

sbin/iptables -N NET2CHAIN
/sbin/iptables -A NET2CHAIN -s 192.168.3.11 -j REDIRECT --to-port 3129
/sbin/iptables -A NET2CHAIN -s 192.168.3.22 - j REDIRECT --to-port 3129
/sbin/iptables -A NET2CHAIN -s 192.168.3.33 -j REDIRECT --to-port 3129

/sbin/iptables -t nat -A PREROUTING -s 192.168.20.0/24 -p tcp --dport 80 -j
\
NET1CHAIN
/sbin/iptables -t nat -A PREROUTING -s 192.168.3.0/24 -p tcp --dport 80 -j \
NET2CHAIN
/sbin/iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j
MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o eth0 -j MASQUERADE
-------------------

	If this is going to be involved, there are applications that might
be better suited for keeping track of packets. Since it appears you are
redirecting
to a proxy. It may be a better place to do the packet counting. Hope that
helps.
	I am sure some other people will jump in with better suggestions.

Stu.........



-----Original Message-----
From: HareRam [mailto:hareram@sol.net.in]
Sent: October 1, 2002 2:14 AM
To: stewart.thompson@shaw.ca
Subject: Re: transfer Bytes Counting

Hi Stewart

thanks for ur responce, it really help full
but iam using like follow config
------------------------
m=modprobe
$m ip_conntrack_ftp
$m ip_conntrack_irc
$m ip_conntrack
$m ip_nat_ftp
$m ip_nat_irc
$m ip_queue
$m iptable_filter
$m iptable_mangle
$m iptable_nat
$m ip_tables
$m ipt_limit
$m ipt_LOG
$m ipt_mac
$m ipt_mark
$m ipt_MARK
$m ipt_MASQUERADE
$m ipt_MIRROR
$m ipt_multiport
$m ipt_owner
$m ipt_REDIRECT
$m ipt_REJECT
$m ipt_state
$m ipt_tcpmss
$m ipt_TCPMSS
$m ipt_tos
$m ipt_TOS
$m ipt_unclean
/sbin/iptables -F
/sbin/iptables -F -t nat
/sbin/iptables -t nat -A PREROUTING -s 192.168.20.0/24 -p tcp --dport 80 -j
REDIRECT --to-port 3129
/sbin/iptables -t nat -A PREROUTING -s 192.168.3.0/24 -p tcp --dport 80 -j
REDIRECT --to-port 3129
/sbin/iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j
MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o eth0 -j MASQUERADE
-------------------

[root@catcable root]# iptables -L PREROUTING -n -v -t nat
Chain PREROUTING (policy ACCEPT 976 packets, 114K bytes)
 pkts bytes target     prot opt in     out     source
destination
  484 23232 REDIRECT   tcp  --  *      *       192.168.20.0/24
0.0.0.0/0          tcp dpt:80 redir ports 3129
    0     0 REDIRECT   tcp  --  *      *       192.168.3.0/24
0.0.0.0/0          tcp dpt:80 redir ports 3129
--------------

how do i see each ip bytes in and out , how can i insert command to each ip
traffic

iam using this for transparent proxy which is diverting to cache server
which is running on port 3129

thanks for the help in advance

hare


----- Original Message -----
From: "Stewart Thompson" <stewart.thompson@shaw.ca>
To: "HareRam" <hareram@sol.net.in>; <netfilter@lists.netfilter.org>
Sent: Tuesday, October 01, 2002 2:11 PM
Subject: RE: transfer Bytes Counting


> Hi Hare:
>
> Here is one way that was originally suggested by Antony Stone on the list.
>
> <Begin Quote>
>
> In my FORWARD chain, instead of ACCEPTing packets which are ESTABLISHED or
> RELATED, I send them to a user-defined chain called for example PKTCOUNT
>
> Then the PKTCOUNT chain contains rules like this:
>
> iptables -A PKTCOUNT -s 11.22.33.44 -j ACCEPT
> iptables -A PKTCOUNT -s 11.22.33.55 - j ACCEPT
> iptables -A PKTCOUNT -s 11.22.33.66 -j ACCEPT
>
> and so on, for each of the IP addresses you're interested in.   You could
of
> course use -d if you're more interested in destination addresses, or use
> both.
>
> Then the command iptables -L PKTCOUNT -n -v will show you the number of
> packets and the number of bytes which have matched on each rule in this
> chain
> - ie the number which matched each IP address.
>
> I actually have a cron job to do this once a minute and record all the
> numbers to an IP log file, which I can then parse with a Perl program to
> produce some pretty graphs. I'm sure mrtg could do this if you wanted to
> use that instead.
>
> I guess if you've already created a set of SNAT or DNAT rules to do the
> translations you want, then you probably don't even need to create the
> PKTCOUNT chain - just try doing iptables -L PREROUTING -n -v -t nat and it
> will tell you how many packets and bytes got translated by each rule.
>
> <End Quote>
>
> Hope that helps.
>
> Stu....
>
>
>
>
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of HareRam
> Sent: September 30, 2002 10:12 PM
> To: netfilter@lists.netfilter.org
> Subject: transfer Bytes Counting
>
> Hi all
>
> iam using IPtables since long
> now i have new requirement in my network
> i sould like to count tranfer bytes In/Out for individual IP or MAC
address
> could any give me small examples, how can i do this rather i achive this
>
> thanks in advance
>
> hare
>
>
>


