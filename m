From: "Fredrik Emil Jensen" <fredrik.jensen@netpower.as>
Subject: RE: Handling a clients fixed IP address
Date: Thu, 30 Oct 2003 10:54:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3C204966522884458700FF59D6EFB87A01CA87@FORUS01.netpower.lan>
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
To: Herman@AerospaceSoftware.com, john zurowski <johnzurowski@hotmail.com>, netfilter@lists.netfilter.org

You may want to look at this,
http://www.securiteam.com/exploits/6F00B1561Q.html

IP spoofing, don't forget that you may also want to do proxy
spoofing/redirecting and smtp spoofing/redirecting.=20

Products such as Birdstep, Nomadix, Zyxel VSG 1200 all ready do this for
you, typically a hotspot solutions, but expensive.    =20


/Fredrik


-----Original Message-----
From: Herman [mailto:Herman@AerospaceSoftware.com]=20
Sent: 30. oktober 2003 00:36
To: john zurowski; netfilter@lists.netfilter.org
Subject: Re: Handling a clients fixed IP address

On Wednesday 29 October 2003 9:04 pm, john zurowski wrote:
> I've been using iptables without problems for almost a year now. A
> situation has however occured where I would like to allow access to
users
> with fixed IP addresses onto the LAN in order to gain access to the
> internet. The situation is complicated because the client devices may
be
> assigned fixed IP addresses which do not match our subnet or point at
our
> gateway. Can iptables be configured in such a way that this could be
> handled
> transparently i.e. without the client having to set up dhcp client
service?
>
> _________________________________________________________________
> Tired of 56k? Get a FREE BT Broadband connection
> http://www.msn.co.uk/specials/btbroadband

Hmm, as I understand it:
A visitor plugs a 'foreign' laptop into the wall in your meeting room
and=20
starts a browser, then he expects to connect to say www.cnn.com without=20
having to change *any* settings on his machine, which may be configured
to=20
talk to a non-existant gateway IP address. =20

We hope that your guest IP and Gateway settings do not clash with an
existing=20
IP address on your network.  If you are concerned about clashes, then
you=20
would need either a dedicated interface or a virtual LAN interface to=20
separate the meeting room from the rest of the place.

Well, this clearly calls for NAT, but it won't be simple.

I think you have to look at "-m state --state NEW, ESTABLISHED, RELATED"
and=20
"SNAT" to cause every new previously unknown connection attempt and
whatever=20
follows from that, to be redirected to the External IP on the firewall=20
machine.

I think the simplest case would be if you use a dedicated interface or
VLAN,=20
say eth3 if it is dedicated hardware or eth1.1 if it is a VLAN and then
SNAT=20
whatever arrives on that interface to the outside IP address of the
firewall.

Since the packets would be addressed to a non-existant gateway machine,
you=20
would need to do DNAT too.

I have a feeling that this problem can be solved with iptables and it
would be=20
interesting if one of the real iptables gurus can comment.

Cheers,
--=20
Herman


