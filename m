From: <david@suarapembaruan.co.id>
Subject: Re: DNS and iptables : is this rule bad ??
Date: Sat, 29 May 2004 20:02:12 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1127.172.16.131.133.1085835732.squirrel@mail.suarapembaruan.co.id>
References: <BAY16-F99Flatq6TnSL0003998f@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F99Flatq6TnSL0003998f@hotmail.com>
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
To: tirixil@hotmail.com
Cc: netfilter@lists.netfilter.org

> Hello,
>
> Here is my problem more simply explained ...
>
> An user (IP address : 10.0.0.1) has a DNS server IP address specified i=
n
> his  configuration (we don't know the address, and maybe this address i=
s
> invalid  so we want to change it with a iptables rules).
>
> His gateway is 10.0.0.254. The gateway has another interface at
> 192.168.100.254 where a DNS server is launch (by named).
> At the gateway, a iptables rule send all his DNS packets at the DNS
> server  (192.168.100.254)
> The rule is :
> iptables -A PREROUTING -t nat -s 10.0.0.1 -p UDP --dport 53 -j DNAT
> --to-destination 192.168.100.254
>
> ** BUT ** this rule is not effective immediately, and take fews minutes
> before to be active !!!
> Same thing if you flush the nat table (iptables -F PREROUTING -t nat ) =
:
> the  last DNS is active during some minutes (sometimes immediately but
> not  systematically)...
>
> To easely see that : just put an invalid DNS server in the configuratio=
n
> of  the client, and a real one at the gateway (192.168.100.254). You
> will see  that rules are not immediately active !!!
>
> Is someone know why ???
>
> Thanks.
> -- Mark
>
> _________________________________________________________________
> Bloquez les fen=EAtres pop-up, c'est gratuit ! http://toolbar.msn.fr




