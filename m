From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: iptables and mtu
Date: Mon, 10 Jun 2002 12:49:25 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610194925.54594.qmail@web9903.mail.yahoo.com>
References: <200206101941.g5AJfUA01453@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206101941.g5AJfUA01453@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org



> What is the MTU on the firewall interface connected
> to the ADSL ?
>=20
> I would have thought that if this was set to 1492,
> then things should sort=20
> themselves out quite transparently...
>=20

ppp0 is 1492 and its "connected" to eth0 that is 1500,
and eth1 is connected to local net and it is 1500

>=20
> You *are* allowing the appropriate ICMP messages
> into / out of / through your=20
> firewall box, aren't you ?

Uhmmm, no idea actually, hehe, i just configures it to
reject or accept access on certain ports, not dropping
every package coming that isn't matching a certain
port (hmm, hope anyone understands that sentence).=20
Why lock down everything when i know what service that
is on the linux and on ever computer behind it.

/J=F6rgen

__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com

