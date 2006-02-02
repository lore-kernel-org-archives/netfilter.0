From: "Eray Aslan" <eray.aslan@caf.com.tr>
Subject: RE: --tcp-flags  option
Date: Thu, 2 Feb 2006 08:20:50 +0200
Message-ID: <4FE82EE778704E4D9D31E9CE0BEC14650D2F3D@caf02.caf.local>
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
To: P theodorou <props666999@hotmail.com>, netfilter@lists.netfilter.org

> Could someone explain the tcp-flag options
>=20
>=20
> like the following line  what does it mean ?
> tcp-flags SYN,RST SYN,RST
>=20
> why between RST and SYN there is no comma?
>=20
tcp-flags x,y,z x,y examines flags x, y and z and matches if x and y are
set and z is unset.

man 8 iptables for more info.

--=20
Eray

