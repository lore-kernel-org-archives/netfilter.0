From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: Masquerading
Date: Fri, 31 Oct 2003 11:19:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8DC4@overlord.overturemedia.com>
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

I hope you can help me again with this.
We have remote data centers.=20
Only 2 remaining centers are not connected by WAN.

This my current situation:
workstation --- firewall dc#1 --- internet --- firewall dc#2 --- server


Would this be possible with iptables through masquerading:
workstation #1 --- firewall dc#1 --- internet --- firewall dc#2 --- =
server #1
workstation #2 --- firewall dc#1 --- internet --- firewall dc#2 --- =
server #1

It means only one ip address from data center #1 is allowed to access =
the server in data center #2.

I need to share workstations 1 & 2 to use the only ip address from data =
center #1 allowed to access the server in data center #2.

Thanks in advance.


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


