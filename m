From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Where libipt_MASQ.so (???)
Date: 04 Aug 2003 20:09:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060020543.667.2.camel@elendil.intranet.cartel-securite.net>
References: <1211419607.20030804184812@sevein.com>
	 <1060017482.26856.40.camel@kermit>  <15910078176.20030804195634@sevein.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <15910078176.20030804195634@sevein.com>
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
To: "=?ISO-8859-1?Q?Jes=FAs_Garc=EDa?= Crespo (aka Sevein)" <correo@sevein.com>
Cc: netfilter@lists.netfilter.org, Ralf Spenneberg <lists@spenneberg.org>

Le lun 04/08/2003 =E0 19:56, Jes=FAs Garc=EDa Crespo (aka Sevein) a =E9cr=
it :
> But the problem is that it can't find libipt_MASQ.so.

Yes, because you called MASQ target, that does not exist. That's why
iptables is looking for an extension it can't find.

> What I have to rename or replace? I can't understand you. And... '-j
> MASQ'? or '-j MASQUERADE'?

Use "-j MASQUERADE" just as written in the fine Netfilter documentation
(i.e. NAT HOWTO).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

