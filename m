From: Rocco Stanzione <grasshopper@linuxkungfu.org>
Subject: Re: clear the ip_conntrack entry
Date: Thu, 26 Jun 2003 13:21:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306261321.55275.grasshopper@linuxkungfu.org>
References: <20030625110648.E38F.YOUNGH0702@21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030625110648.E38F.YOUNGH0702@21cn.com>
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

I recently reached the same conclusion when unsuccessfully testing cutter. =
 It=20
didn't kill the connection but it did remove the conntrack entry, so I=20
figured the RST packets might be doing the trick.

On Tuesday 24 June 2003 10:06 pm, =D1=EE=BB=AA spake thusly:
> Hi everyone :
> 	I have notice that many request about how to clear the
> /proc/net/ip_conntrack entry , and someone suggest that it have no
> resolution except restart the interface .
> 	I think the answer : send a fake ip packet (with RST set) to
> firewall , to let it think the connection terminate .
> 	By this methode , I have the following script written , it work
> well for me.
> 	To use this script , you must have hping2 installed , it can be
> download from http://www.hping.org
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE++znDSCmJfrlriowRAuc7AKDo0NRLi4sqXACU66x8l+T9cQeJjACfYk8F
ta8F/i4Ke4B3rYRNuiqc3gM=3D
=3D7GIt
=2D----END PGP SIGNATURE-----


