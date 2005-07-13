From: <Chandra.Vempali@infineon.com>
Subject: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 14:35:28 +0530
Message-ID: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>
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

For me, ip_conntrack_ftp does not work for PASSIVE ftp.

In the firewall rules, I blocked everything and put the following rules,
iptables -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED,NEW -j
ACCEPT=20
iptables -A OUTPUT -p tcp --dport 21 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT=20
And when I try to ftp, the control channel goes through firwall, but
data channel fails to pass through.
Is there any thing else I should add to the firewall rules to allow ftp
data through firwall.
Any help will be highly appreciated.
Regards,
Chandra

*Disclaimer*
"This e-mail and any attachments are confidential and may contain trade
secrets or privileged or undisclosed information. They may also be
subject to copyright protection. Please do not copy, distribute or
forward this email to anyone unless authorised. If you are not a named
addressee, you must not use, disclose, retain or reproduce all or any
part of the information contained in this e-mail or any attachments. If
you have received this email by mistake please notify the sender
immediately by return email and destroy/delete all copies of the email."


