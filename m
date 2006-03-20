From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: port forwarding form IP range
Date: Mon, 20 Mar 2006 13:39:20 +0100 (CET)
Message-ID: <55122.193.173.147.3.1142858360.squirrel@webmail.sterenborg.info>
References: <51839.193.173.147.3.1142338364.squirrel@webmail.sterenborg.info>
	<20060320065441.60459.qmail@web50503.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060320065441.60459.qmail@web50503.mail.yahoo.com>
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

On Mon, March 20, 2006 07:54, Nilesh wrote:

> Dear All,
>
> Anyone please help me out.

Nilesh,

I too have work and replying to this list is not really work related, so =
it'll
have to be in the spare time I have.

> Hi Rob
> Sorry Rob and team I couldnot send you the Output of
> IPTABLES because I was on the Vactions Now I am back
> to work.
>
> also I have attached the my rc.firewall file
> Please help me to forward request on 192.168.0.3
> here is the Output

In your script :

INTIP=3D"192.168.0.1/24"
This not your INTIP. It is "192.168.0.1/32".

echo "1" > /proc/sys/net/ipv4/ip_forward
Move this to the end of the script so forwarding will only be enabled whe=
n all
rules are in place.

Personally, I don't have much with scripts looking like these ; there's t=
oo
much comments in them which makes them too large to look into.
I reconstructed the rules from your "iptables -nvL" listing and if I didn=
't
overlook something, the effective ruleset looks like this :

$ipt -P INPUT ACCEPT
$ipt -P OUTPUT ACCEPT
$ipt -P FORWARD ACCEPT

# This is effectively doing the same as having a DROP policy and
#   where the last rule is a LOG rule. Only you reject traffic with
#   icmp-port-unreachable and a DROP policy just DROP's the packet.
# It's debatable which philosophy is better; I prefer a DROP policy.
$ipt -N drop-and-log-it
$ipt -A drop-and-log-it -j LOG --log-level 6
$ipt -A drop-and-log-it -j REJECT --reject-with icmp-port-unreachable

$ipt -A INPUT -i lo -j ACCEPT
$ipt -A INPUT -i eth1 -s 192.168.0.0/24 -j ACCEPT
$ipt -A INPUT -i ppp0 -s 192.168.0.0/24 -j drop-and-log-it

# With this rule you are allowing connections to ANY PORT coming in from =
the
internet (I suppose) to your host.
$ipt -A INPUT -i ppp0 -d 59.59.10.98 -j ACCEPT
$ipt -A INPUT -i ppp0 -d 59.59.10.98 -m state --state RELATED,ESTABLISHED=
 \
  -j ACCEPT
$ipt -A INPUT -j drop-and-log-it

$ipt -A FORWARD -i ppp0 -o eth1 -m state --state RELATED,ESTABLISHED -j A=
CCEPT
$ipt -A FORWARD -i eth1 -o ppp0 -j ACCEPT
$ipt -A FORWARD -j drop-and-log-it

$ipt -A OUTPUT -o lo -j ACCEPT
$ipt -A OUTPUT -o eth1 -s 59.59.10.98 -d 192.168.0.0/24 -j ACCEPT
$ipt -A OUTPUT -o eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -j ACCEPT
$ipt -A OUTPUT -o ppp0 -d 192.168.0.0/24 -j drop-and-log-it
$ipt -A OUTPUT -o ppp0 -s 59.59.10.98 -j ACCEPT
$ipt -A OUTPUT -j drop-and-log-it

# This rule will never have any hits because everything is dropped by the
#   previous rule
$ipt -A OUTPUT -o eth0 -m state --state NEW -p tcp --dport 80 -j ACCEPT


From your script :

# This is not going to work. You want DNAT for this.
$ipt -t nat -A PREROUTING -i eth1 -p tcp --dport 80 \
  -j REDIRECT --to-ports 192.168.0.1:3128

$ipt -t nat -A POSTROUTING -o $ppp0 -j SNAT --to 59.59.10.98



This is how I would do it. Please look at the comments (a little hard to =
read,
but I can't help that) because there are things about your your setup (ru=
nning
services) that I don't know anything of.
I'm assuming that 59.59.10.98 is your internet IP.

$ipt -P INPUT DROP
$ipt -P OUTPUT DROP
$ipt -P FORWARD DROP

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -m state --state NEW -i lo -j ACCEPT
$ipt -A INPUT -m state --state NEW -i eth1 -s 192.168.0.0/24 -j ACCEPT
# This rule is worthless. It should only allow the specific service
#   you want it to, not everything
$ipt -A INPUT -m state --state NEW -i ppp0 -d 59.59.10.98 -j ACCEPT
$ipt -A INPUT -j LOG --log-level 6

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth1 -o ppp0 -s 192.168.0.0/24 \
  -j ACCEPT
# Now, you want to forward 3128/tcp traffic from 192.168.0.10 to 192.168.=
0.1
#   to 192.168.0.3.
$ipt -A FORWARD -m state --state NEW -i eth1 -s 192.168.0.10 -d 192.168.0=
.3 \
  -p tcp --dport 3128 -j ACCEPT
$ipt -A FORWARD -j LOG --log-level 6

$ipt -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# What services do you have that require this ?
$ipt -A OUTPUT -m state --state NEW -o ppp0 -s 59.59.10.98 -j ACCEPT
$ipt -A OUTPUT -m state --state NEW -o eth1 -s 59.59.10.98 -d 192.168.0.0=
/24 \
  -j ACCEPT
# The -s argument should be the internal IP of your firewall,
#   not the complete subnet which, from your script, is 192.168.0.1.
$ipt -A OUTPUT -m state --state NEW -o eth1 -s 192.168.0.1 -d 192.168.0.0=
/24 \
  -j ACCEPT
# Now I'm confused.. You used eth1 and ppp0 consistently everywhere.
#   Why do you use eth0 ? Shouldn't this be ppp0 ?
$ipt -A OUTPUT -m state --state NEW -o eth0 -p tcp --dport 80 -j ACCEPT

# NAT rules.

# Forward to 192.168.0.3
$ipt -t nat -A PREROUTING -i eth1 -d 192.168.0.1 -p tcp --dport 3128 \
  -j DNAT --to 192.168.0.3
# LAN internet access
$ipt -t nat -A POSTROUTING -o $ppp0 -j SNAT --to 59.59.10.98


I hope this is of help.


Gr,
Rob



