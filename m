From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Trying to restore to default script
Date: Thu, 9 Feb 2006 09:58:27 +0100 (CET)
Message-ID: <58486.193.173.147.3.1139475507.squirrel@webmail.sterenborg.info>
References: <d27cd2010602072210i437dc960o@mail.gmail.com>
	<20060208111219.89137.qmail@web36103.mail.mud.yahoo.com>
	<d27cd2010602082307y65089d17g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010602082307y65089d17g@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, February 9, 2006 08:07, ludi wrote:
> #!/bin/sh
> HOME_ADDR=3D
>
> iptables -F OUTPUT
> iptables -F INPUT
> iptables -F FORWARD
>
>
> #INPUT CHAIN :ACCESS SSH ,DROP ALL
> iptables -A INPUT -p udp -i eth0 -s 0/0 -d $HOME_ADDR --dport 53 -j ACC=
EPT
> iptables -A INPUT -p tcp -i eth0 -s 0/0 -d $HOME_ADDR --dport 22 -j ACC=
EPT
> iptables -A INPUT -p udp -i eth0 -s 0/0 -d $HOME_ADDR --sport 53 -j ACC=
EPT
> iptables -A INPUT -p tcp -i eth0 -s 0/0 -d $HOME_ADDR --dport 80 -j ACC=
EPT
> iptables -A INPUT -p icmp -i eth0 -s 0/0 -d $HOME_ADDR -m limit
> --limit 6/m --limit-burst 6 -j ACCEPT
> iptables -A INPUT -i lo -s 0/0 -d 127.0.0.1/32 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -P INPUT DROP

I would move these last 3 lines to the top of the script :
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -s 0/0 -d 127.0.0.1/32 -j ACCEPT

You want to DROP everything before your rules have been setup.
Also, most packets are likely to the "ESTABLISHED,RELATED" rule so you wa=
nt
that to be one of the first rules to match to speed things up.
Interface lo also receives a lot of traffic (well, here is does) and that=
's
why I'd move that one too.
You may want to add "-m state --state NEW" to the other rules.

> iptables -A OUTPUT -o lo -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -o eth0 -s $HOME_ADDR -j ACCEPT
> iptables -P OUTPUT DROP

Same here : move the policy rule to the top and add :
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


Gr,
Rob



