From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: DNAT +2 uplinks +route=GO
Date: Thu, 16 Oct 2003 19:30:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E129603A@ibfdmail.ibfd.oin>
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
To: netfilter list <netfilter@lists.netfilter.org>

The lowdown:

Repeat situation description:
- 2 uplinks with own public address space
- 1 internal network with private address space

Goal: do DNAT through address in both public ranges, converging on =
internal hosts:
ExtIP1 > IntIP1
ExtIP2 > IntIP1

Everything is done in iptables, nothing was changed in the standard =
route/rules setup.

Trick used:
iptables -t nat -A PREROUTING -i $ExtNet1 -p tcp -d =
$ExtAddress1InternalHost \
-j DNAT --to-destination $IntAddressInternalHost

iptables -t nat -A PREROUTING -i $ExtNet2 -p tcp -d =
$ExtAddress2InternalHost \
-j DNAT --to-destination $IntAddressInternalHost

This part is easy and works. The return path is the problem.

Solution:

iptables -t mangel -A POSTROUTING -s $IntNet/IntMask -m conntrack \
--ctorigdst $ExtAddressRange1/ExtAddressRange1Mask \
--ctstate ESTABLISHED,RELATED
-j ROUTE --gw GWExtNet1 --oif IFExtNet1 --continue

iptables -t mangel -A POSTROUTING -s $IntNet/IntMask -m conntrack \
--ctorigdst $ExtAddressRange2/ExtAddressRange2Mask \
--ctstate ESTABLISHED,RELATED
-j ROUTE --gw GWExtNet2 --oif IFExtNet2 --continue

Caveats:
To get routing working, you _must_ have Equal-cost-multipath routing =
enabled in the kernel and you must set up a multipath route over both =
links. If someone can explain to me why I would be very thankfull. =
Simply adding another default route with different metric won't work.

You need a recent p-o-m and iptables to use the --continue. You _need_ =
the --continue or UnDNATting will not be performed (you jump out on the =
-j ROUTE).

If you want even more flexibility, you can use the other suggested =
route: instead of -j ROUTE, use -j MARK x where x is different for each =
uplink to match. You can then proceed to use iproute2+tc and 'rules' =
based on fwmark to do even more funky stuff.

Thanks for all the help and suggestions, I hope this helps some other =
poor schmuck who is at a loss.

Gaby Schilders
IBFD network admin

