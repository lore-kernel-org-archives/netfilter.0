From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Newb here,
	I need help opening port 1723 and setting a public IP address to
	aprivate IP
Date: Wed, 28 Sep 2005 16:15:26 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5809@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Daniel,=20

You should also take a look at pptp-client.sourceforge.net.  It has a
lot of information regarding the PPTP subject.  I have had to implement
several PPTP servers and clients in Linux.  I have found that it's no
fun when you run into the issue of NAT'd clients behind a Linux
firewall.  You have to do small things like recompile the kernel, etc.

Gary Smith

>=20
> Hmmm, I would advise anyone to move away from PPTP in particular and
> from Windows in general. PPTP has known vulnerabilities. OpenVPN is a
> real winner with multiplatform support and using OpenSSL for crypto
> code ... as opposed to MPPE ... ugh!
>=20
> I'll spare the list any OS advocacy, but I do believe you can do much
> more on Linux, and more safely, and without the uncertainty which is
> built-in to proprietary junkware.
>=20
> Anyway, this list is probably not a good place to find out about
> features in Windows.
>=20
> > I need the vpn's Public IP to point to the private IP of our
> > VPN server
>=20

