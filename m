From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: non-standard FTP ports and connection tracking
Date: Mon, 9 Dec 2002 16:46:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091646.22615.apapadop@cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi. I have a small problem with ftp_conntrack module (I guess).

Scenario:
=3D=3D=3D=3D=3D=3D
I run iptables 1.2.6a and an ftp server (publicfile) on a machine=20
directly connected to the Internet. Connection tracking works fine when=20
the ftp server listens on the standard port (21), but seems to break=20
when I set the ftp server to listen to a non-standard high port (say,=20
2121).

I set both incoming and outgoing default action to DROP, load the=20
connection tracking modules in my firewall script:

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp

and try to allow traffic for my ftp server only.

What happens:
=3D=3D=3D=3D=3D=3D=3D=3D=3D

If the ftp server uses port 21 (standard setup), it works fine:

[] ftpd listening on port 21
[] client connects -> connection from high port to my 21 is established
[] client requests directory listing -> connection from my high port to=20
another high port of the client is established

Rules: (all defaults are DROP)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

## Allow connections to our ftp server
/sbin/iptables -A INPUT -p tcp --dport 21 -j ACCEPT

## Allow data for incoming FTP to return back to sender
/sbin/iptables -A OUTPUT -p tcp --sport 21 --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT

## Allow outgoing FTP (data) + HTTP replies
/sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT


The problem:
=3D=3D=3D=3D=3D=3D=3D=3D

But, when I set the server to listen to port 2121...:

[] ftpd listens on 2121
[] client connects -> connection from high port to my 2121 established
[] client requests directory listing -> netfilter drops packets for the=20
new (but related) connection that tries to be established, and user=20
never sees the directory listing. Last packets that gets through is the=20
one that carries the "150 Making transfer connection..." message.

The rules in this case have only the port number changed, but here they=20
are in case I'm doing something wrong:

## Allow connections to our ftp server
/sbin/iptables -A INPUT -p tcp --dport 2121 -j ACCEPT

## Allow outgoing FTP (data) + HTTP replies!
/sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT

## Allow data for incoming FTP to return back to sender
/sbin/iptables -A OUTPUT -p tcp --sport 2121 --dport 1024: -m state=20
- --state ESTABLISHED,RELATED -j ACCEPT


Any ideas?

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE99Q8ugmAMwQt1gmURApAKAJwJtYh0HFT9A5IX2xI8hVICwydt8QCeNLti
lE569iwhEPzYdRw4zHnsWAQ=3D
=3DTM8O
-----END PGP SIGNATURE-----


