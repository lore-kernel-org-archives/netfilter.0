From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: pop3 and dns
Date: Wed, 5 May 2004 12:42:56 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E7164455@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


> From what you show above, it's difficult to say. Are you using nat and
> private ips on the inside?=20
> Are you just forwarding all traffic via your
> iptables router and all your clients have public ips?=20
> Are you using private ips on the inside and doing nat at the router?

Yes. We have public ips on the outside while we have private ips on the =
inside doing nat through iptables and not through the router as we do =
not have control of the router.

For example,

202.78.90.166 <-> iptables <-> 192.168.247.11
202.78.90.166 <-> iptables <-> 192.168.247.12

For web browsing I have squid proxy. So normally, clients do not have to =
resolve domain names as squid proxy does it for them. Now I need to =
allow clients to resolve domain names to be able to retrieve pop3 from =
their other mail servers.

Thanks again!



Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord

----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.=20

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


