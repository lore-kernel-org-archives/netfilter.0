From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: pop3 and dns
Date: Tue, 4 May 2004 17:40:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
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


Greetings!
I have been looking for the answer to this through google...

How do I allow POP3 through my iptables rules?

I have done this...
$IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT

I included the dns forward rule to allow the internal clients to be able =
to resolve pop3 domain names.=20

The problems:
1) They still can't resolve domain names.
2) POP3 can't seem to pass through going outside from the internal =
clients.

Please advise me to what I still need to add. Thanks.

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


