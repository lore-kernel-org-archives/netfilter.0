From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ready to cry over NATting!
Date: 20 May 2003 16:19:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053440382.1993.117.camel@kermit.spenneberg.de>
References: <20030520102957.GA98543@justpickone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030520102957.GA98543@justpickone.org>
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
To: David T-G <davidtg-netfilter@justpickone.org>
Cc: NetFilter Users' List <netfilter@lists.netfilter.org>

Am Die, 2003-05-20 um 12.29 schrieb David T-G:
> Hi, all --
Dear David,

> Lifting directly from the "Made Simple" HOWTO, I tried
>=20
>   modprobe ipt_MASQUERADE # If this fails, try continuing anyway
>   iptables -F; iptables -t nat -F; iptables -t mangle -F
>   iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to my.ip.add.ress
>   echo 1 > /proc/sys/net/ipv4/ip_forward
>   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>   iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT
>   iptables -P INPUT DROP   #only if the first two are succesful
>   iptables -A FORWARD -i eth1 -o eth1 -j REJECT
What are you trying to achieve?
These rules do not allow any traffic through your firewall (Forward
REJECT).

> So I went to Rusty's NAT HOWTO and built up some commands from it:
>=20
>   Goal 1: NAT from eth1 (LAN) to and through eth0 (WAN) for client
>=20
Ok. lets see. You have got 3 tables: filter, nat, and mangle.
NAT is quite easy to setup:

# Flush all
iptables -F
iptables -t nat -F
iptables -t mangle -F
# configure NAT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# Turn on routing
echo 1 > /proc/sys/net/ipv4/ip_forward

You should be able to ping now from a internal client to an external IP
address. Note, that dns resolution might not work yet.
>   Goal 2: Allow various connections and confirm that they work
Now you are trying to filter. The filter table has three chains. Each
chain with a specific task:
INPUT only filters packets with the local machine as destination
OUTPUT only filters packets originating on the local machine
FORWARD only sees those packets not covered by INPUT and OUTPUT being
forwarded by the firewall.
If you want to allow new connections from the inside you need the
following rules:
# Deny everything through the machine
iptables -P FORWARD DROP
# Allow new connections from the inside
iptables -A FORWARD -i eth1 -o eth0 -m match --match NEW -j ACCEPT
# Allow established connections
iptables -A FORWARD -m match --match RELATED,ESTABLISHED -j ACCEPT

Your firewall is still accessable, because when the firewall takes part
in the communication only INPUT and OUTPUT are used.
>=20
>   Goal 3: Disallow Bad Stuff from WAN
>=20
>   Goal 4: Disallow Bad Stuff from LAN
>=20
> is a good step-by-step approach but I can't even get past #1 :-(
Tell me if you know what I am talking about and if it helps you to get
past #1.
Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

