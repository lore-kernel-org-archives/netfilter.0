From: Curtis Hogg <buckminst@inconnu.isu.edu>
Subject: IPchains to IPtables migration question.
Date: Wed, 13 Nov 2002 04:13:33 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211130400430.13622-100000@inconnu.isu.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am considering migrating my linux masquerade router from ipchains to 
iptables, and have a few questions that will influence my decision.

The questions I have are:
1) What rules will I need, to duplicate what my current setup does? 
Pointers would be welcome, examples more so. I took a look at iptables 
HOWTOs for masquerading a while ago and it seemed very complicated as 
opposed to ipchains.

2) Will migrating to iptables resolve an error I am currently 
experiencing? The specific error is: 

Oct 25 08:52:29 uotani-arisa kernel: ip_input(): demasq recursion 
detected. Check masq modules configuration

3) Are there rules or modules to handle the protocol-specific needs I am 
currently using ipchains masquerade modules to handle?

This is my ipchains / network setup:

Packet Path:
Internet <-> ipchains box <-> switch <-> 3 workstations, 1 wireless ap

I'm using the following rules for handling my masquerading:
To set up the masq:
ipchains -A forward -j MASQ -s 10.0.0.0/8 -d 0.0.0.0/0

To forward DCC ports from IRC:
ipchains -A input --proto tcp --dport 1024:5000 -j ACCEPT -b
ipchains -A input --proto udp --dport 1024:5000 -j ACCEPT -b

To forward ICQ sends:
ipchains -A input --proto tcp --dport 60200:65535 -j ACCEPT -b
ipchains -A input --proto udp --dport 60200:65535 -j ACCEPT -b

I also use the following protocol-specific masq modules:
For Netmeeting:
ip_masq_h323

For ICQ:
ip_masq_icq

For IRC:
ip_masq_irc

For FTP:
ip_masq_ftp

For DirectPlay:
ip_masq_dplay

- -- 
Curtis Hogg [buckminst at inconnu dot isu dot edu]
hogwash Developer [http://hogwash.sourceforge.net]
- ----------------------------------------------

A star captain's most solemn oath is that he will give his life, even
his entire crew, rather than violate the Prime Directive.
		-- Kirk, "The Omega Glory", stardate unknown
- ----------------------------------------------
WWW - http://www.furuba.net
ICQ - 1738575 [Authorization Required]

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE90jPmrn6Ei15FGb8RAvkaAJ961q0jcg38c9qQy1fWAi1Uqil8+QCfQLAs
sc1XVpF51vxlkUerhRR8QPU=
=UVOV
-----END PGP SIGNATURE-----


