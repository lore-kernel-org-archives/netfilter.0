From: Jason Opperisano <Jopperisano@alphanumeric.com>
Subject: RE: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 19:29:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511B9@asimail2.alphanumeric.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: 'Real Cucumber' <monkcucumber@yahoo.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dunno if this is relevant--but I had similar symptoms SSH-ing to an OpenBSD
SSH server through IPTables on RH running through an OpenVPN tunnel
(RH/IPTables was the OVPN server)...  I didn't really spend the proper time
troubleshooting what was actually causing it--so this may not apply to your
situation at all... (enough disclaimers yet?)

What fixed it for me was setting the following in sshd_config of the SSH
server:

  ClientAliveInterval 10
  ClientAliveCountMax 6

Again--no idea if this is of any value to anyone...

- -j


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA9HBFqca8HlBdgZoRArZeAJ9rkciHNTmhDythmAkF9efUf2GC/ACeKys6
z3b6eXHHIcuFfkVQ50XI7ng=
=+8ya
-----END PGP SIGNATURE-----

-----Original Message-----
From: Real Cucumber [mailto:monkcucumber@yahoo.com] 
Sent: Tuesday, July 13, 2004 12:51 PM
To: netfilter@lists.netfilter.org
Subject: SSH Connections Lost After 1 minute idle


I have a fedora firewall/router using iptables to
forward incoming SSH packets to an internal server and
it works great....however, only if the user does not
remain idle for 1 minute.  If they idle for 1 minute,
the connection "freezes" in the sense that it drops
the connection but its not a proper "connectoin
closed" from the server as if it is a timelimit, but
rather just a connectoin loss like you've unplugged
your cable in the middle of a connection.

If the user is connecting from within the network,
they can remain idle for an unlimited amount of time
without being disconnected.  It is only ones
connecting from outside hte network going through the
iptables firewall that have this idle problem.

I am only allowing TCP and UDP for SSH to be
forwarded.

Do I need any ICMP or any other special connection
timeout rules on the iptables side to fix this
problem?

Any help appreciated!




	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

