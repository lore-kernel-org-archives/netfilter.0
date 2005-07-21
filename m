From: <Chandra.Vempali@infineon.com>
Subject: MASQUERADING
Date: Thu, 21 Jul 2005 16:29:57 +0530
Message-ID: <04EE7AD0450F7B498BA216312943A1A102B5A7CA@blrse201.ap.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
I have a question on MASQUERADE

Suppose I masquerade ppp0 using
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

And now all packets will have a src ip addr as 192.168.0.2 will be
changed to that of ppp0 , for example say 10.10.10.1
Now my question is, when the reply comes, their destination addr will be
that of ppp0 i.e 10.10.10.1
Who will reverse translate this 10.10.10.1 destination addr to actual
192.168.0.2 ?

Thanks,

Chandra=20
*Disclaimer*
"This e-mail and any attachments are confidential and may contain trade
secrets or privileged or undisclosed information. They may also be
subject to copyright protection. Please do not copy, distribute or
forward this email to anyone unless authorised. If you are not a named
addressee, you must not use, disclose, retain or reproduce all or any
part of the information contained in this e-mail or any attachments. If
you have received this email by mistake please notify the sender
immediately by return email and destroy/delete all copies of the email."


