From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problems with nat
Date: Sat, 16 Nov 2002 13:58:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211161358.00487.netfilter@newkirk.us>
References: <3DD29634.8000606@iatp.org>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DD29634.8000606@iatp.org>
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
To: Rahul Jadhav <rahul@iatp.org>, netfilter@lists.netfilter.org

On Wednesday 13 November 2002 01:13 pm, Rahul Jadhav wrote:
> please check the attachment...
>
> Thanks
> Rahul

Regarding your DNAT/SNAT issues, I suggest reading through Oscar's tutori=
al at=20
http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATTARGET=
=20
where he explores your situation pretty precisely, forwarding HTTP from E=
XTRA=20
and INTRA, and making sure responses are directed properly.  You also see=
m to=20
have some problems in FORWARD, which I comment on below.


grep =3D and grep FORWARD give us:

RTRIP=3Drouter's ip
EXTIP=3Dexternal eth ip
INTIP=3Dinternal eth ip
HTTPSERVER=3D"http server ip"
MAILSERVER=3D"mail server ip"
SSHSERVER=3D"ssh server ip"
UNPRIVPORTS=3D"1024:65535"
INTRA_DEV=3D"internal eth"
EXTRA_DEV=3D"external eth"
INTRA_IP=3D"internal ip"
EXTRA_IP=3D"external ip"
INTRA_LAN=3D"internal lan"
PUBLIC_IP=3D"public ip of the router"

## FORWARD-Chain  ## (everything that passes the firewall)
$IPTABLES -A FORWARD -m state --state INVALID -j LOG_INVALID
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p tcp -j CHECK_BAD_FLAG
$IPTABLES -A FORWARD -o $EXTRA_DEV -j SMB
$IPTABLES -A FORWARD -o $EXTRA_DEV -p tcp -i $INTRA_DEV -d $UNIVERSE -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -p udp -i $INTRA_DEV -d $UNIVERSE -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $HTTPSERVER -p tcp --sport 80 -j AC=
CEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $HTTPSERVER -p udp --sport 80 -j AC=
CEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $HTTPSERVER -p tcp --sport $UNPRIVP=
ORTS=20
-j ACCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $HTTPSERVER -p udp --sport $UNPRIVP=
ORTS=20
-j ACCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 25 -j AC=
CEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 110 -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 109 -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 143 -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 81 -j AC=
CEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p udp --sport 81 -j AC=
CEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport $UNPRIVP=
ORTS=20
-j ACCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p udp --sport $UNPRIVP=
ORTS=20
-j ACCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $MAILSERVER -p tcp --sport 389 -j A=
CCEPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $SSHSERVER -p tcp --sport 82 -j ACC=
EPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $SSHSERVER -p tcp --sport 83 -j ACC=
EPT
$IPTABLES -A FORWARD -o $EXTRA_DEV -s $SSHSERVER -p tcp --sport 22 -j ACC=
EPT
$IPTABLES -A FORWARD -i $INTRA_DEV -o $EXTRA_DEV -s $INTRA_LAN -p tcp --s=
port=20
$UNPRIVPORTS -j ACCEPT
$IPTABLES -A FORWARD -i $INTRA_DEV -o $EXTRA_DEV -s $INTRA_LAN -p udp --s=
port=20
$UNPRIVPORTS -j ACCEPT
$IPTABLES -A FORWARD -i $INTRA_DEV -o $EXTRA_DEV -s $INTRA_LAN -p icmp -j=
=20
ACCEPT
$IPTABLES -A FORWARD -i $EXTRA_DEV -p tcp -m state --state ESTABLISHED -j=
=20
ACCEPT
$IPTABLES -A FORWARD -i $EXTRA_DEV -p udp -m state --state ESTABLISHED -j=
=20
ACCEPT
$IPTABLES -A FORWARD -i $EXTRA_DEV -p tcp -m state --state RELATED -j ACC=
EPT
$IPTABLES -A FORWARD -i $EXTRA_DEV -p udp -m state --state RELATED -j ACC=
EPT
$IPTABLES -A FORWARD -i $EXTRA_DEV -p icmp -m state --state RELATED -j AC=
CEPT
$IPTABLES -A FORWARD -p tcp --dport 80 -d $HTTPSERVER -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 80 -d $HTTPSERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 80 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 80 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 81 -d $MAILSERVER -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 81 -d $MAILSERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 81 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 81 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 22 -d $SSHSERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 82 -d $SSHSERVER -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 82 -d $SSHSERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 83 -d $SSHSERVER -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 83 -d $SSHSERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 82 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 82 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 83 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 83 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 22 -d $EXTRA_IP -j ACCEPT
$IPTABLES -A FORWARD -j LOG_DROP
## Port-Forwarding (--> Also see chain FORWARD)

Where do you define $UNIVERSE?  You are referring here to user-defined ch=
ains=20
that are not defined, like CHECK_BAD_FLAG and SMB.  I assume you DO defin=
e=20
them, just didn't include them?  With ALL TCP going through CHECK_BAD_FLA=
G=20
(except EST/REL, caught just before) the contents of that chain could be=20
rather important in trying to find problems.  The same for SMB where=20
everything outbound from your LAN to the internet is filtered...

Your second FORWARD rule allows all EST/REL traffic through, regardless o=
f=20
source or destination.  This is normally OK, but makes the five state rul=
es=20
further down rather pointless.  (they could also be condensed, unless you=
 are=20
using them as counters, but aren't ever matched as it stands)  But you do=
n't=20
follow up by allowing new HTTP or DNS traffic from the LAN to your server=
s. =20
-o $EXTRA_DEV -i $INTRA_DEV should allow local machines to browse the=20
internet, but doesn't address local machines trying to connect to your=20
servers.  -p tcp --dport 80 -i $INTRA_DEV -d $HTTPSERVER, for example, sh=
ould=20
match them.

Also, I'd suggest that rather than test for "--sport $UNPRIVPORTS" you te=
st=20
for allowed destination ports only.  IE, for HTTP forwarding, use "--dpor=
t=20
80", etc.  Otherwise you let ANY traffic through, as long as it's source =
port=20
is over 1024.  =20

j


