From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Paching...
Date: Thu, 20 May 2004 09:46:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679359@alderaan.smgtec.com>
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
To: Sez <sezmillenium@yahoo.es>, netfilter@lists.netfilter.org

Sez wrote:
> Hi people,
>=20
> I am paching a kernet with pom. I recompiled all the kernel and i
> installed this. Moreover, i compile iptables and installed this. Can
> I know if i installed succesfull the pom in kernel with some command?
> I want to use nat with pptp, and i want to know if i do this well...=20

When the kernel is installed, there should be a module called
ip_conntrack_pptp,  ip_conntrack_gre, ip_nat_pptp, and ip_nat_gre. If
those modules can be loaded, then the POM was successful (assuming you
did install them to the kernel). Remember, it's a pretty good idea to
always manually load these as modules and not place them right into the
kernel. There's no need to place these modules into the main kernel for
most ppl.


