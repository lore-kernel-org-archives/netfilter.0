From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Linux Firewall Problem
Date: Tue, 22 Nov 2005 08:04:30 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01309A7E3@mailbox.vikus.com>
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
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Paul Collen
> Sent: Tuesday, November 22, 2005 6:23 AM
> To: netfilter@lists.netfilter.org
> Subject: FW: Linux Firewall Problem
>=20
> Hello,
>=20
> I'm new to Linux and I've inherited a Webmin controlled=20
> firewall. I'm used to using a SonicWall firewall and just=20
> can't seem to get the hang of the Linux firewall. My problem=20
> is I need to allow Outlook Web Access through to a server.=20
> OWA is installed and can be used internally by going to the=20
> server i.e. http://server/exchange We have an IP address I=20
> can use to connect with but I just can't seem to let any=20
> traffic through to the server, let alone just port 80 and=20
> 443. Are there any firewall gurus that can give me some help please?
>=20
> Cheers,
>=20
> Pablo

As John pointed out there are a lot of good tutorials out there for
iptables and most of them should at least get you up and running. Some
advice with OWA, since I (am forced to) provide it externally where I
admin: set up forms based authentication, require HTTPS, and in
Exchange's System Manager, remove OWA functionality from any privileged
account. You should only need to open port 443 to the server (unless of
course it is your mail exchange).

Derick Anderson


