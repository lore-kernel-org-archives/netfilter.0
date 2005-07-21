From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: RST packets
Date: Thu, 21 Jul 2005 12:56:40 +0200
Message-ID: <42DF7F68.8060108@mnemon.de>
References: <Pine.LNX.4.61.0507210838001.19151@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507210838001.19151@yvahk01.tjqt.qr>
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

> What would be the use of RST if it is not part of a connection?
> Is it...vv?
>   A and B are connected
>   A crashes
>   B tries to send
>   A sends RST,!ACK

Yes, half-open connections. The other purpose is to recover from
duplicate SYNs, where SYN2 arrives before SYN1, which could confuse
TCPs. See figure 9 in RFC793, p. 32ff for a discussion of RST generation
and processing.

Have a nice time,

Joerg


