From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 19:44:51 +0200
Message-ID: <44CE4193.4050603@plouf.fr.eu.org>
References: <44CE313A.4040204@ort.edu.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE313A.4040204@ort.edu.uy>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Ernesto Silva a =E9crit :
>    I'm having a problem to access internet ftp servers from my internal=
=20
> network. I understand the ftp connection but I don't have enough=20
> information about ip_conntrack_ftp and ip_nat_ftp modules, so here is m=
y=20
> situation.
>=20
> I'm using iptables 1.3.3-3, I have the mentioned modules loaded and=20
> wrote the following rules:
>=20
> _fwd=3D"iptables -A FORWARD"
> _nat=3D"iptables -A POSTROUTING"

Same remark as Baltasar about "-t nat" missing in _nat.
Are you sure you understand the FTP protocol ? When reading your=20
ruleset, I doubt it.

> $_fwd -i $INT_IF -p tcp -s $INT_NET --sport 1024: -o $INET_IF --dport 2=
1=20
> -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> $_fwd -i $INET_IF -p tcp --sport 21 -o $INT_IF -d $INT_NET --dport 1024=
:=20
> -m state --state     ESTABLISHED,RELATED -j ACCEPT

You'll never see an FTP control packet (TCP 21) in the RELATED state.

> $_nat -p tcp -s $INT_NET --sport 1024: -o $INET_IF --dport 21 -m state=20
> --state NEW,ESTABLISHED,RELATED -j SNAT --to $INET_NIC

You don't need to care about conntrack states in the nat table : only=20
the first packet of a NEW connection goes through the nat chains.

> Are those rules enough?

No. They only allow FTP control connections, not FTP data connections=20
used for file transfer and directory listing.

 From your ruleset, I understand you want to allow FTP between internal=20
clients and external servers, and nothing else. All right. Be aware that=20
blocking the useful RELATED ICMP may break things, though.

First, FTP is made of a classic TCP control connection from the client=20
to the server on port 21. It means the first packet is NEW and all=20
others are ESTABLISHED, so :

$_fwd -i $INT_IF -s $INT_NET -o $INET_IF -p tcp --sport 1024: \
   --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT
$_fwd -i $INET_IF -o $INT_IF -d $INT_NET -p tcp --sport 21 \
   --dport 1024: -m state --state ESTABLISHED -j ACCEPT

$_nat -o $INET_IF -s $INT_NET -p tcp --sport 1024: --dport 21 \
   -j SNAT --to $INET_NIC

Second, a TCP active or passive FTP data connection is established=20
whenever a file transfer or directory listing is needed. Passive data=20
connections are established from the client to the server with random=20
unprivileged ports on both sides. Active data connections are=20
established from the port 20 of the server to an unprivileged random=20
port of the client. When the ip_conntrack_ftp module is loaded, the=20
first packet is RELATED (instead of NEW without the module), and all the=20
others are ESTABLISHED as usual. So :

# passive mode
$_fwd -i $INT_IF -s $INT_NET -o $INET_IF -p tcp --sport 1024: \
   --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
$_fwd -i $INET_IF -o $INT_IF -d $INT_NET -p tcp --sport 1024: \
   --dport 1024: -m state --state ESTABLISHED -j ACCEPT

# active mode
$_fwd -i $INET_IF -o $INT_IF -d $INT_NET -p tcp --sport 20 \
   --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
$_fwd -i $INT_IF -s $INT_NET -o $INET_IF -p tcp --sport 1024: \
   --dport 20 -m state --state ESTABLISHED -j ACCEPT

No need for any NAT rule, the ip_nat_ftp module will smartly take care=20
of everything automatically.

But IMHO this is a bit overkill. Here's what I'd use :

# that's for any ESTABLISHED and RELATED traffic, not only FTP
$_fwd -i $INT_IF -s $INT_NET -o $INET_IF -m state --state \
   ESTABLISHED,RELATED -j ACCEPT
$_fwd -i $INET_IF -o $INT_IF -d $INT_NET -m state --state \
   ESTABLISHED,RELATED -j ACCEPT

# that's for the first packet of a control connection
$_fwd -i $INT_IF -s $INT_NET -o $INET_IF -p tcp --sport 1024: \
   --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT
$_nat -o $INET_IF -s $INT_NET -p tcp --sport 1024: --dport 21 \
   -j SNAT --to $INET_NIC


Notes about ip_conntrack_ftp and ip_nat_ftp :
1) They only work on plain unencrypted FTP. They don't work on FTPS (FTP=20
encrypted with TLS/SSL).

2) When using FTP control connections on non standard ports (i.e. other=20
than 21), you must specify theses ports (as well as port 21 if used too)=20
in the "ports" parameter of both modules when loading them.

