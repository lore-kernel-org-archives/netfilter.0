From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: IPSec passthrough with iptables
Date: Tue, 15 Oct 2002 09:32:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F88@w2ks-e2k.iconos.be>
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
To: Thomas Smith <hpcaz@yahoo.com>, netfilter@lists.netfilter.org

Hi,

Thomas Smith [mailto:hpcaz@yahoo.com] wrote:
>=20
> I need to be able to connect to clients IPSec VPN from
> behind and iptables firewall. I know the VPN is
> working and my firewall is masquing traffic but IPSec
> doesn't work from systems behind my firewall.
>=20
> I've got a pretty basic firewall. It's simply masquing
> internal traffic.
>=20
> Are there some iptables' rules or patches I'm missing?
>=20

Well, you only need to allow udp port 500 traffic for IKE,
and protocols 50 (ESP) and 51 (AH).

However, you will find that most types of AH and NAT don't=20
mix all that well, unless you do some really clever (read:=20
hackish) NAT tricks. Basically, the IP addresses on both=20
sides may not be NAT'ted. If you use NAT, you must NAT the
addresses back before they reach the other side.

Regards,
Filip

