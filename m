From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: IPSEC and other non tcp/udp/icmp blocking
Date: Mon, 14 Oct 2002 13:37:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F80@w2ks-e2k.iconos.be>
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
To: murli@icafe.co.tz, netfilter@lists.netfilter.org

Hi,

Mitesh P Choksi [mailto:murli@icafe.co.tz] wrote:
>=20
> How does netfilter work with other protocols apart tcp/udp/icmp?
>=20
> I am trying to either block or account IPSec traffic.
>=20

Well that can be done with:

iptables -A ... -p udp --dport 500 -j ...=20
iptables -A ... -p 50 -j ...
iptables -A ... -p 51 -j ...

for IKE, ESP and AH respectively. You may also want to=20
look at the "ah" and "esp" matches that allow you to=20
match against the SPI of AH and ESP IPsec traffic.
Those matches are in the standard kernel.

Regards,
Filip

