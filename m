From: =?iso-8859-1?q?AmirS?= <serri_amir@yahoo.fr>
Subject: Ports stop responding some times :-(
Date: Fri, 2 Jul 2004 00:17:07 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040701221707.98643.qmail@web60801.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

After I set up the firewall (on redhat 7.2),
everything works fine for a few hours. But after a
while (not sure the exact amount of time), the
computer stops responding to requests on the open
ports (21,22,80).

Any help please ? :-(

--------------------------------------------
Chain INPUT (policy ACCEPT)
target prot opt source   destination=20
ACCEPT all  --  anywhere anywhere=20
ACCEPT tcp  --  anywhere anywhere tcp dpt:ftp=20
ACCEPT tcp  --  anywhere anywhere tcp dpt:ssh
ACCEPT tcp  --  anywhere anywhere tcp dpt:http=20
ACCEPT all  --  anywhere anywhere state
RELATED,ESTABLISHED=20
DROP   all  --  anywhere anywhere=20

Chain FORWARD (policy ACCEPT)
target prot opt source   destination=20

Chain OUTPUT (policy ACCEPT)
target prot opt source   destination=20


=09

=09
	=09
Cr=E9ez gratuitement votre Yahoo! Mail avec 100 Mo de stockage !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Dialoguez en direct avec vos amis gr=E2ce =E0 Yahoo! Messenger !T=E9l=E9cha=
rgez Yahoo! Messenger sur http://fr.messenger.yahoo.com

