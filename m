From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Fedora 3 + netfilter 1.2.11 + FXP
Date: Wed, 9 Mar 2005 09:56:10 +0100
Message-ID: <C530C43619DA8F459D7A1A4DADE00EB1DD17@knowledge.wizdom.nu>
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
To: netfilter@lists.netfilter.org

Why don't you just reserve an IP address for this client in your DHCP
server? That would be my choice, to ensure the client would have a
static IP.
Iptable  always adds IP's to chains, never hostnames. It actually does a
reversed look-up when you do an iptables -N.
You could ofcourse also write some spiffy script, to update your chains
with the clients new IP address, when it changes, but that would be
overkill I think.
BTW, ssh when used with pub/priv key authentication is perfectly safe.

Hope this helps.

PS. Disregard last one I sent on this one, belongs to other topic.

Why does list e-mail adress appear in CC, not in TO. This is very
unhandy replying to the list. I now replied twice to people personally.
Appologies for the spam.

-----Original Message-----
From: Kenneth Kalmer [mailto:kenneth.kalmer@gmail.com]=20
Sent: Wednesday, March 09, 2005 9:11 AM
To: Sietse van Zanen
Cc: netfilter@lists.netfilter.org
Subject: Re: Fedora 3 + netfilter 1.2.11 + FXP

I'm not too sure, but isn't FXP enabled or disabled in the FTP server?
As I understand it, when you do an FXP transfer you're asking FTP
server A to upload on your behalf to FTP server B. It's a normal FTP
'transaction' in every sense except that the files don't originate
from your box.

I could be wrong, but I hope this helps.


On Mon, 7 Mar 2005 13:03:23 +0100, Sietse van Zanen <sietse@wizdom.nu>
wrote:
> Hello,
>=20
> I am running a standard installation of Fedora Core 3
(2.6.10-1.770.FC3)
> & netfilter 1.2.11
>=20
> Is there anybody here that can give me an answer to the following
> question:
>=20
> Is it possible to enable FXP in this configuration? (above config, no
> new kernel compiling, patching etc)
>=20
> If possible, how can I enable it?
>=20
> I tried putting add options ip_conntrack_ftp fxp=3D1 in
/etc/modules.conf,
> but this doesn't help
>=20
> Spent all morning wading through the web and all the years old
> documentation available, but I haven't found what I was looking for.
> Found some stuff about this ftp-fxp patch, but that too seems legacy
for
> very old version.
>=20
> Greets,
>=20
> Sietse
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

