From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 10:42:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F52@alderaan.smgtec.com>
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
To: Sezmillenium <sezmillenium@yahoo.es>, netfilter@lists.netfilter.org



Sezmillenium wrote:
> Hi!
>=20
> OK. I have this situation
>=20
>=20
> VPN_CLIENT(w2k box) ---> router ---> FIREWALL (NAT) ---> M$ Server
>=20
>=20
> I want to configure only the Firewall.
>=20
> First, I tried to create a connection with pptp. Pptp need protocol
> GRE and iptables don't support nat with protocol GRE. I must
> recompile the Kernel... =20

Option #1
Patch the kernel with POM. This isn't that hard. It should probably be
done for all the other really-good-things inside the newer netfilter
system.

Option #2
You can support One2One NAT as follows:

# This is one to one NAT with an extra field to discriminate which
client IP address the data is coming from.
# If you want to have multiple clients connect to the system
simultaniously, you repeat these rules for every client you have (NOTE
you need a public Ip for each one)
# If you want many clients, but only one at a time, you can drop the
fields with ${CLI_IP1} in it. This will mean that if > 1 person uses the
VPN at any given time, the VPN will die for one of them, but it means
you don't need an IP address for each user.
iptables -A PREROUTING --source ${CLI_IP1} --destination ${PUBLIC_IP1}
-j DNAT --to ${VPNSERVER}
iptables -A FORWARD --source ${CLI_IP1} --destination ${VPNSERVER} -j
ACCEPT
iptables -A FORWARD --source ${VPNSERVER} --destination ${CLI_IP1} -j
ACCEPT
iptables -A POSTROUTING --source ${VPNSERVER} --destination ${CLI_IP1}
-j DNAT --to ${PUBLIC_IP1}

Option #3
You can host PPTP or IPSEC from your machine. This probably also
involves kernel patching but its by far the best solution. You could
filter traffic coming and going from the VPN tunnel right from the
firewall. This prevents road warriors from infecting home office with
worms, etc.. Well, at least a well defined ruleset does.

PPTP
Look for poptop and pppd with the radius_plugin. This way, it works like
your micrsoft PPTP server but you don't need the firewall workaround. In
order for this to work, you need to spend 10 minutes learning the basics
of radius and setup "Internet Authentication Server" on a windows
2000/2003 DC.

IPSec
If you want Ipsec, you can also look at what used to be freeswan.org and
is now a lot of smaller projects apparently.

