From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT and local hosts
Date: Mon, 7 May 2007 18:01:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705071801150.17280@yvahk01.tjqt.qr>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pieter De Wit <Pieter.DeWit@vodacom.co.za>
Cc: netfilter@lists.netfilter.org


On May 7 2007 17:54, Pieter De Wit wrote:
>
>Now, all connections are routed out via FW:ppp0 and at NAT'ed. There is
>a rule that allows connections to ppp0 on port 1234 and DNAT's them to
>C1. When C2 makes a connection to 1.2.3.4:1234 it fails with "Connection
>refused" since there is no "server" listening on the firewall's
>ppp0,port 1234.

*BEEP* *BUZZ* *ERROR*. You have a direct connection between C1 and C2.


Jan
-- 

