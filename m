From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: iptables and yahoo games
Date: Fri, 28 Nov 2003 18:09:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8EF2@overlord.overturemedia.com>
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


Thanks Antony!


Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord




-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, November 28, 2003 5:54 PM
To: Netfilter Mailing List (E-mail)
Subject: Re: iptables and yahoo games


On Friday 28 November 2003 9:43 am, Antony Stone wrote:

> On Friday 28 November 2003 6:43 am, Fritz Mesedilla wrote:
> > Greetings friends!
> > What are the rules to allow yahoo games in iptables?
>
> Don't know.
>
> What TCP/UDP etc ports do the games use?
>
> If you can tell me that, I can tell you what rules to use.

PS: Just in case you don't know, remember that you can find this out by=20
putting a LOG rule at the end of your existing netfilter rules, trying =
to run=20
the games, and see what sort of packets get LOGged - this then tells you =
what=20
sort of packets you need to an insert an earlier rule ACCEPTing, and =
things=20
should start working.

Antony.

--=20
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

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


