From: David T-G <davidtg-netfilter@justpickone.org>
Subject: ready to cry over NATting!
Date: Tue, 20 May 2003 06:29:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030520102957.GA98543@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all --

I've found and read more HOWTOs and have tried my hand at some iptables
scripts, including the incredibly simple, but still am not getting
anywhere.

I started out with SuSEfirewall2 settings.  As far as I can tell, I ended
up with a wide-open firewall that didn't NAT.  Phooey.  So I gave up on
that and tried iptables commands directly.

Lifting directly from the "Made Simple" HOWTO, I tried

  modprobe ipt_MASQUERADE # If this fails, try continuing anyway
  iptables -F; iptables -t nat -F; iptables -t mangle -F
  iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to my.ip.add.ress
  echo 1 > /proc/sys/net/ipv4/ip_forward
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT
  iptables -P INPUT DROP   #only if the first two are succesful
  iptables -A FORWARD -i eth1 -o eth1 -j REJECT

to no avail.  Just doing the first 4 commands left me with a server that
wouldn't talk.  Adding the INPUT chains in the next two commands let me
talk again but didn't change anything else.  Adding

  iptables -P INPUT ACCEPT

still changed nothing.  Adding

  iptables -A FORWARD -i eth1 -o eth1 -j ACCEPT
  iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

(the former out of desperation and the latter figuring that incoming on
the LAN and outgoing on the WAN would be a Good Thing) also changed
nothing.

Somewhere in here I was at least able to see packets counting up when
checking

  iptables -t nat -vL

as a client on the inside was pinging an outside address.

So I went to Rusty's NAT HOWTO and built up some commands from it:

  # load module
  modprobe ipt_MASQUERADE # If this fails, try continuing anyway

  # flush everything
  iptables -F; iptables -t nat -F; iptables -t mangle -F

  # turn on NATting & forwarding
  #iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 65.69.195.178
  iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
  echo 1 > /proc/sys/net/ipv4/ip_forward

  # accept returning ext packets
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # accept anything originating inside ("not ext")
  iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT

  # allow ssh & telnet
  iptables -A INPUT --protocol tcp --dport 22 -j ACCEPT
  iptables -A INPUT --protocol tcp --dport 23 -j ACCEPT

  # talk to web server
  iptables -A INPUT --protocol tcp --dport 80 -j ACCEPT
  iptables -A INPUT --protocol tcp --dport 443 -j ACCEPT

  # talk to mysql server
  iptables -A input --protocol tcp --dport 3306 -j ACCEPT

  # drop everything else
  ## iptables -P INPUT DROP   #only if the first two are succesful

  # reject anything bound for a MASQed client
  ## iptables -A FORWARD -i eth1 -o eth0 -j REJECT

  # what do we have?
  echo "---"
  iptables -L
  echo "---"
  iptables -t nat -L
  echo "---"

[I also tried the 'abbreviated version', going only as far as the "echo"
line, but that was a bust.]  Running this script as

  linux:/tmp # nohup ./script

gave me

  + modprobe ipt_MASQUERADE
  + iptables -F
  + iptables -t nat -F
  + iptables -t mangle -F
  + iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
  + echo 1
  + iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  + iptables -A INPUT -m state --state NEW -i '!' eth1 -j ACCEPT
  + iptables -A INPUT --protocol tcp --dport 22 -j ACCEPT
  + iptables -A INPUT --protocol tcp --dport 23 -j ACCEPT
  + iptables -A INPUT --protocol tcp --dport 80 -j ACCEPT
  + iptables -A INPUT --protocol tcp --dport 443 -j ACCEPT
  + iptables -A input --protocol tcp --dport 3306 -j ACCEPT
  iptables: No chain/target/match by that name
  + echo ---
  ---
  + iptables -L
  Chain INPUT (policy DROP)
  target     prot opt source               destination        =20
  ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED=20
  ACCEPT     all  --  anywhere             anywhere           state NEW=20
  ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh=
=20
  ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:telne=
t=20
  ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http=
=20
  ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:https=
=20
 =20
  Chain FORWARD (policy DROP)
  target     prot opt source               destination        =20
 =20
  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination        =20
 =20
  Chain input_ext (0 references)
  target     prot opt source               destination        =20
 =20
  Chain reject_func (0 references)
  target     prot opt source               destination        =20
  + echo ---
  ---
  + iptables -t nat -L
  Chain PREROUTING (policy ACCEPT)
  target     prot opt source               destination        =20
 =20
  Chain POSTROUTING (policy ACCEPT)
  target     prot opt source               destination        =20
  MASQUERADE  all  --  anywhere             anywhere          =20
 =20
  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination        =20
  + echo ---
  ---

[yes, I now see the typo on the mysql protocol line].  I figured I would
get a wide-open firewall -- which nonetheless also accepted ssh, telnet,
web, mysql -- which did NATting for me, but it didn't.  As I look at the
-L output I realize that I don't see any rules for anything except INPUT
and POSTROUTING, so I probably need more pieces, no?

I'm trying to get a good foundation in the terms and ideas, but I confess
that I still don't really know what is a table or how does a chain work.
I don't know what or how to debug because I'm still coming up to speed,
but it seems that I can't even find a working example that I can then
flesh out!  I would think that

  Goal 1: NAT from eth1 (LAN) to and through eth0 (WAN) for client

  Goal 2: Allow various connections and confirm that they work

  Goal 3: Disallow Bad Stuff from WAN

  Goal 4: Disallow Bad Stuff from LAN

is a good step-by-step approach but I can't even get past #1 :-(


TIA again & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+ygOlGb7uCXufRwARAjPCAJ47U7RIKqFs6AyMY1We0r61rMFk6gCgtMUr
WrvF84fwwCZkGZrOaI27wFw=
=4Ata
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

