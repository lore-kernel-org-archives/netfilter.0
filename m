From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: How can Iget multiple outgoing VPN (pptp) connections with
	iptablesand snat?
Date: Thu, 7 Apr 2005 07:08:06 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A5A@pxtvjoexd01.pxt.primeexalia.com>
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
To: AKholod <scom_andrey@mail.ru>, netfilter@lists.netfilter.org

Download patch-o-matic-ng (one the daily snapshot from last night would
be best as Harold has just made changes to the code), patch the kernel
and then recompile your kernel and iptables.

If you want PPTP you might also want to patch your kernel with mppe and
possibly bsd_comp as well.

You might also want to include what kernel you are running this on.  I
have had problems with a couple RH versions.  The latest works with RHEL
4

Gary Smith

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of AKholod
> Sent: Wednesday, April 06, 2005 5:53 AM
> To: netfilter@lists.netfilter.org
> Subject: How can Iget multiple outgoing VPN (pptp) connections with
> iptablesand snat?
>=20
> I have problem. Multiple clients in our corporate network need access
to
> remote network by VPN - PPTP protocol, VPN gate to the remote network
is
> CISCO router with VPN support. I study many forums and find four
solutions
> for setup VPN connection:
>=20
> 1) VPN masquerading for old kernel - 2.0, 2.2
>=20
> 2) Special external program - pptpproxy
>=20
> 3) I find links to iptables extensions -
> <http://cvs.netfilter.org/netfilter-extensions/helpers/pptp/>
ip_nat_pptp,
> ip_conntrack_pptp, ip_nat_proto_gre, ip_conntrack_proto_gre, but I
don't
> find any sources for this modules.
>=20
> 4) Add next rules in iptables startup script:
>=20
>=20
>=20
> $IPTABLES -A FORWARD -p tcp --dport 1723 -i $LAN_IFACE -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p 47 -i $LAN_IFACE -j ACCEPT
>=20
>=20
>=20
> And finally I have question: "How CORRECT (RECOMMENDED BY DEVELOPERS)
way
> for setup iptables version 1.2.11 and Linux kernel 2.6 for admission
> multiple outgoing PPTP VPN connections?"
>=20
>=20
>=20
> Best regards,
>=20
> Andrey Kholod


