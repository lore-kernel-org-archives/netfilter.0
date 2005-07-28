From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: prerouting logging
Date: Thu, 28 Jul 2005 08:29:01 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507280750490.6616@yvahk01.tjqt.qr>
References: <42E79B51.1080206@eccotours.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E79B51.1080206@eccotours.dyndns.org>
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
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: iptables <netfilter@lists.netfilter.org>


> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG
                 ^^^^^^^^^^

There has also been a debate over whether -t nat should be used in favor of
-t filter and the answer was: do it in -t filter -A INPUT.

> #  FIN scan, nmap v3.0 sends ACK,FIN FIN

It send what matches --tcp-flags ALL FIN

> #  SYN,FIN SYN,FIN does not match nmap
> #  FIN FIN gets false positives when using SSH TARPIT
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -m state --state NEW
> -j LOG --log-prefix "PREROUTING: " --log-tcp-options --log-ip-options
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -m state --state NEW
> -j DROP
>
> Kind Regards and thanks in advance
> Brent Clark
>
> P.s. If anyone knows of any other rules I can add, it would be greatfully be
> appreciated.

You can make it simpler:
http://lists.netfilter.org/pipermail/netfilter/2005-July/061531.html


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

