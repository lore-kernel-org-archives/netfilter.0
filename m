From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: TCM MSS control over OUTPUT chain
Date: 03 May 2003 13:36:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051961817.25880.15.camel@elendil.intranet.cartel-securite.net>
References: <000001c31165$b8cfc8a0$100aa8c0@bwhwangnotepc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c31165$b8cfc8a0$100aa8c0@bwhwangnotepc>
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
To: "Hwang, Byoung Woo" <bwh@net-safe.co.kr>
Cc: netfilter@lists.netfilter.org

Le sam 03/05/2003 =E0 13:18, Hwang, Byoung Woo a =E9crit :
[...]
> but
> packets from Internal LAN to Internet which are NATed by Masquerading
> are
> not controlled on TCP MSS size.
> I have a reason why I cannot control on FORWARD chain.

Problem is packets forwarded by your gateway do not cross OUTPUT chain,
just FORWARD chain. Maybe you can try apply this kind of rule on mangle
table* POSTROUTING chain ?

* Should TCPMSS target only be available in mangle table ?

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

