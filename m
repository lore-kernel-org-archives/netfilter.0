From: Security <security@ezsm.net >
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Mon, 27 Oct 2003 16:53:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310271553.32637.security@ezsm.net>
References: <web-171348616@mail01.infosat.net>
Reply-To: security@ezsm.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-171348616@mail01.infosat.net>
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
To: Warren P <warrenp@websurfer.co.za>, netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Easy way to find out...try to remove the module..if it has no rules using=20
it...it won't complain..and will just remove.  But if that is really your=20
only iptables rule..then I don't see any need for that module.

NH
On Monday 27 October 2003 3:46 pm, Warren P wrote:
> Hi
>
> Thanks ...
>
> But tell me ... do i really need ip_conntrack? What would
> happen if i remove it permanently ... how will this affect
> my IP Table rule ...
> I've only got one rule:
> e.g: iptables -t nat -A PREROUTING -p tcp --dport 80 -j
> DNAT --to 192.168.22.33:3128
>
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/nYXLPEfiOMhBaIMRAtULAJ43uhg79Vc8SqAxtkaqb+oQrfWSxwCeJL6E
YXSKRgYWg4tisifll8ed1ac=3D
=3DIVGt
=2D----END PGP SIGNATURE-----


