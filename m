From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNAT to 127 fails
Date: Tue, 09 Aug 2005 12:20:12 +0200
Message-ID: <42F8835C.6030709@mnemon.de>
References: <Pine.LNX.4.61.0508051141020.31142@yvahk01.tjqt.qr>
	<42F33A8C.9060905@mnemon.de>
	<Pine.LNX.4.61.0508091150420.6879@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508091150420.6879@yvahk01.tjqt.qr>
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

Jan Engelhardt schrieb:
>>"-j DNAT" is not intended to DNAT to localhost. The REDIRECT target is
>>for this. From "man iptables":
> 
> 
> I guess this has to do with the recent 2.6.11->12 change that there is no more 
> implicit SNAT on -j DNAT, right? (Before, -j REDIRECT --to-ports ports was 
> equal to -j DNAT --to-dest 127.0.0.1:ports)

Don't know, but with my 2.4.31 it doesn't work too (maybe a backport ?).
Only -j REDIRECT works.

Have a nice time,

Joerg


