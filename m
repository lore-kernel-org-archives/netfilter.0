From: "GoMi" <gomi@perezoso.net>
Subject: RV: Netmeeting support
Date: Thu, 15 Jan 2004 10:53:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAVhoBvB30c0Skiv078oN7AwEAAAAA@perezoso.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: john.sullivan@nexusmgmt.com



-----Mensaje original-----
De: GoMi [mailto:gomi@perezoso.net]=20
Enviado el: jueves, 15 de enero de 2004 10:48
Para: 'John A. Sullivan III'
CC: 'Ramin Dousti'; 'netfilter@lists.netfilter.org'
Asunto: RE: Netmeeting support


What i mean is, i have the patch applied, and built-in the kernel (not
as a module) When i try to make a call to initialise a web-cam
connection using netmeeting, unstead of saying ip 80.33.22.11 (a random
public ip) the dialog box states: Trying to connect to 192.168.x.x.=20

PD: This happens when i try to connect to a friend abroad :) I also have
a fw setup with ports over 1024 closed to my clients.

-----Mensaje original-----
De: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]=20
Enviado el: mi=E9rcoles, 14 de enero de 2004 23:32
Para: GoMi
CC: 'Ramin Dousti'; netfilter@lists.netfilter.org
Asunto: RE: Netmeeting support


On Wed, 2004-01-14 at 17:09, GoMi wrote:
<snip>
> On Wed, Jan 14, 2004 at 09:43:06PM +0100, GoMi wrote:
>=20
> > Hi there, i have protocol h232 support patched by patch-o-matic, and

> > my kernel recompiled with it, but when i try to have a webcam=20
> > conversation via netmeeting, it tries to connect to local addresses=20
> > unstead of public addresses. Any help?
<snip>
Could you explain further what you mean by it tries to connect to local
addresses? My set up works fine.  I assume you are not trying to connect
to a public address from your internal computer and it is magically
changing the destination address to something local but I'm not sure
what you do mean - John
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





