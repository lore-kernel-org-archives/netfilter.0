From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: iptables and udp socket
Date: Tue, 19 Jul 2005 19:23:41 +0200 (CEST)
Message-ID: <freemail.20050619192341.23844@fm13.freemail.hu>
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

I'm quite new to netfilter/iptables, I have been using it for some weeks.=
=20
I would like to ask if it may lead to undeterministic behaviour of iptables=
=20
when an udp socket is opened on an IP:port while in parallel iptables=20
rules (NAT) are setup that forward all incoming packets received on=20
that IP:port to a different destination. So I just want to use the socket=
=20
for sending out packets on it, while incoming packets should be=20
forwarded to other destination. But sometimes the packets are=20
received on the socket, sometimes they are forwarded. So iptables=20
don't have always the expected effect.
I use Debian with iptables 1.2.11.

What is your opinion?

Best regards,
Kornel Keseru=0A=0A________________________________________________________=
_______________=0A[freemail] extra 1GB-os postafi=F3kkal, =D6nnek m=E1r van=
? http://freemail.hu=0A=0A

