From: "John A. Novak" <jnovak@blueshiftinc.com>
Subject: RE: DMZ trouble!
Date: Wed, 8 Jan 2003 20:22:32 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F635E25A78F69C41B85DC6CB18972A9A474721@kepler.blueshiftinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: David Collodel <dave@crawlspaceradio.com>, netfilter@lists.netfilter.org

Do you have rules that allow traffic to be forwarded from the LAN to the =
DMZ and back ?

John Novak

-----Original Message-----
From: David Collodel [mailto:dave@crawlspaceradio.com]
Sent: Wednesday, January 08, 2003 7:43 PM
To: netfilter@lists.netfilter.org
Subject: DMZ trouble!


Hi,

I've recently been working on a firewall using IPtables to create a
DMZ/LAN setup.

I have a system with 3 NIC's.=20

eth0 has the "real" static IP's from my ISP. I'm using NAT to translate
from the IP bound on this NIC to the internal DMZ and LAN hosts.
eth1 is set to 172.16.12.1 and is used as the DMZ interface. Hosts
connected to this interface are all 172.16.12.x
eth2 is set to 172.16.11.1 and is used as the LAN interface.Hosts
connected here are all 172.16.11.x

Most things seem to be working, I can connect from the LAN to the DMZ
and to the Internet. I can connect from the DMZ to the Internet, but not
to the LAN, but already established connections work. Only the ports I
specify are open from the Internet to the DMZ.

The problem I'm having is this:

When I try to connect to a host in the DMZ from the LAN, it does not
work when I use the "real" IP address.

An example of the error in the logs is this:
-----
IPT INPUT packet died: IN=3Deth1 OUT=3D
MAC=3D00:10:5a:1b:48:8a:00:10:5a:00:ff:b8:08:00 SRC=3D172.16.11.2
DST=3D66.92.171.152 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D3514 =
DF PROTO=3DTCP
SPT=3D32949 DPT=3D80 WINDOW=3D5440 RES=3D0x00 SYN URGP=3D0
----

Does anyone have any idea why this might be happening?

Much thanks.

--=20
David Collodel <dave@crawlspaceradio.com>



