From: Askar <askarali@gmail.com>
Subject: Re: Setting up a Squid proxy server behind a firewall
Date: Tue, 3 May 2005 17:23:54 +0500
Message-ID: <a0f69e505050305233b948198@mail.gmail.com>
References: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
Content-Disposition: inline
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
To: "lester@pccegoa.org" <lester@pccegoa.org>
Cc: netfilter@lists.netfilter.org

you are allowing only port 3128 incoming and output going what about
dns port 53 and others ?
How your squid server will resolve sites ?


iptables -A INPUT -p tcp -m multiport --destination-port 22,80,3128

same for output chain=20

#for dns
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

regards



On 5/3/05, lester@pccegoa.org <lester@pccegoa.org> wrote:
> Hi,
> I have setup a squid proxy server for our internal network. It works just
> fine without a firewall setup. When I tried to apply rules to block
> everything except the ports that squid requires, the proxy failed to get
> passed the firewall. I have setup squid to use port 3128.
> The rules applied are below:
> (eth0 : internal n/w interface
> eth2 : external n/w interface)
>=20
> modprobe ip_conntrack_ftp
>=20
> modprobe iptable_nat
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> iptables --flush
> iptables -t nat --flush
> iptables -t mangle --flush
>=20
> iptables --policy INPUT DROP
> iptables --policy OUTPUT DROP
> iptables --policy FORWARD DROP
>=20
> iptables -A INPUT -i eth0 -p tcp --dport 3128 -m state --state NEW -j ACC=
EPT
> iptables -A OUTPUT -o eth2 -p tcp --sport 3128 -m state --state NEW -j AC=
CEPT
>=20
> iptables -t filter -A INPUT -i eth0 -p tcp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> iptables -t filter -A INPUT -i eth1 -p tcp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
>=20
> iptables -t filter -A OUTPUT -o eth0 -p tcp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> iptables -t filter -A OUTPUT -o eth1 -p tcp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> ....
>=20
> What I would like to know is that, does squid use any other ports besides
> 3128 when contacting the external world? Or are the rules that I have
> applied totally wrong? I am using modprobe iptable_nat, echo 1 >
> /proc/sys/net/ipv4/ip_forward for port forwarding to internal servers.
> (which works). I have not appended those rules.
>=20
> Thanks for your help.
> Lester
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

