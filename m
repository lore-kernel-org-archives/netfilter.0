From: Aide Florent <faide@alphacent.com>
Subject: Re: SuSEfirewall2 and NAT help : i am so lost!
Date: Fri, 16 May 2003 14:49:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305161449.29544.faide@alphacent.com>
References: <20030515203925.GA48230@justpickone.org> <20030515211805.GA53289@justpickone.org> <20030515224546.GB53289@justpickone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030515224546.GB53289@justpickone.org>
Content-Description: clearsigned data
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Le Vendredi 16 Mai 2003 00:45, David T-G a =E9crit :
> Hi again, all --
> "you % % > need to turn on NAT" but no pointers to how to do so!

snip 8<------------

> %   Packet Filtering HOWTO: 'Mixing NAT and Packet Filtering'

snip 8<------------

> I've attached `iptables -L` so that you can see if anything looks wrong.

you should try

iptables -t nat -nvL

if you want to see what is "NATed" by your machine.

Hope it helps.

=46lorent AIDE
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+xN5YQe8gCED8yYERAtgkAJ4lXltzUv4ie9HjeJtflWQJ9OXWTgCfZ5B3
Kz5In1xJzzrbUMPz/porghg=3D
=3Da2hL
=2D----END PGP SIGNATURE-----



