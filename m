From: Mark Vevers <mark@ifl.net>
Subject: Re: active firewall
Date: Tue, 23 Sep 2003 16:11:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309231611.20748.mark@ifl.net>
References: <03092320103102.01185@slinky.exmosys.com>
Reply-To: mark@ifl.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03092320103102.01185@slinky.exmosys.com>
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
To: Nik Trevallyn-Jones <nik@designer.com.au>, netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 23 Sep 2003 2:26 pm, Nik Trevallyn-Jones wrote:

> 1  two new targets: ENLIST, DELIST
> These targets effectively cause one or more new rules to be automatically
> added/removed to/from the firewall in response to matching the associated
> rule. This allows the firewall to respond to certain events by
> adding/deleting rules within itself.
You can do most of what you are after with the 'RECENT' match and target ...

I.e. if 'X' seen from 'Y' within n seconds - block Y=20
You can create some quite interesting rulesets with recent and a few logic
chains .....

Mark
=2D --=20
Mark Vevers.    mark@ifl.net / mvevers@rm.com
Principal Internet Engineer, Internet for Learning,
Research Machines Plc  AS 5503
Tel: +44 1235 854314,   Fax: +44 1235 854693
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/cGKVWLU9HLCPPKMRAs7pAJ94G/Tra46YJhANHjxcax+xFFeYHACfbpf5
ETRkADtzBYezwEUZq/qNzHg=3D
=3DmNJy
=2D----END PGP SIGNATURE-----


