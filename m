From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Help with POP3/SMTP and MASQ
Date: Mon, 10 Jun 2002 21:21:30 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <003e01c210ee$b2bfa480$020aa8c0@matttm9svd8lrh>
References: <F21XZZTHfyQgeDKvPEk0000a6ad@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Linux Tek <linuxtek2002@hotmail.com>, netfilter@lists.samba.org

To forward incoming connections to boxes on the internal side of the
firewall you must do two things:
1) Create a PREROUTING rule to change the destination address/port.
2) Create a statefull FORWARD rule which allows [NEW] traffic to be routed
to the internal machine

These 2 rules assume that a) your default policies are drop and 2) you have
a statefull rule which allows ESTABLISHED,RELATED traffic in your forward
chain.
It's important to understand that you don't need POSTROUTING rules to
accomplish this.  This is a common mistake (one which I'm sure I made when I
first learnt this too).

Now on to the specifics....

> #rules for ftp in...working right now
>
> iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 20 -j ACCEPT

You don't need the above 2 rules anymore.  You have this covered below.

> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 21 -j DNAT --to
> 10.0.0.7:21
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 20 -j DNAT --to
> 10.0.0.7:20
>
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 21 -j
ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 20 -j
ACCEPT

> #for POP3 and SMTP mail
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 25
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 110
You don't need these.

> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j ACCEPT

You haven't specified a destination address for these rules.  You need
something like you did with FTP:
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25 -j DNAT --to
10.0.0.7
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j DNAT --to
10.0.0.7

> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 110 -j ACCEPT

You should be more specific with your forward rules.  Don't forget to
specify an interface and a destination address (just like you did for FTP).
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 25 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 110 -j ACCEPT

Ideally you would be using state matches for this stuff.  Are you familiar
with this?

> iptables -t nat -A POSTROUTING -p tcp --sport 25 -j ACCEPT
> iptables -t nat -A POSTROUTING -p tcp --sport 110 -j ACCEPT
Don't need these rules.

Goodluck,

Matt



