From: "Pieter De Wit" <Pieter.DeWit@vodacom.co.za>
Subject: DNAT and local hosts
Date: Mon, 7 May 2007 17:49:01 +0200
Message-ID: <C3FA62B1A90D7440B9B6C7C31895994F03663A2D@zadbn02100.vodacom.corp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hello Guys,
=20
I have the following setup:
=20
C1 --.
=20    |
=20    |-FW--- internet
=20    |
C2 --'

Ok - for this email, I will give C1 192.168.0.10 and C2 192.168.0.11.
The Firewall (FW) has two ethernet connections, eth0 and eth1. eth1 is
used to an adsl modem in bridged mode, which creates ppp0. Lets say for
this email, ppp0 get 1.2.3.4.

Now, all connections are routed out via FW:ppp0 and at NAT'ed. There is
a rule that allows connections to ppp0 on port 1234 and DNAT's them to
C1. When C2 makes a connection to 1.2.3.4:1234 it fails with "Connection
refused" since there is no "server" listening on the firewall's
ppp0,port 1234.

How can I solve this ? I need FW to DNAT "local/C2" connections back to
C1.

Thanks,

Pieter
=93This e-mail is sent on the Terms and Conditions that can be accessed b=
y Clicking on this link http://www.vodacom.co.za/legal/email.jsp "

