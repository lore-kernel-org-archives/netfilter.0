From: =?iso-8859-1?q?Sig=FE=F3r_Jar=F0arson?= <cshobe@somerandomdomain.com>
Subject: Error message change request
Date: Thu, 18 Sep 2003 20:56:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309182056.03816.cshobe@somerandomdomain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hey all,

I have a quick request - a change to an error message.

A friend I sold a server to called me insistant that iptables was broken on=
=20
the firewall I sold him.

He was trying the following, and got the following message:

superuser root@hydrogen:/home/root
# /bin/iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 --dport 22 -j ACCEPT
iptables v1.2.7a: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.

I figured out that he missed -p tcp, but the error is misleading.

I think it should instead say something like "iptables v1.2.7a: Argument=20
`--dport' cannot be used in this context" or something.

=2D-=20
Sig=FE=F3r Jar=F0arson
cshobe@somerandomdomain.com

"First off, I'd suggest printing out a copy of the GNU coding standards,
and NOT read it.  Burn them, it's a great symbolic gesture."
     -- Linus Torvalds

