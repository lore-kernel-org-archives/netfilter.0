From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: FW: logging a range of ips
Date: Mon, 3 Nov 2003 14:08:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8DD7@overlord.overturemedia.com>
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


Sorry for sending that too quickly.

Here is what I want to achieve...
$IPTABLES -A INPUT -p tcp -s 190.201.0.0 -j LOG --log-level DEBUG =
--log-prefix "***LOGTCP: "
$IPTABLES -A INPUT -p udp -s 190.201.0.0 -j LOG --log-level DEBUG =
--log-prefix "***LOGUDP: "

It doesn't seem to work. I want to log all transactions of the network =
of 190.201.x.x.

Thanks.

Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Fritz Mesedilla=20
> Sent: Monday, November 03, 2003 2:07 PM
> To: Netfilter Mailing List (E-mail)
> Subject: logging a range of ips
>=20
>=20
>=20
> Greetings!
> How do I log a range of ips?
>=20
>=20
> Cheers,
>=20
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>=20
>=20

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


