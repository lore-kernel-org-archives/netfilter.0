From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: RV: Netmeeting support
Date: Thu, 15 Jan 2004 08:06:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074171983.3017.10.camel@jasiiitosh.nexusmgmt.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAVhoBvB30c0Skiv078oN7AwEAAAAA@perezoso.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAVhoBvB30c0Skiv078oN7AwEAAAAA@perezoso.net>
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
To: GoMi <gomi@perezoso.net>
Cc: netfilter@lists.netfilter.org

We could still use a lot more information about your environment but
here are some ideas about how to troubleshoot it.

1) How are you obtaining the 80.33.22.11 address? Are you typing it in
directly or using DNS? If DNS, are you sure it is returning the proper
address?

2) What packets are being put on the wire by your computer? I would
suggest using a package like ethereal (http://www.ethereal.com) to view
the packets.  What do they have for destination address?

3) What does the packet look like as it enters the firewall? Has
anything changed it along the way?

4) Is the packet making its way out of the firewall? What is the
destination address?

5) Are reply packets coming back to the firewall? If so, what is their
source address?

6) Are the reply packets making it through the firewall? If so, what is
their source address?

7) Are replies making it back to your workstation? If so, what is their
source address?

This way you can at least figure out where the problem is and if indeed
it is a netfilter problem.  I don't know that much about h.323 but I
believe it also embeds IP address information in the packet above the
network layer but I'm not sure of the offset.  You may want to look at
that part of the packet, too.  Good luck - John

On Thu, 2004-01-15 at 04:53, GoMi wrote:
> -----Mensaje original-----
> De: GoMi [mailto:gomi@perezoso.net]=20
> Enviado el: jueves, 15 de enero de 2004 10:48
> Para: 'John A. Sullivan III'
> CC: 'Ramin Dousti'; 'netfilter@lists.netfilter.org'
> Asunto: RE: Netmeeting support
>=20
>=20
> What i mean is, i have the patch applied, and built-in the kernel (not
> as a module) When i try to make a call to initialise a web-cam
> connection using netmeeting, unstead of saying ip 80.33.22.11 (a random
> public ip) the dialog box states: Trying to connect to 192.168.x.x.=20
>=20
> PD: This happens when i try to connect to a friend abroad :) I also have
> a fw setup with ports over 1024 closed to my clients.
>=20
> -----Mensaje original-----
> De: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]=20
> Enviado el: mi=C3=A9rcoles, 14 de enero de 2004 23:32
> Para: GoMi
> CC: 'Ramin Dousti'; netfilter@lists.netfilter.org
> Asunto: RE: Netmeeting support
>=20
>=20
> On Wed, 2004-01-14 at 17:09, GoMi wrote:
> <snip>
> > On Wed, Jan 14, 2004 at 09:43:06PM +0100, GoMi wrote:
> >=20
> > > Hi there, i have protocol h232 support patched by patch-o-matic, and
>=20
> > > my kernel recompiled with it, but when i try to have a webcam=20
> > > conversation via netmeeting, it tries to connect to local addresses=20
> > > unstead of public addresses. Any help?
> <snip>
> Could you explain further what you mean by it tries to connect to local
> addresses? My set up works fine.  I assume you are not trying to connect
> to a public address from your internal computer and it is magically
> changing the destination address to something local but I'm not sure
> what you do mean - John
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


