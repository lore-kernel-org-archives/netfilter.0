From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Allowing access only some sites - onely some mac address
Date: Tue, 30 Aug 2005 09:39:18 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FD017@farmer.vikus.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Grant Taylor
> Sent: Monday, August 29, 2005 10:28 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Allowing access only some sites - onely some mac address
>=20
> Sebasti=E3o Ant=F4nio Campos (GWA) wrote:
> > I have a list of the mac address 00:0c:6E:11:E8:B0,=20
> 00:D8:02:D8:C8:DF,=20
> > 00:E7:05:C9:07:EA............ and and I'd like that only these mac=20
> > address could access only the following IP: 200.221.2.128,=20
> > 200.221.2.129, 200.221.2.130, 200.221.2.131, 200.205.144.75,=20
> > 200.205.144.76. But the other mac address could access everything.
>=20
> I would be tempted to do something like the following:
>=20
> # Create a new chain to put the allowed sites in for filtered MACs.
> iptables -t filter -N MACFilteredSites
>=20
> # Watch for a specific MAC address and jump to said chain on matches.
> iptables -t filter -A FORWARD -i ${LAN} -o ${INet} -m mac=20
> --mac-source 00:0c:6E:11:E8:B0 -j MACFilterdSites iptables -t=20
> filter -A FORWARD -i ${LAN} -o ${INet} -m mac --mac-source=20
> 00:D8:02:D8:C8:DF -j MACFilterdSites iptables -t filter -A=20
> FORWARD -i ${LAN} -o ${INet} -m mac --mac-source=20
> 00:E7:05:C9:07:EA -j MACFilterdSites
>=20
> # Only allow the filtered MACs to go to these sites (IP addresses).
> # Note:  We do not need to test for -i and -o interfaces b/c=20
> we tested for this before we got to this chain.
> iptables -t filter -A MACFilteredSites -d 200.221.2.128 -j=20
> RETURN iptables -t filter -A MACFilteredSites -d=20
> 200.221.2.129 -j RETURN iptables -t filter -A=20
> MACFilteredSites -d 200.221.2.130 -j RETURN iptables -t=20
> filter -A MACFilteredSites -d 200.221.2.131 -j RETURN=20
> iptables -t filter -A MACFilteredSites -d 200.205.144.75 -j=20
> RETURN iptables -t filter -A MACFilteredSites -d=20
> 200.205.144.76 -j RETURN iptables -t filter -A=20
> MACFilteredSites -j LOG iptables -t filter -A MACFilteredSites -j DROP
>=20
>=20
>=20
> Grant. . . .
>=20

You may also want to consider getting arpwatch. arpwatch will tell you =
when a particular user changes their MAC address. MAC spoofing, while =
more difficult than IP spoofing, is still fairly trivial and =
particularly in this case where you are using a "blacklist" approach for =
filtering MACs. So if I'm the one with MAC 00:D8:02:D8:C8:DF and I want =
to get around your rules, I'll get a utility to change my MAC to =
something that won't trigger your firewall rule, like 10:D8:02:D8:C8:DF, =
which I can be sure won't collide with another MAC for quite some time.

If the particular users you are trying to filter for aren't very =
technical then I wouldn't worry but after two years of being a lab =
assistant/server admin for a network security class I tend to be a =
little paranoid. =3D)

Derick Anderson

