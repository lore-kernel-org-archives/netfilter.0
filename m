From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Routing decision?
Date: Mon, 15 Sep 2003 16:00:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063634445.930.102.camel@elendil.intranet.cartel-securite.net>
References: <3F657D37.1010000@able.be>
	 <1063616905.31092.78.camel@raylinux.internal>  <3F65981D.1060700@able.be>
	 <1063628083.31092.82.camel@raylinux.internal>  <3F65B63E.7030203@able.be>
	 <1063631398.31092.91.camel@raylinux.internal>
	 <1063632718.932.71.camel@elendil.intranet.cartel-securite.net>
	 <1063633591.31093.99.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063633591.31093.99.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Wim Ceulemans <wim.ceulemans@able.be>, Netfilter Mailing List <netfilter@lists.netfilter.org>, pieter@able.be

Le lun 15/09/2003 =E0 15:46, Ray Leach a =E9crit :
> My firewall machine currently has 5 NICs, each with their own ip (one
> has a public ip - eth0)
> eth0 has the public ip. It also has 10 alias ips.
> eth1 has a private ip of 192.168.1.1.
> eth1 network is my dmz with all the web servers from 192.168.1.165 to
> 192.168.1.173.
> If I want to DNAT incoming traffic destined to on of the aliases bound
> to interface eth0 to a server in the dmz - eth1 192.168.1.165 (for
> example), then I need :
>  - a PREROUTING DNAT rule
>  - a FORWAORD rule for each direction (eth0 -> eth1 and eth1 -> eth0)
>  - and an INPUT rule for eth0 alias ip.
> Does that make sense?

Not to me. Supposing alias i set up (using iproute or ifconfig) I would
do this (and I think you did this) :

	iptables -t nat -A PREROUTING -d $ALIAS -i eth0 -j DNAT \
		--to 192.168.1.165
	iptables -A FORWARD -d 192.168.1.165 -i eth0 -o eth1 -j ACCEPT
	iptables -A FORWARD -s 192.168.1.165 -i eth1 -o eth0 -j ACCEPT

And that's all to set a DNAT for incoming packets.

> If I remove the INPUT rule, my DNAT does not work, the packets get sent
> to the OUTPUT chain ...

What is the INPUT rule ? Once your packet gets DNATed in PREROUTING, it
is not sent to NF_IP_LOCAL_IN, but to NF_IP_FORWARD. Thus, it does not
cross filter table INPUT chain. If packets go through INPUT chain, that
means they're still destined to the alias IP, so that the DNAT rule did
not match them.
And I do not see how packets could go to OUTPUT chain as they're
supposed to get routed, not locally generated... The only case I see is
REDIRECT target use on a local proxy, so packets go through INPUT, then
proxy reply sent through OUTPUT chain.

I'm a bit lost on this one.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

