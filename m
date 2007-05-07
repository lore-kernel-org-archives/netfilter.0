From: "Pieter De Wit" <Pieter.DeWit@vodacom.co.za>
Subject: RE: DNAT and local hosts
Date: Mon, 7 May 2007 21:54:43 +0200
Message-ID: <C3FA62B1A90D7440B9B6C7C31895994F08041C@zadbn02100.vodacom.corp>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
	<Pine.LNX.4.61.0705071801150.17280@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

*BEEP* *BUZZ* I know - but it's for a closed source app that I need to do=
=20this - and it takes the address from the server, the protocol doesn't =
carry it it :)


-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@linux01.gwdg.de]
Sent: Mon 2007/05/07 18:01
To: Pieter De Wit
Cc: netfilter@lists.netfilter.org
Subject: Re: DNAT and local hosts
=20

On May 7 2007 17:54, Pieter De Wit wrote:
>
>Now, all connections are routed out via FW:ppp0 and at NAT'ed. There is
>a rule that allows connections to ppp0 on port 1234 and DNAT's them to
>C1. When C2 makes a connection to 1.2.3.4:1234 it fails with "Connection=

>refused" since there is no "server" listening on the firewall's
>ppp0,port 1234.

*BEEP* *BUZZ* *ERROR*. You have a direct connection between C1 and C2.


Jan
--=20

=93This e-mail is sent on the Terms and Conditions that can be accessed b=
y Clicking on this link http://www.vodacom.co.za/legal/email.jsp "

