From: Batstru <batstru@email.it>
Subject: Re: again problem with alias / virtual interface
Date: Wed, 21 Jul 2004 12:31:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <b5f12e7f0973881174d3ec37f189a737@82.186.92.90>
Reply-To: Batstru <batstru@email.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Thanks you for suggestion but I shoud have another kind of problem. I thi=
nk
my problem isn't on rules but over somewhere else: as Antony Stone wrote =
I
tryed "iptables -L INPUT -nvx" to see if I get zero packets counts and th=
e
answer of a telnet 82.186.92.91 25 is=20
[root@maya root]# iptables -L INPUT -nvx
Chain INPUT (policy DROP 0 packets, 0 bytes)
pkts bytes target prot opt in out source destination
0 0 ACCEPT tcp -- eth1 * 0.0.0.0/0 82.186.92.91 tcp dpt:25 state
NEW,ESTABLISHED
0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 82.186.92.90
0 0 ACCEPT icmp -- eth1 * 0.0.0.0/0 82.186.92.93
0 0 DROP all -- * * 0.0.0.0/0 0.0.0.0/0
and if I ping 82.186.92.90
[root@maya root]# iptables -L INPUT -nvx
Chain INPUT (policy DROP 0 packets, 0 bytes)
pkts bytes target prot opt in out source destination
9 790 ACCEPT all -- * * 0.0.0.0/0 0.0.0.0/0 state RELATED,ESTABLISHED
2 168 ACCEPT icmp -- eth1 * 0.0.0.0/0 82.186.92.90
I can see that the icmp rule=20
iptables -A INPUT -p icmp -i eth1 -d 82.186.92.90 -j ACCEPT
works but the rule
-A INPUT -i eth1 -p tcp -d 82.186.92.90 --dport 22=20
-m state --state NEW,ESTABLISHED -j ACCEPT
-A OUTPUT -o eth1 -p tcp -s 82.186.92.90 --sport 22=20
-m state --state ESTABLISHED -j ACCETP
is applied but I have zero packets count.
So I tryed with tcpdump: I log into anoher pc and I telnet 82.186.92.91 2=
5.
At local host I=20
try:
[root@maya root]# tcpdump -i eth1 | grep
host91-92.pool82186.interbusiness.it
tcpdump: verbose output suppressed, use -v or -vv for full protocol decod=
e
listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
11:31:41.895811 IP bella.dei.unipd.it.52242 >
host91-92.pool82186.interbusiness.it.smtp: S=20
891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>
11:31:45.257887 IP bella.dei.unipd.it.52242 >
host91-92.pool82186.interbusiness.it.smtp: S=20
891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>
11:31:52.006557 IP bella.dei.unipd.it.52242 >
host91-92.pool82186.interbusiness.it.smtp: S=20
891791967:891791967(0) win 24820 <nop,nop,sackOK,mss 1460>
190 packets captured
291 packets received by filter
0 packets dropped by kernel
I can see that the just the first packet arrives but anything leave my ho=
st.
I don't know why...=20
So I can't understand why with telnet 82.186.92.91 25 iptables -L INPUT -=
nvx
detect that any=20
packet is dropped and anypacket is accepted by the rule. Where packets go=
?
I have also seen that iproute configurtion is correct with=20
ip addr show dev eth1
with the anser
3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:40:f4:62:38:fd brd ff:ff:ff:ff:ff:ff
    inet 82.186.92.90/29 brd 82.186.92.95 scope global eth1
    inet 82.186.92.91/29 brd 82.186.92.95 scope global secondary eth1:1
    inet 82.186.92.92/29 brd 82.186.92.95 scope global secondary eth1:2
    inet 82.186.92.93/29 brd 82.186.92.95 scope global secondary eth1:3
    inet 82.186.92.94/29 brd 82.186.92.95 scope global secondary eth1:4

best regards
marco


--------- Original Message --------
Da: "Aleksandar Milivojevic" <amilivojevic@pbl.ca>
To: "Netfilter User Mailinglist" <netfilter@lists.netfilter.org>
Oggetto: Re: again problem with alias / virtual interface
Data: 20/07/04 21:25

Aleksandar Milivojevic wrote:
[snip]
> -A INPUT -i eth1 -p tcp -d 82.186.92.90 --dport 22=20
> -m state --state NEW,ESTABLISHED
> -A OUTPUT -o eth1 -p tcp -s 82.186.92.90 --sport 22=20
> -m state --state ESTABLISHED
> -A INPUT -i eth1 -p icmp -d 82.186.92.90 -m state --state RELATED
> -A OUTPUT -o eth1 -p icmp -s 82.186.92.90 -m state --state RELATED
I forgot "-j ACCEPT" in all of the above. Sorry for the omission...
--=20
Aleksandar Milivojevic <amilivojevic@pbl.ca> Pollard Banknote Limited
Systems Administrator 1499 Buffalo Place
Tel: (204) 474-2323 ext 276 Winnipeg, MB R3T 1L7=20
--
Email.it, the professional e-mail, gratis per te: http://www.email.it/f
Sponsor:
Vuoi completare i tuoi studi?
Cepu offre una soluzione di insegnamento individuale e personalizzato
Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2617&d=3D200407=
21=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
=20
 Sponsor:
 18 Bottiglie di eccellenti vini Giordano + 7 specialit=E0 alimentari +
1 batteria di pentole da 10 pezzi in acciaio Tutto a met=E0 prezzo!

 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2625&d=3D20040=
721



