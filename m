From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: samba
Date: Thu, 4 Sep 2003 14:51:35 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C21F@overlord.overturemedia.com>
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


Hello folks!

I can't seem to make samba and iptables work properly...

$IPT =3D /usr/sbin/iptables

# port fritz/samba
1) $IPT -A INPUT -i eth0 -p tcp -s 190.200.2.111 --dport 137:139 -j LOG =
--log-level DEBUG --log-prefix "SAMBA: "
2) $IPT -A INPUT -i eth0 -p udp -s 190.200.2.111 --dport 137:138 -j LOG =
--log-level DEBUG --log-prefix "SAMBA: "

3) $IPT -A INPUT -i eth0 -p tcp -s 190.200.2.111 --dport 137 -j ACCEPT
4) $IPT -A INPUT -i eth0 -p tcp -s 190.200.2.111 --dport 138 -j ACCEPT
5) $IPT -A INPUT -i eth0 -p tcp -s 190.200.2.111 --dport 139 -j ACCEPT

6) $IPT -A INPUT -i eth0 -p udp -s 190.200.2.111 --dport 137 -j ACCEPT
7) $IPT -A INPUT -i eth0 -p udp -s 190.200.2.111 --dport 138 -j ACCEPT
8) $IPT -A INPUT -i eth0 -p udp -s 190.200.2.111 --dport 139 -j ACCEPT


Line numbers 5, 6 and 7 seem to be logging some packets.
But when I turn the firewall off and contact samba it works even if I =
turn the firewall back on.
If I access Samba again after rebooting my computer it says... =
"Microsoft Windows Network: The local device name is already in use."

Hope you can help me. Thanks.



fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord=20

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
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


