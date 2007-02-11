From: Franck Joncourt <joncourt_franck@yahoo.co.uk>
Subject: Classify target
Date: Sun, 11 Feb 2007 15:13:11 +0100
Message-ID: <45CF2477.4070906@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I am looking for a set of rules in order to allow me to set priority on
traffic. I mean, when I use ftp my full bandwidth is used, and waiting
for a result on google for a minute is not a pleasure.

So, by now, I have found the classify match could be of interest to me.

Here is an example fom the iptables tutorial :

iptables -t mangle -A POSTROUTING -p tcp --dport 80 -j CLASSIFY
- --set-class 20:10

I have read quickly the lartc howto (15.10.1) and it does not seem that
easy. I suppose I have to create two classes, one for ftp traffic and
another one for the main traffic.

Could anyone confirm that the way I have to do ? If not, do you have a
clue or a link ?

- --
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFzyR3xJBTTnXAif4RAhBWAJwNKl53L4v1tG98zfaeY0uvw2f1twCgk6nQ
jD7nJQS75jGg3EZvsCOUiSg=3D
=3DBR6n
-----END PGP SIGNATURE-----

	=09
___________________________________________________________=20
Try the all-new Yahoo! Mail. "The New Version is radically easier to use" =
=96 The Wall Street Journal=20
http://uk.docs.yahoo.com/nowyoucan.html


