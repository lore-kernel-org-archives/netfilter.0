From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: Iptables, nat, and IPSec
Date: Wed, 06 Apr 2005 07:42:55 -0400
Message-ID: <1112787776.5140.1.camel@jasiiitosh.nexusmgmt.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA+1cYJf7sR0Sh2A7HkLkwFgEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA+1cYJf7sR0Sh2A7HkLkwFgEAAAAA@rogers.com>
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
Content-Type: text/plain; charset="utf-8"
To: dave beach <drbeach@rogers.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2005-04-06 at 07:10 -0400, dave beach wrote:
>  > It=C2=B4s an IPSec problem. I don=C2=B4t want to go into detail but yo=
u probably
> should try NAT-Traversal.
>  > For the theory http://www.ipsec-howto.org/x180.html
>=20
> Okay, I've read the reference. If I understand correctly, I need to use a
> NAT methodology that implements "NAT Traversal" (the reference is a littl=
e
> vague on this; in fairness, it does say "There are no RFCs at the moment"=
).
> It might be therefore fair to say that the Linksys implementation include=
s
> NAT Traversal, enabling it to handle multiple IPSec passthrough connectio=
ns.
>=20
> Which leads me to what I suppose was the original question, now slightly
> modified: does iptables support NAT Traversal?
>=20
I did not read your original post but, in direct answer to your last
question, yes, we do NAT-T through and to iptables firewalls all the
time on the ISCS network security management project
(http://iscs.sourceforge.net) - John
--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


