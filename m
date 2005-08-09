From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT to 127 fails
Date: Tue, 9 Aug 2005 11:51:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508091150420.6879@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0508051141020.31142@yvahk01.tjqt.qr>
	<42F33A8C.9060905@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42F33A8C.9060905@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org


>"-j DNAT" is not intended to DNAT to localhost. The REDIRECT target is
>for this. From "man iptables":

I guess this has to do with the recent 2.6.11->12 change that there is no more 
implicit SNAT on -j DNAT, right? (Before, -j REDIRECT --to-ports ports was 
equal to -j DNAT --to-dest 127.0.0.1:ports)



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

