From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: RE: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 13:34:13 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFAE9658@noveldc.novelgmt.mu>
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
To: Eugene Joubert <EugeneJ@centratel.co.za>
Cc: netfilter@lists.netfilter.org

Hi,
	Opening port 1491 does not work.  Any other idea?

	Thanks anyway.

	Gy

-----Original Message-----
From: Eugene Joubert [mailto:EugeneJ@centratel.co.za]=20
Sent: Wednesday, January 07, 2004 12:29 PM
Cc: netfilter@lists.netfilter.org
Subject: RE: MRTG and IPTABLES

Hi,

It uses SNMP protocol. I think this is built on top of the UDP protocol.
I
am not sure. Try opening up UDP port 1491.=20

Hope this helps

Eugene

-----Original Message-----
From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]=20
Sent: 07/01/2004 10:04 AM
To: Gilles Yue
Cc: netfilter@lists.netfilter.org
Subject: Re: MRTG and IPTABLES


On Wed, 2004-01-07 at 01:54, Gilles Yue wrote:
> MRTG cannot work properly due to iptables running.
>=20
> =20
>=20
> Anybody knows which port number to open to enable MRTG to work=20
> properly.
>=20
> =20
<snip>

No, not off hand but you can use a tool like Ethereal
(http://www.ethereal.com) or just tcpdump or even just log the ropped
packets in iptables to determine what MRTG is trying to do.  Good luck -
John
>=20
> =20
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20



