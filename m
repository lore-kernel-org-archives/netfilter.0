From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Universal Address Translation
Date: Sat, 24 Jul 2004 18:51:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090687880.2228.83.camel@anduril.intranet.cartel-securite.net>
References: <200407242032.35573.rio@martin.mu>
	 <1090676859.2228.62.camel@anduril.intranet.cartel-securite.net>
	 <200407242055.51714.rio@martin.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407242055.51714.rio@martin.mu>
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
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

Le sam 24/07/2004 =E0 15:55, Rio Martin. a =E9crit :
> [isp-wireless] RE: How do Hotels, Starbucks, Hot Spots do this? ...
> ... Better yet most of the vendors below support Universal Address=20
> Translation, which allows a user to connect no matter what the ip or
> static vs. dhcp. ...

That's what I though it was :)

There's not exactly a NAT issue. There's nat, but the issue is to grab
traffic to the gateway in order to have it route it the right place and
NAT it correctly. In fact, what you have to do is to set sort of
universal proxy ARP that is able to answer any ARP request with gateway
MAC address.

I've quite successfully achieve this using arpd daemon used with honeyd.
This daemon answers any ARP request with a given MAC address (its MAC
address). So any traffic within the LAN is directed to arpd host.


Now we must handle DNS requests, for which we just have to DNAT UDP and
TCP destined to port 53 to our proper DNS server :

iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT --to $DNS
iptables -t nat -A PREROUTING -p tcp --dport 53 -j DNAT --to $DNS

For normal traffic, I use default route to send packets away and SNAT
the usual way :

iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP

To handle returning packets properly regarding routing, because we don't
want them to hit default route. As far as I can remember, I used packet
marking and nfmark based routing :

iptables -t mangle -A PREROUTING -i $EXTIF -j MARK --mark 0x01

So I knew a packet marked is a returning packet that has to get routed
directly to internal interface (see LARTC[1] for fwmark routing
configuration).

I didn't do much testing on this, but things seemed to go quite well. I
guess this is what I set up. You can try and give feedback.


[1] http://lartc.org/

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

