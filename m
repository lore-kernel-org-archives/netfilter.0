From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Port forwarding error
Date: Tue, 01 Mar 2005 12:15:46 +0100
Message-ID: <42244EE2.5000206@mnemon.de>
References: <110c784405030102077fa30d3e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <110c784405030102077fa30d3e@mail.gmail.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi,

Metal Gear schrieb:

| Hi all,
|
| plz check the following diagram for pictorial details of my problem
|
|
| http://www.antionline.com/attachment.php?s=3D&postid=3D824669

Looking at you diagram, this is not a desirable configuration. Anyway.

| Squid (only one interface card) I want to configure iptable rules
| on my squid machine such that if any client connects on pop3, smtp,
| dns these request are redirected to servers popserver, smtpserver
| and dnsserver. All three of these servers are on untrusted network
| having public ips. My squid machine and clients are on internal
| network and only squid machine can cross the firewall to access the
| outerworld. I researched a lot but i m unable to write a successful
| rule for that. I m posting my rules in the end of the post.
| Currently i m using a port redirector (rinetd) in place of that
| rules.
|
| Thanks
|
| (Your assistance will be greatly appreciated)

If I understand correctly, your clients connect to your squid-box at
least on ports 110, 25 and 3128 (probably) tcp and 53 udp. Assuming
this is true.

|
| #!/bin/sh iptables -F

This only flushes the filter table and not the nat table. You have to
"iptables -F -t nat" in order to flush the nat table too.

| iptables -A INPUT -p ALL -j ACCEPT

Probaly this is not what you want. This means that everybody can
connect fron anywhere to all services on the squid-box. You should
restrict access as much as possible, e.g.

iptables -A INPUT -p tcp -s $LAN_ADDRESS/$NETMASK --dport 3128 -m state \
- --state NEW,ESTABLISHED,RELATED -j accept

Note that you have to allow outgoing packages in the OUTPUT chain too:

iptables -A OUTPUT -p tcp -d $LAN_ADDRESS/$NETMASK --sport 3128 -m state =
\
- --state ESTABLISHED,RELATED -j accept

Note, that you have to allow outgoing connections from squid (probably
to dest-port 80) too. You don't have to worry about POP3,..., in these
chains because they will be forwarded and thus traverse only the
FORWARD chain in filter table.

| iptables -A PREROUTING -t nat -d squidip -p tcp --dport 110 -j DNAT
|  --to popserver

You can do it this way. Remember, that only NEW packages (with SYN
set) will hit this rule. Next step is to allow these connection in
FORWARD chain (assuming the policy id DROP or REJECT).

iptables -A FORWARD -p tcp --dport 110 -d $POPSERVER -m state \
- --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --sport 110 -s $POPSERVER -m state \
- --state ESTABLISHED,RELATED -j ACCEPT

Hmm, quite rude - but should work.

| iptables -I PREROUTING -t nat -d squidip -p udp --dport 110 -j DNAT
|  --to popserver iptables -A POSTROUTING -t nat -s popserver -p tcp
| --dport 110 -j SNAT --to squidip

No. You have to SNAT your LAN to $SQUIDIP, e.g.

iptables -t nat -A POSTROUTING -p tcp --dport 110 -d $POPSERVER -j
SNAT --to $SQUIDIP

Of course, this assumes that your firewall (with the public address)
does SNAT too.

| iptables -A POSTROUTING -t nat -s popserver -p udp --dport 110 -j
| SNAT --to squdip service iptables save /etc/rc.d/init.d/iptables
| restart

There is no rule for DNS in your ruleset, so this will - with policy
drop - not work. You have to allow only udp from port 53 to port 53
for normal DNS queries.

And don't forget to allow ICMP "Destination Unreachable" :)

HTH, have a nice time

Joerg

- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCJE7ht9fkjiZ7IE8RAmVwAKCvN4FoUfI2hGXlpSAqSrYOt0WSPACgobfY
EIXJt+4w8wx/5WUabEraeyg=3D
=3DC/pk
-----END PGP SIGNATURE-----



