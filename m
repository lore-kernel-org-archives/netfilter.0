From: "Marco Strullato" <marco.strullato@inwind.it>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 18:17:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002f01c46dab$e7ea8c80$eb53623e@x>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <3063e504071912106718d992@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

>Where are the RELATED,ESTABLISHED state packets ?

right, I forgot writing these lines:
-A INPUT -p udp -m udp -m state -d 82.186.92.91 --dport 53 --state NEW -j
ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -j DROP

>Also, define "does not work"

Services running at a virtual interface are not availible: rules are not
applied so the firewall drop packets

>look here:

>alex@server:~$ telnet 82.186.92.91 22
>Trying 82.186.92.91...
>Connected to 82.186.92.91.
>Escape character is '^]'.
>SSH-1.99-OpenSSH_3.5p1

>same for .93
>Are you sure the services you want to connect to bind on those ips, or
0.0.0.0 ?
>Check this with netstat -tln |grep <desired port>

Now is ir running another pc at those addresses because I can't stop
services.
I have to set up a new server because now is running on a old hardware.

best regards

marco








On Mon, 19 Jul 2004 20:55:00 +0200, Batstru <batstru@email.it> wrote:
> Hi all!
> I wrote days ago: I have a problem with virutal interface and iptables:
> my pc has 2 network interface, one with a private network address and t=
he
> other one with
> public network addresses:
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.248
> eth1:1 --> 82.186.92.91 / 255.255.255.248
> eth1:2 --> 82.186.92.92 / 255.255.255.248
> eth1:3 --> 82.186.92.93 / 255.255.255.248
> eth1:4 --> 82.186.92.93 / 255.255.255.248
> I have configured network with ifconfig and route
> iptables has this filter rules:
> *filter
> :FORWARD DROP [0:0]
> :INPUT DROP [0:0]
> :OUTPUT DROP [0:0]
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state -i eth0 --state NEW -j ACCEPT
> -A INPUT -s 192.168.1.0 -i eth0 -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 22 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 80 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport
143 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 10000
> --state NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 25 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport
110 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 20 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 21 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 22 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport
25 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 53 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 80 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport
110 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport
143 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport
443 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 20 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 21 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 22 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 25 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 80 --st=
ate
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport
110 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport
143 --state
> NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport
8888 --state
> NEW -j ACCEPT
> as you can see I've tried changing configuration but anything changes: =
it
is
> reported just a
> warning but the rule is not applied.
> -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport
25 --state
> NEW -j ACCEPT
> My pc is running Fedora core 2 and the kernel is 2.6.6 and I've just
> upgraded iptables to last
> release.
>
> The problem is that I can't access to services running at virtual
> interfaces.
> I tried to solve the problem as suggested me: I've seen that using alia=
s
is
> deprecated so I
> tried using iproute: I set up with
> ip addr add 82.186.92.90/24 brd 82.186.92.95 dev eth1 label eth1:0
> ip addr add 82.186.92.91/24 brd 82.186.92.95 dev eth1 label eth1:1
> ip addr add 82.186.92.92/24 brd 82.186.92.95 dev eth1 label eth1:2
> ip addr add 82.186.92.93/24 brd 82.186.92.95 dev eth1 label eth1:3
> ip addr add 82.186.92.94/24 brd 82.186.92.95 dev eth1 label eth1:4
> but after service iptables restart anything changes, alias's rules does=
n't
> be applied and no
> errors is reported.
> I think I'm doing something wrong with iproute but I don't know what:
shoud
> I give any command
> to enable iproute?
>
> My problem is quite strange, I've never seen such....
>
> tnks
> marco
>  --
>  Email.it, the professional e-mail, gratis per te: http://www.email.it/=
f
>
>  Sponsor:
>  Conto Arancio. Zero spese, stessa banca, pi=F9 interessi.
>  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D657&d=3D2004=
0719
>
>




 =0D
 =0D
 --=0D
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f=0D
 =0D
 Sponsor:=0D
 Vuoi cambiare i tuoi interessi ma non la tua banca?=0D
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D656&d=3D20-7

