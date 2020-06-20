From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Sun, 21 Jun 2020 00:35:58 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2006210001480.13515@piplus.local.jubileegroup.co.uk>
References: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk> <44cc0842-bd3b-986e-9537-bd11d980e61b@gmail.com> <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463810772-719546927-1592694954=:13515"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
Content-ID: <alpine.DEB.2.21.2006210016481.13515@piplus.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Hooman <netfilter@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463810772-719546927-1592694954=:13515
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.21.2006210016482.13515@piplus.local.jubileegroup.co.uk>

Hello again,

On Sat, 20 Jun 2020, Hooman wrote:

> ... [snip] ...
> The hotspot creates a network on subnet on my wifi interface ( inet
> 10.42.0.1 netmask 255.255.255.0 ):

It's important to note that netmask here.

> ... [snip] ...
> The hotspot feature creates some iptable rules:
>
> root@myuser:~# iptables -vL -t filter
> Chain INPUT (policy ACCEPT 284K packets, 89M bytes)
> ... [snip] ...
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note that although 284K packets were counted into the Ubuntu box by
the INPUT chain, no packets at all were counted by the FORWARD chain.

> ... [snip] ...
>  0 0 REJECT all -- any wlan1 anywhere anywhere ...
>  0 0 REJECT all -- wlan1 any anywhere anywhere ...

So no packets matched these REJECT rules, because the rules never saw
the packets that you're concerned about.

> Now as I said, Machine A is on 10.42.0.34 and Machine B is on 10.42.0.57.

On the same subnet.  Yes.  Not *routed* through your Ubuntu box.

> The following iptables rules stop packets from Machine A to Google but
> not from Machine A to B:
>
> sudo iptables -t mangle=A0 -I PREROUTING -j DROP
> sudo iptables -t filter -I FORWARD -j DROP
> sudo iptables -t raw=A0 -I PREROUTING -j DROP

That's correct.  Packets to Google are *routed* through the box.

> So basically, iptable and ebtable rules have no effect on packets from A
> to B. However, I see those packets on wireshark and they definitely go
> through the Ubuntu machine that is hosting the access point.

As you have demonstrated, packets are not going through the FORWARD
chain in the filter table, so adding rules to drop them there will not
do what you want.

If you want to drop packets in the FORWARD chain you first need to
arrange for them to pass through it.  I would not expect packets
exchanged between 10.42.0.34 to 10.42.0.57 on a network with a netmask
of 255.255.255.0 to do that, which is why I sugggested playing with
the netmasks.

> ... I see those packets on wireshark and they definitely go through
> the Ubuntu machine that is hosting the access point. And that's
> exactly my dilemma, how to block those packets from going through.

If packets truly are going through the Ubuntu box to get from
10.42.0.34 to 10.42.0.57 then they must be going via the INPUT and
OUTPUT chains.  It seems odd to me, but one way to test that is to
put rules to count 10.42.x.x packets in the INPUT and OUTPUT chains.

--=20

73,
Ged.
---1463810772-719546927-1592694954=:13515--
