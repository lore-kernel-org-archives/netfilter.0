From: "Tiziano Arbizzani" <tiziano@digibyte.it>
Subject: Some strange connection timeout
Date: Mon, 7 Apr 2003 14:57:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <525F9FE5E1B9A94FB35994B770FF43D821683E@powerthree.digibyte.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


Hi all, I am a rather newbie in firewall issues.

I have noticed this little problem: I am installing a network with some
linux-boxes-router for a little sized firm in my hometown.

These boxes have a ADSL router connected to an ethernet card and an ISDN
internal modem for backup purpose.=20
Every remote office have one of this boxes to connect its LAN to the
central headquarters LAN via a VPN tunnel.

Every box at startup tries if the ADSL is up pinging a sure Ip server,
and if it's so it tries to establish a VPN connection to headquarters.
After this it tries to ping a server in the HQ lan, and nothing happens
since the HQ server continues responding to pings (like an heartbeat).

If the HQ server stops responding to pings it tries to ping a sure
server on the internet and if there's no response it realizes adsl is
down, dials the ISDN provider and  try to connect via VPN to the HQ.

Let's come to the problem : after the ADSL is fallen, ISDN is set up and
the VPN is established, for a couple of minutes the server in the HQ lan
is not 'ping'able.=20

Routing is OK, (I must changes routing tables after the interface swap),
firewall rules are (IMHO) ok, but server starts responding only after
some time.

There 's some kind of timeout, perhaps a cached value that must become
stale, but I can't realize if the problem comes from the DNS or ARP
cache or the ip_conntrack table.=20

I tried to clear both caches, using ip_dynaddr, using SNAT or
MASQUERADING, lowering the timeouts values in
proc/sys/net/ipv4/route/gc* files, but I can't work around the problem.

Thanks a lot and every help is truly appreciated.

Hi all

Ps. Sorry, for the mailing list admin, please disregard the copy of this
message awaiting authorization. I remember i had subscribed for this
list but I was obviously in error.

Bye
------------------------------------------------------------
 Tiziano Arbizzani - Area Tecnica / Sviluppo SW
DIGIBYTE SERVIZI E SISTEMI INFORMATICI
------------------------------------------------------------
  Assistenza - Vendita - Consulenza - Formazione
 Networking - Internetworking - Internet Provider
------------------------------------------------------------
  via Marziale, 9 - 40128 - Bologna (Italia)
 Tel. +39 051 6388614 Fax +39 051 323735
  www.powerstation.it - digibyte@powerstation.it
Appliance Server CubeLibre       www.cubelibre.it

