From: PayalR <payal@hotpop.com>
Subject: Re: are these enough now?
Date: Sat, 5 Oct 2002 17:09:55 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13507.8325089582$1033818243@news.gmane.org>
References: <200210041218.26636@.> <200210042048.36993@.> <20021004191400.YGEY459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021004191400.YGEY459.mta02-svc.ntlworld.com@there>
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

Hello all,
Thanks a lot for the mails. Well, I will reply to all the mails but first=
=20
here is some more info/problem :)
I tried this script on my dummy server.=20
But I faced 3 problems.

1. I could not ping to any ip/domain name.
I got an error that ping: operation not permitted, even though I had not=20
specifically told it to drop ICMP.

2. I could not resolve host names, even though I had rules for port 53 li=
ke=20
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 953 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 953 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT-i eth0 -p tcp --dport 953 -j ACCEPT
iptables -A OUTPUT-i eth0 -p udp --dport 953 -j ACCEPT
I am using BIND 9.1.3

3. If I give a OUTPUT rule for e.g.,
iptables -A OUTPUT -i eth0 -p tcp --sport 21 -j ACCEPT
I get an error saying I cannot specify -i eth0. It works properly when=20
I remove -i eth0. Is it OK?

I have all the default policies of INPUT, OUTPUT and FORWARD set to drop.

Thanks a lot for helping me out and bye=20
-Payal

