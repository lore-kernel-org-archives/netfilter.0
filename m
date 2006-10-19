From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Netbios over NAT
Date: Thu, 19 Oct 2006 13:52:12 -0400
Message-ID: <1161280332.3212.28.camel@localhost>
References: <af07baa70610190728o14b82f89u40525a9e35340e6e@mail.gmail.com>
	<1161272332.3212.12.camel@localhost> <4537B28D.4020708@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4537B28D.4020708@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

On Thu, 2006-10-19 at 19:14 +0200, Pascal Hambourg wrote:
> Hello,
>=20
> John A. Sullivan III a =C3=A9crit :
> >=20
> > As far as I know, most NetBIOS functionality works across NAT except fo=
r
> > browsing (and perhaps name registration).
>=20
> Isn't it because these functionnalities use IP broadcasts ?
>=20
No, they can be configured to use unicast packets and a WINS.  However,
even with unicast packets and WINS, it breaks when NAT is applied - John
--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


