From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie Question - Redirect traffic to internal Web server
Date: Thu, 17 Oct 2002 21:52:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017205206.HEZR27697.mta05-svc.ntlworld.com@there>
References: <1034882656.2076.31.camel@pegasus.gral.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034882656.2076.31.camel@pegasus.gral.com.br>
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
To: netfilter@lists.netfilter.org

On Thursday 17 October 2002 8:24 pm, Fl=E1vio Brito wrote:

> Dear List
>
> I have two servers in my net,one with a valid IP. I want to redirect all
> the HTTP Traffic(external -> internal) to my internal Web server I'm
> trying to learn iptables, but when I test my rules, sometimes when I try
> to erase them it appears not do what I want.

What makes you think that clearing the rules is not working properly ?

> Questions
> 1) I use it to erase my rules. But sometimes without sucess. Bug?
> #erasing rules
> iptables -F

This will flush (erase) all the rules in the filter table of all your chain=
s.

> iptables -F -t nat

This will flush all the rules in the nat table of all your chains.

After these two commands you should not have any rules left in your system =

(unless you created any in the mangle table, which is unlikely....)

> iptables -X

This will delete all your user-defined chains.

> iptables -X -t nat

This command is not necessary.

> iptables -Z

This will zero the byte and packet counters in all chains.   You may want t=
o=20
do this, but it is nothing to do with clearing the rules.

> iptables -Z  -t nat

This will zero the counters in the nat tables.   Again this is nothing to d=
o=20
with clearing the rules.

> 2) To redirect the traffic to my internal server I must have a DNS in my
> FW server?  or only redirect?

DNS is irrelevant as far as redirecting packets is concerned.   If DNS work=
s=20
on your internal network as it is, nothing needs to be changed.   Remember =

that netfilter works on IP addresses, not hostnames, therefore there are no=
=20
DNS lookups required.

>       	[FW]-eth0-> [200.179.213.245]------> Internet
>
> 	|eth1 ->[192.168.1.1]
> 	| ---------------> [Web Server ] 192.168.1.33
> 	|----------------> [LAN Hosts] [192.168.1.2 to 192.168.1.100]
>
> eth0-> 200.179.213.245
> eth1-> 192.168.1.1
>
> Can someone help me with this rules?
>
> iptables -t nat -A POSTROUTING -s 192.168.1.10/24 -d any/0 -j MASQUERADE

Remove the "-d any/0".   It is redundant and reduces legibility.   This rul=
e=20
will source translate all outgoing packets from your network to the Interne=
t=20
to have the external address of your firewall (so that replies can come bac=
k).

> iptables -A INPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT
> iptables -A OUTPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT

You should not be using the INPUT & OUTPUT chains.   These are only for=20
packets addressed to the firewall itself, or generated on the firewall,=20
respectively.

Instead you should use the FORWARD chain for packets going *through* your=20
firewall:

iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.33 -j ACCEPT

(Note also the -d instead of -s : you want to allow packets going *to* the =

web server, therefore it is the destination).

> iptables -A PREROUTING -t nat -p tcp -d 0/0 --dport www -j REDIRECT
> --to-port 80

REDIRECT is only for packets terminating on the firewall machine itself.   =

Try this instead:

iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j SNAT --to=20
192.168.1.33

Note I have added a "-i eth0" so that this rule applies only to packet comi=
ng=20
in via your external interface - otherwise all web requests from your=20
internal network to the Internet would get redirected to your internal serv=
er=20
as well (and that wouldn't work properly for other reasons I won't go into =

now).

Finally you should have a default policy on your INPUT and FORWARD chains:

iptables -P INPUT DROP
iptables -P FORWARD DROP

and you want to allow reply packets to go through your firewall as well:

iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

See how that works out :-)

Antony.

--=20

This is not a rehearsal.
This is Real Life.

