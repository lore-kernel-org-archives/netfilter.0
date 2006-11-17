From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: opening up an ipchain
Date: Fri, 17 Nov 2006 17:00:24 +0100
Message-ID: <455DDC98.5080405@plouf.fr.eu.org>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>	<455C9C5A.2090905@plouf.fr.eu.org>
	<200611161953.kAGJr6Sn027476@alexandrite.boisestate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611161953.kAGJr6Sn027476@alexandrite.boisestate.edu>
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

Alex Feldman a =E9crit :
>>>
>>>iptables -A INPUT -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT
>=20
> :> Be aware that this will work only when the client and the server are
> :> on the same network (link layer). MAC addresses don't go through
> :> routers.
>=20
> And apparantly the wireless box I have that the phone company sold me
> does this.  I thought it wouldn't be a problem, since I treat the house
> as one segment, but apparantly it is.

It all depends on what the wireless box really is and how you connected=20
the client and the server to it.

If the box is a simple wireless access point, it acts like a bridge and=20
the server should see the client MAC address. If the box is a wireless=20
router with a WAN port, (wired) LAN ports and a wireless WLAN interface,=20
usually the LAN ports and the WLAN interface are bridged together and=20
share the same subnet just like an access point, but the WAN port is=20
routed so MAC addresses between the WAN and the LAN/WLAN are hidden.

> OK, so here is my idea now: Open up the computer to port 22 for a ssh
> connection, with keys that I put on my computer at home and my laptop.
> THen I can ssh in, securely.  The risk is that I leave my laptop
> somewhere, there would be no way to get in without that key.  Once in
> via ssh, I would open up a few other ports via ipchains  to let me get =
my
> IMAP mail or whatever else, and then close them right back down again.

You could also open TCP tunnels within the SSH session to make things=20
simpler.

