From: "Chris Shipman" <listmail@odisok.net>
Subject: Odd Problem - Connecting to SMTP
Date: Sun, 4 Sep 2005 13:49:00 -0500
Message-ID: <027a01c5b188$e13172b0$0ac8a8c0@defiant>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

    I have a strange problem.      When I try to connect to a mail =
server from my linux router it can't connected to port 25.   It seems =
like only port 25 is affected.
The WAN port is DHCP and the LAN is set static with NAT enabled on =
outbound.

    However a computer behind my linux router has no trouble connecting =
to port 25.    It's only when I try to connect from the linux router =
itself.   I'm using IPTables 1.3.3

    Does anyone have an idea of what is causing this?

Regards,


Chris
