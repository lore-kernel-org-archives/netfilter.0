From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: ready to cry over NATting!
Date: Tue, 20 May 2003 11:58:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030520155813.GA33081@justpickone.org>
References: <20030520102957.GA98543@justpickone.org> <1053440382.1993.117.camel@kermit.spenneberg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1053440382.1993.117.camel@kermit.spenneberg.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>
Cc: Ralf Spenneberg <lists@spenneberg.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ralf, et al --

=2E..and then Ralf Spenneberg said...
%=20
% Am Die, 2003-05-20 um 12.29 schrieb David T-G:
=2E..
% > Lifting directly from the "Made Simple" HOWTO, I tried
% >=20
% >   modprobe ipt_MASQUERADE # If this fails, try continuing anyway
% >   iptables -F; iptables -t nat -F; iptables -t mangle -F
% >   iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to my.ip.add.ress
% >   echo 1 > /proc/sys/net/ipv4/ip_forward
% >   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
% >   iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT
% >   iptables -P INPUT DROP   #only if the first two are succesful
% >   iptables -A FORWARD -i eth1 -o eth1 -j REJECT
% What are you trying to achieve?
% These rules do not allow any traffic through your firewall (Forward
% REJECT).

As I said, I was lifting from the HOWTO :-)  I thought that that rule
rejected anything coming in on eth1 (external interface) that was due to
go back out on eth1.

The interesting thing is that traffic *did* go through the firewall,
since network is the only way I can access it.  I ran that script and was
not locked out.

Again I don't understand!


%=20
% > So I went to Rusty's NAT HOWTO and built up some commands from it:
% >=20
% >   Goal 1: NAT from eth1 (LAN) to and through eth0 (WAN) for client
% >=20
% Ok. lets see. You have got 3 tables: filter, nat, and mangle.
% NAT is quite easy to setup:
%=20
% # Flush all
% iptables -F
% iptables -t nat -F
% iptables -t mangle -F
% # configure NAT
% iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
% # Turn on routing
% echo 1 > /proc/sys/net/ipv4/ip_forward

I tried that, too, and couldn't get in from the outside any more.
Perhaps at that point I didn't need to, though.

I can follow the flushes easily enough.

I'm not sure why I want to do postrouting going out the LAN interface; I
thought that NAT was for internal machines trying to get out.  I *think*
that what I want is SNAT =3D=3D source translation, and the NAT HOWTO doesn=
't
talk about DNAT =3D=3D destination translation so I don't know that it's
needed -- but, of course, also don't really know about what I'm speaking.

[Oh, phooey -- I just realized that I had a typo, and you're obviously
going from what I wrote!  eth0 is the LAN and eth1 is the WAN; sorry!]


%=20
% You should be able to ping now from a internal client to an external IP
% address. Note, that dns resolution might not work yet.

This is one test case that I didn't try since the firewall was otherwise
locked up.


% >   Goal 2: Allow various connections and confirm that they work
% Now you are trying to filter. The filter table has three chains. Each
% chain with a specific task:
% INPUT only filters packets with the local machine as destination

Oh, INPUT from any interface; OK.


% OUTPUT only filters packets originating on the local machine
% FORWARD only sees those packets not covered by INPUT and OUTPUT being
% forwarded by the firewall.

OK.  But this FORWARD is different from the NAT forward, right?


% If you want to allow new connections from the inside you need the
% following rules:
% # Deny everything through the machine
% iptables -P FORWARD DROP
% # Allow new connections from the inside
% iptables -A FORWARD -i eth1 -o eth0 -m match --match NEW -j ACCEPT
% # Allow established connections
% iptables -A FORWARD -m match --match RELATED,ESTABLISHED -j ACCEPT
%=20
% Your firewall is still accessable, because when the firewall takes part
% in the communication only INPUT and OUTPUT are used.

Ahhh...  OK.


% >=20
% >   Goal 3: Disallow Bad Stuff from WAN
% >=20
% >   Goal 4: Disallow Bad Stuff from LAN
% >=20
% > is a good step-by-step approach but I can't even get past #1 :-(
% Tell me if you know what I am talking about and if it helps you to get
% past #1.

I'm close, I think.  I'd start with

  # flush everything
  iptables -t filter -F ; iptables -t mangle -F ; iptables -t nat -F
  # allow masquerading
  iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

to just forward packets from inside clients and then perhaps add

  # outbound connections through
  iptables -t filter -A FORWARD -i eth0 -o eth1 -m match --match NEW -j ACC=
EPT
  # returning connections through
  iptables -t filter -A FORWARD -m match --match RELATED,ESTABLISHED -j ACC=
EPT

to allow things like pings to go out and in.  Then I'd need

  # incoming to
  iptables -t filter -A INPUT ACCEPT

to just let everything going to the box -- like my ssh -- get there.  Not
yet secure, but a start, right?


% Cheers,
%=20
% Ralf


Thanks *so* much! & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+ylCVGb7uCXufRwARAhnZAJ4u3q7oo/kOzo2ESinFkn16Jyu8tgCgiT9J
+Ty2F7ett+8sgl7u2zQse3k=
=a1rZ
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

