From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problem with forward and iptables (added one more prob in here)
Date: Wed, 3 Jul 2002 19:05:13 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703180517.YAEQ4626.mta02-svc.ntlworld.com@there>
References: <20020703163907.99011.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020703163907.99011.qmail@web9904.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Wednesday 03 July 2002 5:39 pm, "J=F6rgen" Danielsson wrote:

> Thanks for the reply
>
> I asked the company earlier why they don't put it on
> the 172 net they have aswell, the explanation will be
> abit too long to get here, but the answer is that they
> must have a real c-net behind the firewall since they
> are connected to another net aswell that requires real
> ips (short version).
>
> And they don't want the iii.iii.iii.iii net to be
> accessible from the outside, thats why i am stuck.

Okay, I'll accept that you have some frustrating reasons why things just ha=
ve=20
to be this way.

Here's a suggestion for how to solve things:

iptables -A PREROUTING -i eth1 -t nat -d iii.iii.iii.0/24 -j DROP

*before* the rule which says

iptables -A PREROUTING -t nat -d ooo.ooo.*17.*54 -p tcp --dport 25 -j SNAT =

--to iii.iii.iii.*15:25

These rules will:

1. Drop any incoming packets originally addressed to iii.iii.iii.iii IPs
2. Translate packets for ooo.ooo.17.54 port 25 to iii.iii.iii.15

Forwarding remains the same.

=20

Antony.


