From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: pop3 and dns
Date: Fri, 7 May 2004 13:21:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E716445C@overlord.overturemedia.com>
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

> By the way, what made you decide to use 192.167.220.x=20
> addresses for your=20
> clients?   That is not a reserved address range, and is part=20
> of a block=20
> registered to the University of Ferrara in Italy.

- It was assigned to me by our mother company.


> Other information which would be useful if we need to answer any more=20
> questions are: what interface names on the firewall connect=20
> to the inside and=20
> outside, and how have you interconnected the two different=20
> network ranges you=20
> appear to be using 192.168.247.x and 192.167.220.x ?

eth0=20
 - for the external ip addresses
 - used by the internet to receive postfix mail that is relayed inside =
to an exchange server

eth1
 - used by internal clients


diagram:

    internet
       |
       |
eth0 (192.168.247.xxx)
       |
 firewall server
       |
eth1 (192.167.220.xxx)
       |
       |
internal clients






> Where is the DNS server which the clients are expected to=20
> access for this?  =20
> Are you running one on your network (good idea) or are they=20
> supposed to=20
> access one run by your ISP (works, but will be slower and=20
> uses a bit more=20
> bandwidth)?

- we are using our isp's dns. we do not run our own dns.

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


