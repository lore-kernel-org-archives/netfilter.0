From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: firewalled dns clients
Date: Mon, 10 Nov 2003 13:01:03 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8E3F@overlord.overturemedia.com>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: "Netfilter \"Mailing List (E-mail)" <netfilter@lists.netfilter.org>


Thanks Goetz and Chris!

I'll try that now. Sorry for the late reply. Just got in the office.


Cheers,

fritz <www.mesedilla>
---
+ Basta Ikaw Lord


-----Original Message-----
From: Chris Brenton [mailto:cbrenton@chrisbrenton.org]
Sent: Friday, November 07, 2003 6:33 PM
To: Fritz Mesedilla
Cc: Netfilter "Mailing List (E-mail)
Subject: Re: firewalled dns clients


On Thu, 2003-11-06 at 22:49, Fritz Mesedilla wrote:
>
> I tried this and nothing happened.
> $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> even a
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT

Try:
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.x
iptables -A FORWARD -p udp -i eth1 -s y.y.y.y -d 0/0 --dport 53 -j
ACCEPT
iptables -A FORWARD -p tcp -i eth1 -s y.y.y.y -d 0/0 --dport 53 -j
ACCEPT

x.x.x.x =3D Firewall's legal external IP address=20
y.y.y.y =3D internal private subnet=20
eth0 =3D external interface (change to eth1 if needed)
eth1 =3D internal interface (change to eth0 if needed)

HTH,
C



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


