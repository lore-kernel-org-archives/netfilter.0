From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: GRE/PPTP and modules
Date: Thu, 29 Apr 2004 17:11:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083251515.4884.105.camel@anduril.intranet.cartel-securite.net>
References: <D3DD55FDB74AD511BA5100500416368053E88A@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053E88A@ORION>
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

Le jeu 29/04/2004 =E0 16:47, Jochen Vogel a =E9crit :
[PPTP/GRE rules]
> Do i need any modules?

Yes. you need GRE and PPTP conntrack modules (PPTP conntracking depends
on GRE conntracking) :

	ip_conntrack_proto_gre
	ip_conntrack_pptp

If you use NAT, you'll need additional modules as well :

	ip_nat_proto_gre
	ip_nat_pptp


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

