From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Firewall - RH 9.0
Date: Mon, 21 Jul 2003 13:41:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DFD@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Tom Eastep <teastep@shorewall.net>, Dubba Kor <dubbakor@hotmail.com>
Cc: netfilter@lists.netfilter.org

Tell Redhat to turn off all iptables and ipChains services. Now, every
line you write is like what everyone else here uses.

As to how to Start / Stop rules, etc... that you can either do manually
every time, at bootup in an init script, or just use an existing tool
that is supposed to do it all for you, like the tool listed below.

-----Original Message-----
From: Tom Eastep [mailto:teastep@shorewall.net]=20
Sent: Monday, July 21, 2003 1:01 PM
To: Dubba Kor
Cc: netfilter@lists.netfilter.org
Subject: Re: Firewall - RH 9.0

On Mon, 2003-07-21 at 12:37, Dubba Kor wrote:
> Hi All, I would like to build a firewall for my office network with
DMZ
>=20
> I have installed RedHat 9.0 in minimal installation mode (to use the
PC as=20
> Router/Firewall) with Kernel 2.4.20-8
>=20
> I am bit lost with the installation and usage of netfilters/IPtables.
If any=20
> of you can please write to me a step by step procedures in building a
new=20
> Firewall, I would really appreciate it very much. I looked on the
internet=20
> and all other documents/FAQs also. But, they all talk only advanced
use and=20
> configuration but not how to start and get into advanced mode.
>=20
> My ethernet interfaces are, eth0(Internet), eth1(DMZ) and eth2(LAN)
>=20

You might take a look at http://shorewall.net/three-interface.htm

-Tom
--=20
Tom Eastep    \ Shorewall - iptables made easy
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



