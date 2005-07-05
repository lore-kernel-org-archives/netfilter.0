From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: SNAT rule in the POSTROUTING chain ignored?
Date: Tue, 5 Jul 2005 20:00:44 +0200 (CEST)
Message-ID: <freemail.20050605200044.90491@fm6.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dear List members,

I'm using iptables to rewrite the source address of UDP packets sent=20
out from a Debian machine. I use iptables 1.2.11.
For this purpose I setup one single rule in the nat table in the=20
POSTROUTING chain. I have a java application which sends UDP=20
packets to another machine. With this application the rewriting of the=20
source address works fine. But I have another C application that sends=20
UDP from the same IP address and port (than the java application did)=20
and in this case the source address is not rewritten. How is it possible?
I tried to debug the things in /var/log/kern.log and I found, that some=20
debug lines appear when the java application sends something, but=20
nothing appears when the C application sends.
Do you have any idea why iptables can not work for packets of the C=20
application altough it works for a java application?
Thank you for your help in advance.

Best regards,
Kornel Keseru
=0A=0A_____________________________________________________________________=
___________=0A[freemail] extra 1GB-os postafi=F3kkal, =D6nnek m=E1r van? ht=
tp://freemail.hu=0A=0A

