From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: PPTP NAT and iptables compilation
Date: Mon, 29 Mar 2004 14:11:08 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679275@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: ihernandez@cinemasoft.com.ar, netfilter@lists.netfilter.org

I haven't tried it myself since I am in between upgrades, but why not
try out pom-ng? I am almost positive that you need:
pom-ng + iptables from CVS in order for things to work fine. I've tried
various combinations of userspace 1.2.9+ and POM, but they have
regularty broken since POM-ng has been developed. The iptables module in
CVS doesn't support the old POM.

ihernandez@cinemasoft.com.ar wrote:
> Hello. i have used patch-o-matic to add the pptp-nat helper module
> kernel works fine, but userspace iptables tool fails with: "iptables:
> Invalid argument"=20
>=20
> i have seen a lot of posts and the solution is to compile the
> iptables-1.2.9 tools i downloaded a fresh copy from www.netfilter.org
> and run make KERNEL_DIR=3Dmykerneldir it says: Extensions found:
> IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh
> IPv6:dst IPv6:rt   =20
>=20
> then i install.
> fine, but it continues with it's problems!!!!
> what can i do to compile the tools th right way?

