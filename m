From: Victor Julien <victor@nk.nl>
Subject: help with setting up iptables for use with snort_inline (QUEUE target)
Date: Thu, 1 Jul 2004 16:56:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011656.01529.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@lists.netfilter.org>

Hi all,

I have a question about setting up iptables so I can send selected traffic =
to=20
snort_inline using the QUEUE target.

I'm writing a soon to be released (GPL) frontend to iptables. I'm adapting =
it=20
now to support the QUEUE target for use with snort_inline. I want to give=20
users the possibility to for example send only http traffic to snort_inline=
=20
and let iptables handle the other traffic.

So normal my rules are like this (simplified):

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT

So a connection is accepted by the second rule and after that handled by th=
e=20
first.

Well now the problem. When i want to send packets to the QUEUE target the=20
above setup does not work. Because i don't want all traffic to go to=20
snort_inline, i cant change the target of the established,related rule to=20
QUEUE.

I found a solution which works not entirely as i want. The following exampl=
e=20
will send http to snort, pop3 will be handled by iptables itself.

iptables -t mangle -A OUTPUT =A0-p tcp --dport 80 -j MARK --set-mark 0x1

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -m mark --mark 0x1 =
=2Dj=20
QUEUE
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW -j QUEUE
iptables -A OUTPUT -p tcp --dport 110 -m state --state NEW -j ACCEPT

Well this works... but not for ftp. Iptables has as you know a special help=
er=20
module for ftp. I don't know how i can make ftp play well in this setup.=20
Because the ftp connection opens other ports i can't use the mark ftp=20
connections like this.

So... any ideas, suggestions?

BTW if in any way possible i want my application to work with an unpatched=
=20
Debian Woody kernel...

Regards,
Victor

