From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Simple Blackberry Enterprise configuration
Date: Wed, 17 Nov 2004 10:05:51 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E391@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: mclinden@informed.net, netfilter@lists.netfilter.org

mclinden@informed.net wrote:
> I have two users who need to be able to ORIGINATE bidirectional
> communication from an internal site using port 3101 in order to read
> e-mail using their Blackberries and the Server Relay Protocol. This
> should be fairly simple but if anyone has done this and could point
> me to a reference it would be appreciated.
>=20
> Sean McLinden
> Allegheny County Health Department

You want to force the source address of the transmission? I doubt that
Rim would care which source port the data's coming from. More
importantly, are you having a problem connecting them to your internal
network's BB server from outside the company?

I'm not sure of the security of the BB server, so this may make your
systems very insecure, but if you wanted your internet server visible to
the internet, you'd add the following to a typical restrictive netfilter
firewall configration.

iptables -A PREROUTING --destination ${IN_ADDR} -p tcp --dport 3101 -j
DNAT --to ${BB_SERVER}
iptables -A FORWARD --destination ${BB_SERVERR} -p tcp --dport 3101 -j
ACCEPT

