From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: AW: GRE/PPTP and modules
Date: Thu, 29 Apr 2004 17:27:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083252452.4884.113.camel@anduril.intranet.cartel-securite.net>
References: <D3DD55FDB74AD511BA5100500416368053E88E@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053E88E@ORION>
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
To: Jochen Vogel <jvogel@it-sec.de>
Cc: netfilter@lists.netfilter.org

Le jeu 29/04/2004 =E0 17:19, Jochen Vogel a =E9crit :
> > 	ip_conntrack_proto_gre
> > 	ip_conntrack_pptp
> > 	ip_nat_proto_gre
> > 	ip_nat_pptp
> I use fedora1.0 and cant find this modules.
> I think thats in the patchomatic.

Yep, right :

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conn=
track-nat

> What should i do to get the modules?

1. get iptables 1.2.9, patch-o-matic-ng and kernel sources (you can use
   Fedora SRPM package)
2. patch kernel sources using patch-o-matic-ng (see README)
3. configure, build and install pacthed kernel (you should be able to
   create a new RPM package, see RedHat documentation)
4. build and install iptables

You're done. Serve warm and enjoy.=09


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

