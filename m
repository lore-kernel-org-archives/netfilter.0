From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Automatic forwarding to own interfaces
Date: Tue, 23 Sep 2003 07:51:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064296309.828.91.camel@elendil.intranet.cartel-securite.net>
References: <200309230714.AA48627750@mirrormind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309230714.AA48627750@mirrormind.com>
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
To: simonl@mirrormind.com
Cc: netfilter@lists.netfilter.org

Le mar 23/09/2003 =E0 07:14, Simon Lodal a =E9crit :
> Another host "evil" is on the 10.0.1.0/24 subnet, and has no way to
> reach the 192.168.1.0/24 subnet. It then configures itself to use
> victim as gateway to the 192.168.1.0/24 subnet. But since victim has
> disabled all forwarding, evil can still not reach any 192.168.1.0/24
> hosts. Except...
> The strange thing is that when evil does 'ping 192.168.1.5' it
> succeeds. It pings victim's eth1 through eth0.

That's a "normal" Linux behaviour. Linux answers packets destined to any
of its own IPs own any interface, as long as your INPUT filtering rules
allows it. You can set something like :

	iptables -A INPUT -d 192.168.1.5 -i ! eth1 -j DROP
	iptables -A OUTPUT -s 192.168.1.5 -o ! eth1 -j DROP

> The really strange thing is that victim does not treat the traffic as
> forwarding, but as locally destined traffic, going through INPUT and
> OUTPUT chains.

Yes, for the packets are destined to the box itself, they don't get
routed.

> Is all this really intentional? It makes no sense to me. Can anyone
> confirm this behaviour?

You can even see that eth0 will answer ARP requests on eth1's IP...
That's one of the reasons for arptables. There was a patch to change
this behaviour too.

A behaviour a bit like this one is when you set DNAT up (rules are quick
ones) :

	iptables -t nat -A PREROUTING -i eth0 -d 10.0.1.2 -j DNAT \
		--to 192.168.1.10
	iptables -A FORWARD -i eth0 -o eth1 -d 192.168.1.10 -j ACCEPT
	iptables -A FORWARD -i eth1 -o eth0 -s 192.168.1.10 -j ACCEPT

A box on 10.0.1.2/24 will be able to reach 192.168.1.10 directly, as
long as it defines your box as router for this destination, for the
FORWARD rules allows it.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

