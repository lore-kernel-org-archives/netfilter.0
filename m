From: LuisMi <luismi@adpsoft.com>
Subject: what traffic is this?
Date: Wed, 26 Jun 2002 13:23:18 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206261322180.24216-100000@ns2.adpsoft.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This traffic comes from a cisco router.
what type of traffic is ?

[root@cuelebre root]# tcpdump -i eth2
tcpdump: listening on eth2

13:19:12.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000
13:19:22.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000
13:19:32.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000
13:19:42.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000
13:19:52.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000
13:20:02.660000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
                         0000 0100 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000 0000
                         0000 0000 0000 0000 0000 0000 0000

6 packets received by filter
0 packets dropped by kernel


- -- 
Luis Miguel Cruz.  

PGP KEY: 0x3AC52657   |   [ADPSOFT] http://www.adpsoft.com
		      |      "Connecting your business"
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj0ZpCoACgkQvQHLTzrFJleWvQCfXENyDw/upk4JZcfUdx6SbQPT
V7YAn2Gy1o9vhmTJXq7Livz++cAgJ7DM
=anWn
-----END PGP SIGNATURE-----


