From: "Zenker, Olaf" <Olaf.Zenker@t-systems.com>
Subject: Help tftp_conntrack crashes firewall
Date: Fri, 28 Jun 2002 10:41:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <09F56C88AB13D5119B65000347232A5CD52CA0@G8PNV.blf01.telekom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Hello,

I've got a problem here with the tftp_conntrack module.
I use vlans on my firewall interfaces. All working well.
Except when I download router-configs via tftp, then the complete =
Firewall crashes.

Anyone has seen similar??

(OK, now my workarround is to allow tftp from router to =
management-station, and as second rule all UDP-High Ports back to the =
routers, but it's not my prefered solution).
If tftp_conntrack would work, I wouldn't need this second rule.

FYI:
The firewall has kernel 2.4.18 with iptables stuff compiled as modules =
(1.2.6a).

BTW: I have a second firewall, the same config, except I don't use =
vlans there. In this combination, the tftp-Modul works perfectly.
So I guess it has something to do with vlans.
Someone has a clue??

Thanks for your replies.



	Mit freundlichen Gr=FC=DFen
	with best regards

	Olaf Zenker

	T-Systems International GmbH
	Global Solution Management-
	Systemmanagement=20
	Sohnstr.45, 40237 D=FCsseldorf

	Fon: (02 11) 91 48-6 20
	Fax: (02 11) 91 48-9 75
	Mobile: (01 70) 3 44 87 53

	E-Mail:olaf.zenker@t-systems.com
	Internet: http://www.t-systems.com



