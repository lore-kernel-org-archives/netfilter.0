From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: iptables and dns from a windows farm
Date: Thu, 12 Feb 2004 17:25:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E71642F4@overlord.overturemedia.com>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


Thanks Antony! I test it right away!


Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord




-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Thursday, February 12, 2004 5:20 PM
To: Netfilter Mailing List (E-mail)
Subject: Re: iptables and dns from a windows farm


On Thursday 12 February 2004 8:54 am, Fritz Mesedilla wrote:

> Greetings friends,
> I'd like to ask for help on the rules that I need to allow windows =
farms
> behind a linux firewall be able to perform dns lookups. For example, =
open a
> command prompt, type nslookup, get the dns server and perform a query =
from
> there.

DNS uses TCP & UDP destination ports 53.

Surely even Microsoft can't find a weird way of doing that!?

Therefore your firewall should need no special rules to allow what you=20
describe above, other than what you need anyway to allow normal name=20
resolving to work for web browsing, email collection, etc:

iptables -A FORWARD -i $INT_IF -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i $INT_IF -p udp --dport 53 -j ACCEPT

If that doesn't work, don't forget the standard trick of putting a LOG =
rule at=20
the end of your FORWARD chain, try the nslookup (which will fail) and =
then=20
look at the packets which got LOGged from the IP address you attempted =
the=20
nslookup.   This will tell you what type of packets they were, and you =
can=20
add a rule to ACCEPT them.

Antony.

--=20
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a =
discovery.

 - Enrico Fermi

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



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


