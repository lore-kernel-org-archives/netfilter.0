From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables VLAN filtering
Date: Mon, 07 Feb 2011 10:24:13 +0100
Message-ID: <4D4FBA3D.6000500@plouf.fr.eu.org>
References: <4D4F4E43.6090000@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4F4E43.6090000@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Jonathan Tripathy a =E9crit :
>=20
> With ebtables, is it possible to filter via the VLAN interface (e.g.=20
> eth0.3 for VLAN3) using the normal -i and -o parameters? I'd like to=20
> filter via the interface rather than using the tag with --vlan-id if=20
> possible

It depends whether you added the raw interface eth0 or the VLAN
interface eth0.3 to the bridge. If you added the raw interface eth0,
then the bridge and ebtables should see tagged frames in all VLANs
from/to eth0. If you added the VLAN interface eth0.3, then the bridge
and ebtables should see untagged frames in VLAN 3 from/to eth0.3.
