From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: ftp behind the firewall
Date: Mon, 14 Feb 2005 15:27:34 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DDC7@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Travis Crook <travis@visionsbeyond.com>
Cc: netfilter@lists.netfilter.org

is ftp daemon set to handle passive ?


-----Original Message-----
From: Travis Crook [mailto:travis@visionsbeyond.com]
Sent: Monday, February 14, 2005 2:54 PM
To: Hudson Delbert J Contr 61 CS/SCBN
Cc: netfilter@lists.netfilter.org
Subject: RE: ftp behind the firewall


On Mon, 2005-02-14 at 09:25 -0800, Hudson Delbert J Contr 61 CS/SCBN
wrote:
> travis,
>=20
> re-state your scenario. its incomplete.
>=20
> how do you know its running fine?

Normal Web traffic, ftp users outside the firewall coming in, windows
boxes behind the firewall, etc. are all running and accessing
information as expected.
>=20
> what distro and version of linux are you running?

Mandrake 8.1, kernel 2.4.8-26mdk
>=20
> what doesn the config for ftp look like?

Rules for ftp:

# Network information you will need to adjust
INTERNALIF=3D"eth1"
INTERNALNET=3D"192.168.2.0/24"
INTERNALBCAST=3D"192.168.2.255"
EXTERNALIF=3D"eth0"
MYADDR=3D"12.42.147.158"  # Only needed for DNAT, leave out otherwise

#Insert modules- should be done automatically if needed
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

#Allow replies coming in
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#Send ftp to an internal machine
$IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport
20 -j DNAT --to 192.168.2.5:20
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 20 -j
ACCEPT

$IPTABLES -t nat -A PREROUTING -i $EXTERNALIF -p tcp -d $MYADDR --dport
21 -j DNAT --to-destination 192.168.2.5
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 21 -j
ACCEPT
$IPTABLES -A FORWARD -i $EXTERNALIF -o $INTERNALIF -p tcp --syn -d
192.168.2.5 --dport 21 -j ACCEPT
#Masquerade internal connections going out.
$IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE

>=20
> is the blocked by default.
>=20
> when you say my windows machines dont seem ot have this problem..
> where do these windoze boxen sit?

All computers (linux and windows) are on an internal network connected
via a switch to the firewall.
>=20
> anything anybody on this list offers up as a solution will not
> be thought out well and will basically be a guess.=20
>=20
> i'm a visual person - draw me pix of your networks and=20
> sanitize the ip with rfc1918 addresses and bitmasks as it

Not quite sure I understand this...

> makes no difference as its all cidr.....
>=20

Network picture

Internet --> firewall --> internal network (linux and windows)

firewall --> incoming ports: 80, 8080, 110, 25, 443, 143, 20, 21, all
get routed to internal servers.  The rest are dropped/denied.

internal network: should be completely masqueraded by the firewall
#Masquerade internal connections going out.
$IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE


> guessing is a bad idea....
>=20
Agreed.
>=20
> need waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaay more info.
>=20

Anything else?  Will gladly provide it.

Thanks!

--=20
Travis Crook
Visions Beyond
www.VisionsBeyond.com
(208) 478-7836

> ~piranha
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Travis =
Crook
> Sent: Monday, February 14, 2005 9:08 AM
> To: netfilter@lists.netfilter.org
> Subject: ftp behind the firewall
>=20
>=20
> Hi all,
> 	I would like to ask a question just for clarification.  I have a
> firewall up and running just fine.  My problem is that I cannot ftp
> through the firewall on a linux machine.  My windows machines don't =
seem
> to have this problem.  Am I missing something?  Or is it a local linux
> computer configuration issue.  I'll gladly provide any necessary
> information.
>=20
> Thanks!
>=20
>=20



