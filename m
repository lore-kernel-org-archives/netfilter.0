From: Mark Vevers <mark@vevers.net>
Subject: Re: TCP flags
Date: Wed, 6 Nov 2002 12:30:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211061230.05922.mark@vevers.net>
References: <005401c2856b$099aa5c0$0bc8c80a@dolphin>
Reply-To: mark@vevers.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005401c2856b$099aa5c0$0bc8c80a@dolphin>
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
Content-Type: Text/Plain; charset="us-ascii"
To: Jet <yenjet.chan@eglobal.com.my>, "netfilter@lists" <netfilter@lists.netfilter.org>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 06 Nov 2002 08:03, Jet wrote:
> Can anyone just explain what is this means?
>
> iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
>
> I don't quite understand why there is a white space between SYN,FIN and
> SYN,FIN.
Yup - it means inspect the SYN and FIN flags and if they are both set drop =
the=20
packet.  i.e. just look at the SYN and FIN flags - don't worry about any=20
others when doing the test to see if the rule matches.

The first pair are the flags to inspect, the second pair (after the space) =
are=20
the state of the flags to test.

Mark
=2D --=20
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9yQtLWLU9HLCPPKMRAp8iAKCKQP6xrcuvP6UfglVcf0dl2owthwCfcKpU
7tz1W4J2UBkGvYH/dMTsZWU=3D
=3DFNMb
=2D----END PGP SIGNATURE-----


