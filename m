From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: securing windows farm  using iptables
Date: Fri, 24 Oct 2003 14:45:58 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C257@overlord.overturemedia.com>
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
To: netfilter@lists.netfilter.org


As our network is part of a large network, we cannot rely on our mother =
company to protect us sub companies.

I have been helped by a lot of our list members about subnets and proper =
iptables usage.=20
I thank you for the assistance you have given me.=20
This time, I have a bigger problem.

How can I protect a windows exchange server and domain controller?
windows farm --- linux iptables -- internet

Again, I cannot change the windows exchange to linux postfix.=20
Although it is within my authority to move to linux, hundreds of people =
using the windows farm won't be glad for a drastic change. I am slowly =
moving some people to linux though. :D

For the exchange server, what ports do I need to open? Do I need some =
port forwarding? I want to create some sort of routing through iptables =
so I can secure the windows server as well.

For the domain controller, people said I need to make sure dns is open. =
What else do I need to open up? Again, can I just do some routing for =
the dns?

Thank you so much for the help!



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


