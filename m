From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Mon, 9 Dec 2002 21:46:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212092146.39732.apapadop@cmu.edu>
References: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A414C@olga.chs.chalmers.se> <200212091805.06266.apapadop@cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091805.06266.apapadop@cmu.edu>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Actually, it doesn't work like a charm. It seems that only active=20
connections can be established. When the client switches to passive=20
mode, the SYN packets it sends to my ftp server never make it through.=20
:-(

I have the following in my script:

## Insert connection-tracking modules.
/sbin/modprobe ipt_state
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp ports=3D2121
#/sbin/modprobe ipt_owner

## Flush all rules
/sbin/iptables -F
## Delete all custom tables
/sbin/iptables -X
## Zero all counters
/sbin/iptables -Z

## Set default policy to DROP for all chains
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT DROP

#####################
#### CHAIN INPUT ####
#####################

## Accept everything incoming on loopback interface
/sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -i lo -j ACCEPT

## Accept all incoming traffic from related or established connections
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

## Allow connections to our ftp server
/sbin/iptables -A INPUT -p tcp --dport 2121 -j ACCEPT


=2E.but still, the packets with the SYN flag set when the client tries to=
=20
establish the new data connection are dropped. Someone please tell me=20
what am I missing? I'm sure it's something obvious but I can't seem to=20
find it!

In case it helps, here's the output of /sbin/lsmod ^ip :

iptable_filter          2412   1  (autoclean)
ip_conntrack_ftp        5088   0  (unused)
ipt_state               1048   5
ip_conntrack           21244   2  [ip_conntrack_ftp ipt_state]
ip_tables              14936   2  [iptable_filter ipt_state]

(I don't do NAT - this is a single-homed machine)

Thanks

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE99VWPgmAMwQt1gmURAh/WAJ9SSTwSq4W3vIV2ZY+75JNIqHGyCwCfUkPf
3vAEp5uSYj7mUdrZcC/oCPE=3D
=3DQDnL
-----END PGP SIGNATURE-----


