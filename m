From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: quick questions ---
Date: Thu, 27 Nov 2003 14:26:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069939599.12114.54.camel@elendil.intranet.cartel-securite.net>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

Le jeu 27/11/2003 =E0 14:02, Knight, Steve a =E9crit :
> 1) can iptables use eth0:0 as a valid interface distinct from eth0 ?

No, because eth0:0 is _not_ an interface, it is an alias (afaik, usage
of eth0:0 aliases are deprecated for this very reason). It's just
another IP to which your interface (eth0) answers.

>  So I can use eth0 as LAN internal i/f and eth0:0 as DMZ internal i/f.

This is to me a _very_ bad idea.

The point of creating a DMZ is having public services hosted on a
different ethernet segment than the one used for LAN. As hosts with
public services are the most likely to get compromised, DMZ creates a
compartiment so a cracker who would root one of them won't get full
access to LAN stations. If your public services are on the same ethernet
segment than LAN is, the intruder will have full access to its
ressources... Setting up a different IP addressing scheme on the same
ethernet segment is no security at all.

If you want more info on what one can do once root on an ethernet
segment :

	http://www.arp-sk.org/

> 2) Back when I did my checkpoint certs we covered "static NAT" - simple
> one-to-one address translation, rather than "hide NAT" - aka iptables S=
NAT /
> MASQUERADE....
> ...the question I have is -=20
> is the example given in Ziegler starting on p280 and table 7.1 "Host
> Forwarding to Servers in a Privately Addressed DMZ" an example of "stat=
ic
> NAT"?

If my Ziegler remembers are OK, yes.

To map an IP, it should be something like=20

	iptables -t nat -A PREROUTING -d $PubIP -j DNAT --to $PrivIP

If your want to map one service only (aka port forwarding) :

	iptables -t nat -A PREROUTING -d $PubIP --dport 80 \
		-DNAT --to $PrivIP:80

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

